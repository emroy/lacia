<!DOCTYPE html>
<html ng-app="mineriaApp">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title','Principal')</title>
    <link href="{{ asset('css/robot.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('css/icon.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('plugins/bootstrap/css/bootstrap.css') }}" rel="stylesheet">
    <link href="{{ asset('plugins/node-waves/waves.css') }}" rel="stylesheet" />
    <link href="{{ asset('plugins/animate-css/animate.css') }}" rel="stylesheet" />
    <link href="{{ asset('css/themes/theme-indigo.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    @yield('styles')
</head>

<body class="theme-indigo" ng-controller="app">
    
    @include('layout.loader')   
    <div class="overlay"></div>  
    @include('layout.topbar')  
    @include('layout.sidebar')   
    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2 style="text-transform:uppercase">@yield('title', 'PÁGINA PRINCIPAL')</h2>
            </div>
            @yield('body')
        </div>
    </section>
    @include('layout.modal')
    <script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('plugins/bootstrap/js/bootstrap.js') }}"></script>
    <script src="{{ asset('plugins/jquery-slimscroll/jquery.slimscroll.js') }}"></script>
    <script src="{{ asset('plugins/node-waves/waves.js') }}"></script>    
    <script src="{{ asset('plugins/angular.min.js') }}" ></script>
    <script src="{{ asset('plugins/sweetalert/sweetalert.min.js') }}"></script>
    <script src="{{ asset('js/admin.js') }}"></script>  
    @yield('scripts')

</body>

</html>
