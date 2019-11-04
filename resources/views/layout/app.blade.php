<!DOCTYPE html>
<html lang='{{ App::getLocale() }}'>
<head>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>@yield('title', 'Página')</title>
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <link href="{{ asset('css/icon.css') }}" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="{{ asset('plugins/node-waves/waves.css') }}" rel="stylesheet" />
    @yield('styles')
    <script src="{{ asset('plugins/node-waves/waves.js') }}"></script>
</head>
    @yield('body')
    <script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('plugins/angular.min.js') }}" ></script>
    <script src="{{ asset('js/admin.js') }}"></script>
    @yield('scripts')
</html>