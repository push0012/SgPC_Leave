<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Approval_Acting extends Model
{
    protected $table = 'approval_actings';

    protected $fillable = [
        'approve_acting',
        'deleted','user_data',
        'dl_leave_id','emp_act_id'
    ];
}
