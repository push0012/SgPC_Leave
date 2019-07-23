<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\User; 
use Auth; 
use Illuminate\Http\Request; 

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function login(Request $request){

        $credentials = [
            'email' => $request->email,
            'password' => $request->password
        ];
 
        if(Auth::attempt($credentials)) {

            $token = auth()->user()->createToken('MyApp')->accessToken;

            return response()->json([
                'token' => $token,
                'name' => auth()->user()->name
            ], 200);

        } else {

            return response()->json(['error' => 'UnAuthorised'], 401);

        }
    }
}
