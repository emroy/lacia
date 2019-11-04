@extends('layout.app')

@section('title', 'Inicio de Sesión')

@section('styles')
<link href="{{ asset('css/style.css') }}" rel="stylesheet">
@endsection

@section('body')
<body class="login-page">
    <div class="login-box">
        <div class="card">
            <div class="body">
                <form id="login">
                    <div class="msg"><b>INICIA SESIÓN</b></div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="{{ $username }}" placeholder="Nombre de Usuario" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="{{ $password }}" placeholder="Contraseña" required>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-xs-6 aligh-right">
                            <button class="btn btn-block bg-pink waves-effect" id="log-button">INICIAR SESIÓN</button>
                        </div>
                    </div>
                    <div class="row m-t-15 m-b--20">
                        <div class="col-xs-6">
                        <a href="{{ route('register') }}">Registrarse Ahora</a>
                        </div>
                        <div class="col-xs-6 align-right">
                        <a href="{{ route('password.request') }}">¿Olvidaste tu contraseña?</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
<script src="{{ asset('plugins/sweetalert/sweetalert.min.js') }}"></script>
<script src="{{ asset('js/pages/login.js') }}"></script>
@endsection