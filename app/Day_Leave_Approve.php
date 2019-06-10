<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Day_Leave_Approve extends Model
{
    protected $table = 'day_leave_approves';

    protected $primaryKey = 'flight_id';

    protected $fillable = [
        'leave_approve','legger_page','deleted',
        'user_data','dl_leave_id','emp_act_id',
        'supervising_officer'
    ];
}
