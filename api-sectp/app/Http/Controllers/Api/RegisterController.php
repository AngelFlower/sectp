<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;

class RegisterController extends Controller
{
    public function register(Request $request)
    {
        $this->validateRegister($request);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'user_type_id' => '1'
        ]);


        //save image
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/user_images');
            $image->move($destinationPath, $name);
            $user->image = $name;
            $user->save();
        }

        return response()->json(
            [
                'token' => $user->createToken($request->device_id)->plainTextToken,
                'message' => 'Success'
            ]
        );
    }

    protected function validateRegister(Request $request)
    {
        return $request->validate([
            'name' => 'required',
            'image' => 'nullable',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed',
            'device_id'
        ]);
    }
}
