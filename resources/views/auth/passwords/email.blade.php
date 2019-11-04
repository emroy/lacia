@extends('layout.app')

@section('title', 'Resetear Contraseña')

@section('styles')
<link href="{{ asset('css/style.css') }}" rel="stylesheet">
@endsection

@section('body')
<body class="fp-page">
    <div class="fp-box">
        <div class="card">
            <div class="body">
                <form id="forgot_password" method="POST">
                    <div class="msg">
                        <b>Introduzca su direccion de correo de registro, al cual enviaremos un correo de verificación</b>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">email</i>
                        </span>
                        <div class="form-line">
                            <input type="email" class="form-control" name="email" placeholder="Email" required autofocus>
                        </div>
                    </div>

                    <button class="btn btn-block btn-lg bg-pink waves-effect" type="submit">REINICIAR CONTRASEÑA</button>

                    <div class="row m-t-20 m-b--5 align-center">
                        <a href="{{ route('login') }}"><b>INICIAR SESION</b></a>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
<script src="{{ asset('js/admin.js') }}"></script>
<script src="{{ asset('js/pages/examples/sign-in.js') }}"></script>
<script src="{{ asset('plugins/jquery-validation/jquery.validate.js') }}"></script>
@endsection