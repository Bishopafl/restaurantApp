<?php

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

Route::get('/', function () {
    return view('/home');
})->middleware('auth');

Auth::routes([
    'register' => false,
    'reset' => false
]);

Route::get('/home', 'HomeController@index')->name('home');

Route::middleware(['auth'])->group(function() {
   // Route for Cashier
    Route::get('/cashier', 'Cashier\CashierController@index');
    Route::get('/cashier/getMenuByCategory/{category_id}', 'Cashier\CashierController@getMenuByCategory');
    Route::get('/cashier/getTable', 'Cashier\CashierController@getTables');
    Route::get('/cashier/getSaleDetailsByTable/{table_id}', 'Cashier\CashierController@getSaleDetailsByTable');
    
    Route::post('/cashier/orderFood', 'Cashier\CashierController@orderFood');
    Route::post('/cashier/deleteSaleDetail', 'Cashier\CashierController@deleteSaleDetail');
    
    Route::post('/cashier/increase-quantity', 'Cashier\CashierController@increaseQuantity');
    Route::post('/cashier/decrease-quantity', 'Cashier\CashierController@decreaseQuantity');

    Route::post('/cashier/confirmOrderStatus', 'Cashier\CashierController@confirmOrderStatus');
    Route::post('/cashier/savePayment', 'Cashier\CashierController@savePayment');
    Route::get('/cashier/showReceipt/{saleID}', 'Cashier\CashierController@showReceipt');
});

Route::middleware(['auth', 'VerifyAdmin'])->group(function() {
     // checks if user is authenticated, if not they will go to login
     Route::get('/management', function () {
        return view('management.index');
    });
    
    // Routes for management
    Route::resource('/management/category', Management\CategoryController::class);
    Route::resource('/management/menu', Management\MenuController::class);
    Route::resource('/management/table', Management\TableController::class);
    Route::resource('/management/user', Management\UserController::class);
    
    // Routes for Report
    Route::get('/report', 'Report\ReportController@index');
    Route::get('/report/show', 'Report\ReportController@show');
    
    // Export to excel
    Route::get('/report/show/export', 'Report\ReportController@export');
});


