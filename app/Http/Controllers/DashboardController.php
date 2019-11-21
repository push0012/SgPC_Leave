<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use App\Employee;
use App\User;
use Illuminate\Support\Facades\Auth;


class DashboardController extends Controller
{
    public function users()
    {
        $userCount = Employee::count();
        return response()->json($userCount, 201);
    }

    public function samejob($username)
    {
        $job_id = Employee::select('job_id')->where('email', $username)->first();
        $same_role = Employee::where('job_id', $job_id->job_id)->where('email','<>',$username)->get();
        return response()->json($same_role, 201);
    } 

    public function supervisors()
    {
        $supervice = Employee::where('job_id', '<',6)->where('job_id', '>',1)->get();
        return response()->json($supervice, 201);
    }
}
