<?php

namespace App\Http\Controllers\Api\Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\ApiController;
use Illuminate\Support\Facades\Validator;

class LoginController extends ApiController
{

     /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->errorResponse($validator->errors(), 401);
        }

        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
            /** @var \App\Models\User $user **/
            $user = Auth::user(); 
            $success['token'] =  $user->createToken(request()->email)->plainTextToken;
            $success['name'] =  $user->name;
   
            return $this->sendResponse($success, 'User login successfully.');
        } 
        else{ 
            return $this->errorResponse('Unauthorised', 401);
        } 
    }


    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json(['message' =>
        'Successfully logged out']);
    }
}
