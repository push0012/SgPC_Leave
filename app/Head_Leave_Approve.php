<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Head_Leave_Approve extends Model
{
    protected $table = 'head_leave_approves';

    protected $fillable = [
        'leave_type','leave_approve','deleted',
        'user_data','leave_id'
    ];
}
