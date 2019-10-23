<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\User; 
use App\Role; 
use Auth; 
use Illuminate\Http\Request; 
use App\Http\Controllers\Auth\Hash;

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
        //$id = 1;
        $user = User::select('role_id')->where('email', $request->username)->first();
        $role = Role::find($user->role_id);
        if($role) {
            switch ($role->role_name) {
                case "developer":
                    $data = '*';
                    break;
                case "admin":
                    $data = ['report','create','edit','delete','show','view'];
                    break;
                case "super_user":
                    $data = ['report','approve','show','view'];
                    break;
                case "user":
                    $data = ['show'];
                    break;
                default:
                    break;
            }
        }
        return response()->json($data , 200);
    }
}
