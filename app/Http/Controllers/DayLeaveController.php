<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Day_Leave;
use App\Head_Leave_Approve;
use App\Approval_Acting;
use App\Approval_Supervise;
use DB;

class DayLeaveController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Day_Leave::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {   
        DB::beginTransaction();
  
        try 
        {
            $day_leaves = Day_Leave::create($request->all());

            $head_day_leave = new Head_Leave_Approve;

            $head_day_leave->leave_type = "dl";
            $head_day_leave->user_data = "Admin";
            $head_day_leave->leave_id = $day_leaves->dl_leave_id;
            $head_day_leave->save();

            $approval_acting = new Approval_Acting;

            $approval_acting->user_data = "Admin";
            $approval_acting->dl_leave_id = $day_leaves->dl_leave_id;
            $approval_acting->emp_act_id = $request->emp_act_id;
            $approval_acting->save();

            $approval_supervise = new Approval_Supervise;

            $approval_supervise->leave_type = "dl";
            $approval_supervise->user_data = "Admin";
            $approval_supervise->leave_id = $day_leaves->dl_leave_id;
            $approval_supervise->supervising_officer = $request->supervising_officer;
            $approval_supervise->save();

            DB::commit();

            return response()->json([
                'day_leave'=>$day_leaves,
                'head'=>$head_day_leave,
                'acting'=>$approval_acting,
                'supervise'=>$approval_supervise
            ], 201);
            
        }catch (\Exception $e) {

            DB::rollback();
            
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
