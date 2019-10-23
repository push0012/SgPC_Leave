<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Role;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
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
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    /*protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }*/

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    /*protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);
    }*/

    public function register(Request $request) 
    { 
        //return response()->json(['success'=>"hello"], 450);
        $validator = Validator::make($request->all(), [ 
            'name' => 'required', 
            'email' => 'required|email', 
            'role_id' => 'required',
            'password' => 'required', 
            'password_confirmation' => 'required|same:password', 
        ]);
                if ($validator->fails()) { 
                    return response()->json(['error'=>$validator->errors()], 401);            
                }
                $input = $request->all(); 

                $input['password'] = bcrypt($input['password']); 

                $user = User::create($input); 

               /* if($request->role_id == 1)
                {
                    $token = $user->createToken('GLMSystem', ['*'])->accessToken;
                }
                else if($request->role_id == 2)
                {
                    $token = $user->createToken('GLMSystem', ['report','create','edit','delete','show','view'])->accessToken;
                }
                else if($request->role_id == 3)
                {
                    $token = $user->createToken('GLMSystem', ['report','approve','show','view'])->accessToken;
                }
                else if($request->role_id == 4)
                {
                    $token = $user->createToken('GLMSystem', ['show'])->accessToken;
                }*/

                $success['user_id'] =  $user->id; 
                $success['email']   =  $user->email;
                //$success['token']   =  $token;
                return response()->json(['success'=>$success], 201); 
    }
}
