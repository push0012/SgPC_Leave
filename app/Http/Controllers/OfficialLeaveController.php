<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Official_Leave;
use App\Head_Leave_Approve;
use DB;

class OfficialLeaveController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Official_Leave::all();
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
            $official_leaves = Official_Leave::create($request->all());

            $head_official_leave = new Head_Leave_Approve;

            $head_official_leave->leave_type = "ol";
            $head_official_leave->user_data = "Admin";
            $head_official_leave->leave_id = $official_leaves->ol_leave_id;
            $head_official_leave->save();
            
            DB::commit();

            return response()->json([
                'official_leave'=> $official_leaves,
                'head'=> $head_official_leave
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
