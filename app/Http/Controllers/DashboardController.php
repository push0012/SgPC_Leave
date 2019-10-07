<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Employee;


class DashboardController extends Controller
{
    public function users()
    {
        $userCount = Employee::count();
        return response()->json($userCount, 201);
    }
}
