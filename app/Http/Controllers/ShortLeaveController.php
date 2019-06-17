<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Short_Leave;
use App\Head_Leave_Approve;
use App\Approval_Supervise;
use DB;

class ShortLeaveController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Short_Leave::all();
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

            $short_leaves = Short_Leave::create($request->all());

            $head_short_leave = new Head_Leave_Approve;

            $head_short_leave->leave_type = "sl";
            $head_short_leave->user_data = "Admin";
            $head_short_leave->leave_id = $short_leaves->sl_leave_id;
            $head_short_leave->save();

            $approval_supervise = new Approval_Supervise;

            $approval_supervise->leave_type = "sl";
            $approval_supervise->user_data = "Admin";
            $approval_supervise->leave_id = $short_leaves->sl_leave_id;
            $approval_supervise->supervising_officer = $request->supervising_officer;
            $approval_supervise->save();

            DB::commit();
       
            return response()->json([
                'short_leave'=> $short_leaves,
                'head'=> $head_short_leave,
                'supervise'=> $approval_supervise
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
