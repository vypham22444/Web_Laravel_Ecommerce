<?php

namespace App\Providers;

use App\Models\Category;
use App\Components\Recusive;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $recusive = new Recusive(Category::all());
        // $htmlOption = $recusive->categoryRecusive($parentId = '');
        // View::share('htmlOption', $htmlOption);
        $htmlOptionSearchHeader = $recusive->categoryRecusive($parentId = '');
        View::share('htmlOptionSearchHeader', $htmlOptionSearchHeader);
        Schema::defaultStringLength(191);
    }
}
