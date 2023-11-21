<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use App\Services\PermissionGateAndPolicyAccess;
use App\Models\Category;
use App\Models\Product;
use App\Policies\CategoryPolicy;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
          // Define permission 
        $permissionGateAndPolicy = new PermissionGateAndPolicyAccess();
        $permissionGateAndPolicy->setGateAndPolicyAccess();
  
        

        Gate::define('menu-list', function ($user) {
            return $user->checkPermissionAccess(config('permissions.access.list-menu'));
        });

        Gate::define('product-edit', function ($user, $id) {
            $product = Product::find($id);
            if ( $user->checkPermissionAccess('product_edit') && $user->id === $product->user_id ) {
                return true;
            }
            return false;
        });


        Gate::define('product-list', function ($user) {
            return $user->checkPermissionAccess('product_list');
        });

        //  Gate::define('category-list', function (User $user, Category $post) {
        //     dd($user);
        //     //return $user->id === $post->user_id;
        // });
    }
    
}
