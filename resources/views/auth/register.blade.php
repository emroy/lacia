@extends('layout.app')

@section('title', 'Registro')

@section('styles')
<link href="{{ asset('css/style.css') }}" rel="stylesheet">
<link href="{{ asset('plugins/sweetalert/sweetalert.css') }}" rel="stylesheet">
@endsection

@section('body')
<body class="signup-page">
    <div class="signup-box">
        <div class="card">
            <div class="body">
                <form id="registro">
                    <div class="msg"><b>REGISTRARSE AHORA</b></div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" maxlength="128" name="{{ $username }}" placeholder="Nombre de Usuario" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" maxlength="128" name="{{ $apelnomb }}" placeholder="Nombre Completo" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">email</i>
                        </span>
                        <div class="form-line">
                            <input type="email" class="form-control" maxlength="30" name="{{ $correo }}" placeholder="Correo" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" maxlength="32" name="{{ $password }}" minlength="6" placeholder="Contraseña" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" maxlength="32" name="confirm" minlength="6" placeholder="Confirmar Contraseña" required>
                        </div>
                    </div>
                    {{-- <div class="form-group">
                        <input type="checkbox" name="terms" id="terms" class="filled-in chk-col-pink">
                        <label for="terms">I read and agree to the <a href="#">terms of usage</a>.</label>
                    </div> --}}
                    <button class="btn btn-block btn-lg bg-pink waves-effect" id="registerBtn">REGISTRAR</button>

                    <div class="m-t-25 m-b--5 align-center">
                        <a href="{{ route('login') }}">¿Ya eres miembro?</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

@endsection

@section('scripts')
<script src="{{ asset('plugins/sweetalert/sweetalert.min.js') }}"></script>
<script src="{{ asset('js/pages/register.js') }}"></script>
@endsection
