<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Approval_Supervise extends Model
{
    protected $table = 'approval_supervises';

    protected $primaryKey = null;
    public $incrementing = false;

    protected $fillable = [
        'leave_type','approve_supervise',
        'deleted','user_data',
        'leave_id','supervising_officer'
    ];
}
