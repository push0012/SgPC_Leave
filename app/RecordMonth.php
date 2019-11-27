<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RecordMonth extends Model
{
    protected $table = 'record_months';

    //protected $primaryKey = 'emp_id';
    protected $primaryKey = null;
    public $incrementing = false;

    protected $fillable = [
        'record_year','record_month','ol_count','sl_count','casual_count',
        'medical_count','user_id'
    ];
}