<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Job_Role extends Model
{
    protected $table = 'job_roles';

    protected $primaryKey = 'job_id';

    protected $fillable = [
        'job_title', 'job_rank', 'deleted', 'user_data'
    ];
}
