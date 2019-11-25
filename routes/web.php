<?php

/**
 * Rutas de Autenticación
 */
Auth::routes();

/**
 * Ruta raíz
 */
Route::get('/', function () {
    return redirect()->route('login');
});

/**
 * Route for authenticated people
 */
Route::middleware('authenticated')->group(function(){

    /**
     * Rutas de administrador
     */
    Route::middleware('admin')->group(function(){
        Route::post('/investor/save', 'InvestorController@saveAction')->name('save_inversor'); # Guardar nuevo Inversor
        Route::get('/admin', 'AdminController@index')->name('admin'); # Guardar nuevo Inversor
        Route::get('/investor/index', 'InvestorController@getInversionistas')->name('get_inversores'); # API obtener los inversores
        Route::post('/admin/cryptos', 'AdminController@getCryptos')->name('get_cryptos'); # API para obtener toda la información de cryptos
        Route::post('/admin/cryptos/activate', 'AdminController@activateCrypto')->name('activate_crypto'); # API para obtener toda la información de cryptos
    });

    /**
     * Rutas para el motor de consultas de APIs
     */
    Route::middleware('ajax')->prefix('engine')->group(function(){
        //Route::get('/balances', 'EngineController@balances')->name('engine_balances'); # Ruta para consultar balances totales
    });
    
    
    /**
     * Rutas para usuarios autenticados, usuarios no autenticados en estas rutas son redirigidos al login
     */
    Route::middleware('authenticated')->group(function(){
        
        Route::get('/home', 'HomeController@index')->name('home'); # Vista pagina principal de autenticados
        Route::get('/profile', 'HomeController@profile')->name('user_profile'); # Vista pagina principal de autenticados
        Route::get('/workers', 'WorkerController@index')->name('workers'); # Vista lista de workers
        Route::get('/workers/new', 'WorkerController@newAction')->name('new_worker'); # Vista nuevo worker
        Route::get('/locations', 'LocationController@index')->name('locations'); #Vista lista de locaciones
        Route::get('/locations/new', 'LocationController@newAction')->name('new_location'); # Vista nueva locacion
        Route::get('/investor/new', 'InvestorController@newAction')->name('new_investor'); # Formulario de nuevo inversor
        Route::get('/investor/data', 'InvestorController@mainData')->name('main_data'); # Toda la data principal del backend
        Route::post('/workers/update', 'WorkerController@updateActionFirst')->name('update_new_worker'); # Guardar nuevo Worker
        Route::post('/movimiento/new', 'InvestorController@newMovement')->name('new_movement'); # Nuevos movimientos

        Route::get('/balances', 'EngineController@balances')->name('engine_balances'); # Ruta para consultar balances totales

    });

    /**
     * Rutas para los resources
     */
    Route::get('/resource/exchanges', 'ResourcesController@exchanges')->name('resource_exchanges'); # Obtener los exchanges 
    Route::get('/resource/coins', 'ResourcesController@coins')->name('resource_coins'); # Obtener todas las cryptos en contexto del sistema
    Route::post('/resource/movimientos', 'ResourcesController@movimientos')->name('resource_movimientos'); # Obtener todos los movimientos
    Route::post('/transaction/data', 'InvestorController@getTransactions')->name('get_transactions'); # Obtener todas las transacciones de un solo usuario

    /**
     * Rutas de procesamiento con AJAX
     */
    Route::middleware('ajax')->group(function(){
        Route::get('/workers/list', 'WorkerController@workerListApi')->name('worker_list_api'); # Obtener todos los workers Ordenados por ultima actualizacio.
        Route::post('/transaction/archive', 'InvestorController@archiveTransaction')->name('archive_transaction'); # Obtener todas las transacciones de un solo usuarion.
        Route::post('/locations/save', 'LocationController@saveAction')->name('save_location'); # Guardar nueva locacion.
        Route::post('/workers/save', 'WorkerController@saveAction')->name('save_worker'); # Guardar nuevo Worker.
        Route::post('/exchange/save', 'InvestorController@saveExchange')->name('save_exchange'); # Guardar las API Keys de los usuarios.
    });
    
    Route::post('/transaction/new', 'InvestorController@newTransaction')->name('new_transaction'); # Ruta de nueva transacción
});