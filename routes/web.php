<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\AdminProductController;
use App\Http\Controllers\SliderAdminController;
use App\Http\Controllers\AdminSettingController;
use App\Http\Controllers\AdminUserController;
use App\Http\Controllers\AdminRoleController;
use App\Http\Controllers\AdminPermissionController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;


// Route::get('/', function () {
//     return view('welcome');
// });
// Route::get('/admin', [AdminController::class,'loginAdmin']);
// Route::post('/admin', [AdminController::class,'postLoginAdmin']);
// Route::get('/', 'AdminController@loginAdmin');
// Route::post('/', 'AdminController@postLoginAdmin');


Route::prefix('nd')->group(function () {
    Route::get('/', [HomeController::class,'index'])->name('nd');
    Route::get('/category/{slug}/{id}', [HomeController::class,'indexcategory'])->name('category.product');

    Route::get('/cart/{id}', [HomeController::class,'addToCart'])->name('addToCart');
    Route::get('/show-cart', [HomeController::class,'showCart'])->name('showCart');
    Route::post('/update-cart', [HomeController::class,'updateCart'])->name('updateCart');
    Route::get('/delete-cart/{rowId}', [HomeController::class,'deleteCart'])->name('deleteCart');

    Route::get('/detail/{id}', [HomeController::class,'detail'])->name('detail');
    Route::post('/detail/{id}', [HomeController::class,'postComment'])->name('postComment');
    
    Route::get('/search', [HomeController::class,'search'])->name('search');
    Route::get('/login-Checkout', [HomeController::class,'loginCheckout'])->name('loginCheckout');
    Route::get('/logout-Checkout', [HomeController::class,'logoutCheckout'])->name('logoutCheckout');
    Route::post('/add-customer', [HomeController::class,'add_customer'])->name('add_customer');
    Route::get('/checkout', [HomeController::class,'checkout'])->name('checkout');
    Route::post('/save-customer-checkout', [HomeController::class,'save_customer_checkout'])->name('save_customer_checkout');
    Route::post('/login-Customer', [HomeController::class,'loginCustomer'])->name('loginCustomer');
    Route::get('/payment', [HomeController::class,'payment'])->name('payment');
    Route::post('/payment', [HomeController::class,'orderPlace'])->name('orderPlace');
    
    
});
Route::get('/homes', [AdminController::class,'index'])->name('homes');
Route::post('/loc-theo-ngay', [AdminController::class,'locNgay'])->name('locNgay');
Route::post('/chon-hinh-thuc-loc', [AdminController::class,'chonLoc']);

// Route::prefix('categories')->group(function () {
//     Route::get('/create', [
//         'as' => 'categories.create',
//         'uses' => 'CategoryController@create'
//     ]);
// });

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
    \UniSharp\LaravelFilemanager\Lfm::routes();
}); 

Route::prefix('admin')->group(function (){
    Route::get('/', [AdminController::class,'loginAdmin'])->name('admin.login');
    Route::post('/', [AdminController::class,'postLoginAdmin'])->name('admin.post-login');
    Route::get('/logout', [AdminController::class,'logout'])->name('admin.logout');



    //Order
    Route::prefix('order')->group(function () {
        Route::get('/', [OrderController::class,'index'])->name('order.index');
        Route::get('/view/{orderCode}', [OrderController::class,'viewOrder'])->name('order.view');
        //Route::post('/view/{orderCode}', [OrderController::class,'updateOrderQty'])->name('updateOrderQty');
        Route::post('/updateOrderQty', [OrderController::class,'update_order_qty'])->name('updateOrderQty');
    });

    Route::prefix('categories')->group(function () {
        Route::get('/', [CategoryController::class,'index'])->name('categories.index')->middleware('can:category-list');
        Route::get('/create', [CategoryController::class,'create'])->name('categories.create')->middleware('can:category-add');
        Route::post('/store', [CategoryController::class,'store'])->name('categories.store');
        Route::get('/edit/{id}', [CategoryController::class,'edit'])->name('categories.edit')->middleware('can:category-edit');
        Route::post('/update/{id}', [CategoryController::class,'update'])->name('categories.update');
        Route::get('/delete/{id}', [CategoryController::class,'delete'])->name('categories.delete')->middleware('can:category-delete');
    });
    
    Route::prefix('menus')->group(function () {
        Route::get('/', [MenuController::class,'index'])->name('menus.index')->middleware('can:menu-list');
        Route::get('/create', [MenuController::class,'create'])->name('menus.create');
        Route::post('/store', [MenuController::class,'store'])->name('menus.store');
        Route::get('/edit/{id}', [MenuController::class,'edit'])->name('menus.edit');
        Route::post('/update/{id}', [MenuController::class,'update'])->name('menus.update');
        Route::get('/delete/{id}', [MenuController::class,'delete'])->name('menus.delete');
       
    });

    
    // Product
    Route::prefix('product')->group(function () {
        Route::get('/', [AdminProductController::class,'index'])->name('product.index')->middleware('can:product-list');
        Route::get('/search', [AdminProductController::class,'search'])->name('product.search');
        Route::get('/create', [AdminProductController::class,'create'])->name('product.create');
        Route::post('/store', [AdminProductController::class,'store'])->name('product.store');
        Route::get('/edit/{id}', [AdminProductController::class,'edit'])->name('product.edit')->middleware('can:product-edit,id');
        Route::post('/update/{id}', [AdminProductController::class,'update'])->name('product.update');
        Route::get('/delete/{id}', [AdminProductController::class,'delete'])->name('product.delete');
    });

    //Slider
    Route::prefix('slider')->group(function () {
        Route::get('/', [SliderAdminController::class,'index'])->name('slider.index');
        Route::get('/create', [SliderAdminController::class,'create'])->name('slider.create');
        Route::post('/store', [SliderAdminController::class,'store'])->name('slider.store');
        Route::get('/edit/{id}', [SliderAdminController::class,'edit'])->name('slider.edit');
        Route::post('/update/{id}', [SliderAdminController::class,'update'])->name('slider.update');
        Route::get('/delete/{id}', [SliderAdminController::class,'delete'])->name('slider.delete');
    });

    //Settings
    Route::prefix('settings')->group(function () {
        Route::get('/', [AdminSettingController::class,'index'])->name('settings.index');
        Route::get('/create', [AdminSettingController::class,'create'])->name('settings.create');
        Route::post('/store', [AdminSettingController::class,'store'])->name('settings.store');
        Route::get('/edit/{id}', [AdminSettingController::class,'edit'])->name('settings.edit');
        Route::post('/update/{id}', [AdminSettingController::class,'update'])->name('settings.update');
        Route::get('/delete/{id}', [AdminSettingController::class,'delete'])->name('settings.delete');
    });

    //User
    Route::prefix('users')->group(function () {
        Route::get('/', [AdminUserController::class,'index'])->name('users.index');
        Route::get('/create', [AdminUserController::class,'create'])->name('users.create');
        Route::post('/store', [AdminUserController::class,'store'])->name('users.store');
        Route::get('/edit/{id}', [AdminUserController::class,'edit'])->name('users.edit');
        Route::post('/update/{id}', [AdminUserController::class,'update'])->name('users.update');
        Route::get('/delete/{id}', [AdminUserController::class,'delete'])->name('users.delete');
    });

    ///role
    Route::prefix('roles')->group(function () {
        Route::get('/', [AdminRoleController::class,'index'])->name('roles.index');
        Route::get('/create', [AdminRoleController::class,'create'])->name('roles.create');
        Route::post('/store', [AdminRoleController::class,'store'])->name('roles.store');
        Route::get('/edit/{id}', [AdminRoleController::class,'edit'])->name('roles.edit');
        Route::post('/update/{id}', [AdminRoleController::class,'update'])->name('roles.update');
        
    });

    //Permissions
    Route::prefix('rolpermissionses')->group(function () {
        Route::get('/create', [AdminPermissionController::class,'createPermissions'])->name('permissions.create');
        Route::post('/store', [AdminPermissionController::class,'store'])->name('permissions.store');
    });
});




/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

