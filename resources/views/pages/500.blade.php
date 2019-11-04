@extends('layout.app')

@section('title', 'Inicio de Sesión')

@section('styles')
<link href="{{ asset('css/style.css') }}" rel="stylesheet">
@endsection

@section('body')
<body class="five-zero-four">
    <div class="five-zero-zero-container">
        <div class="error-code">500</div>
        <div class="error-message">Error del servidor</div>
        <div class="button-place">
            <a href="{{ route('pagina_principal') }}" class="btn btn-default btn-lg waves-effect">IR A LA PÁGINA PRINCIPAL</a>
        </div>
    </div>
@endsection

@section('scripts')
<script src="{{ asset('js/admin.js') }}"></script>
<script src="{{ asset('js/pages/examples/sign-in.js') }}"></script>
<script src="{{ asset('plugins/jquery-validation/jquery.validate.js') }}"></script>
@endsection