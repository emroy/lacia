@extends('layout.app')

@section('title', 'Inicio de Sesión')

@section('styles')
<link href="{{ asset('css/style.css') }}" rel="stylesheet">
@endsection

@section('body')
<body class="four-zero-four">
    <div class="four-zero-four-container">
        <div class="error-code">404</div>
        <div class="error-message">Esta página no existe</div>
        <div class="button-place">
            <a href="{{ route('home') }}" class="btn btn-default btn-lg waves-effect">IR A LA PÁGINA PRINCIPAL</a>
        </div>
    </div>
@endsection

@section('scripts')
<script src="{{ asset('js/admin.js') }}"></script>
<script src="{{ asset('js/pages/examples/sign-in.js') }}"></script>
<script src="{{ asset('plugins/jquery-validation/jquery.validate.js') }}"></script>
@endsection