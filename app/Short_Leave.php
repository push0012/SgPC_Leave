<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Short_Leave extends Model
{
    protected $table = 'short_leaves';

    protected $primaryKey = 'sl_leave_id';

    protected $fillable = [
        'request_date','leave_desc','start_time','end_time',
        'deleted','user_data',
        'emp_id'
    ];
}
