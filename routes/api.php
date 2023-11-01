<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\BarangController;
use App\Http\Controllers\API\MasukController;
use App\Http\Controllers\API\KeluarController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::controller(RegisterController::class)->group(function () {
    Route::get('users', 'index');
    Route::post('register', 'register');
});

Route::post('login', [RegisterController::class, 'login'])->name('login');

Route::middleware('auth:sanctum')->group(function () {
    Route::get('barangs', [BarangController::class, 'index']);
    Route::post('barangs', [BarangController::class, 'store']);
    Route::get('barangs/{barang}', [BarangController::class, 'show']);
    Route::post('barangs/{barang}', [BarangController::class, 'update']);
    Route::delete('barangs/{barang}', [BarangController::class, 'destroy']);
});

Route::middleware('auth:sanctum')->group(function () {
    Route::get('masuks', [MasukController::class, 'index']);
    Route::post('masuks', [MasukController::class, 'store']);
    Route::get('masuks/{masuk}', [MasukController::class, 'show']);
    Route::post('masuks/{masuk}', [MasukController::class, 'update']);
    Route::delete('masuks/{masuk}', [MasukController::class, 'destroy']);
    
});

Route::middleware('auth:sanctum')->group(function () {
    Route::get('keluars', [KeluarController::class, 'index']);
    Route::post('keluars', [KeluarController::class, 'store']);
    Route::get('keluars/{keluar}', [KeluarController::class, 'show']);
    Route::post('keluars/{keluar}', [KeluarController::class, 'update']);
    Route::delete('keluars/{keluar}', [KeluarController::class, 'destroy']);
    
});