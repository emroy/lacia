<!DOCTYPE html>
<html lang='{{ App::getLocale() }}'>
<head>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>@yield('title', 'Página')</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="{{ asset('css/robot.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('css/icon.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('plugins/bootstrap/css/bootstrap.css') }}" rel="stylesheet">
    <link href="{{ asset('plugins/node-waves/waves.css') }}" rel="stylesheet" />
    <link href="{{ asset('plugins/animate-css/animate.css') }}" rel="stylesheet">
    @yield('styles')
    <script src="{{ asset('plugins/node-waves/waves.js') }}"></script>
</head>
    @yield('body')
    <script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('plugins/angular.min.js') }}" ></script>
    <script src="{{ asset('js/admin.js') }}"></script>
    @yield('scripts')
</html>