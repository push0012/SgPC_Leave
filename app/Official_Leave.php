<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Official_Leave extends Model
{
    protected $table = 'official_leaves';

    protected $primaryKey = 'ol_leave_id';

    protected $fillable = [
        'request_date','leave_desc','dates',
        'deleted','user_data',
        'emp_id'
    ];
}
