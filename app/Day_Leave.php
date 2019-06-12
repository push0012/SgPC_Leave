<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Day_Leave extends Model
{
    protected $table = 'day_leaves';

    protected $primaryKey = 'dl_leave_id';

    protected $fillable = [
        'leave_title','leave_size','request_date',
        'leave_desc','start_date','end_date',
        'on_leave_address','legger_page',
        'deleted','user_data',
        'emp_id'
    ];
}
