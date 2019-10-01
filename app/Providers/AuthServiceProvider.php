<?php

namespace App\Providers;

use Laravel\Passport\Passport;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
        Passport::tokensCan([
            'report' => 'can view reports',
            'edit' => 'can edit anything',
            'create' => 'can add anything',
            'delete' => 'can delete anything',
            'show' => 'can only show',
            'view' => 'can show every rows',
            'approve' => 'can approve any request',
            
        ]);
        Passport::routes();
    }
}
