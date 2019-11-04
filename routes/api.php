<?php

use Illuminate\Http\Request;

Route::post('/reporte', 'ApiController@readReport')->name('report_api');

Route::middleware('auth:api')->get('/user', function(){
    return $request->user();
});
