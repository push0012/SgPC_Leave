<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $table = 'employees';

    protected $primaryKey = 'emp_id';

    protected $fillable = [
        'title','emp_name','sex','nic','mobile',
        'email','joined_date','nine_month',
        'deleted','user_data','job_id'
    ];
}
