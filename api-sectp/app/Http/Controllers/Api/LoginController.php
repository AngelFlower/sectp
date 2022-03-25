<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $this->validateLogin($request);

        if (Auth::attempt($request->only('email', 'password'))) {
            return response()->json(
                [
                    'token' => $request->user()->createToken($request->device_id)->plainTextToken,
                    'message' => 'Success'
                ]
            );
        }

        return response()->json(
            [
                'message' => 'Unauthorized'
            ],
            401
        );
    }

    protected function validateLogin(Request $request)
    {
        return $request->validate([
            'email' => 'required|string',
            'password' => 'required|string',
            'device_id' => 'required',
        ]);
    }

    public function logout(Request $request)
    {
         $request->user()->tokens()->where('name', $request->device_id)->delete();
        
        return response()->json(
            [
                'message' => 'Successfully logged out'
            ]
        );
    }
}
