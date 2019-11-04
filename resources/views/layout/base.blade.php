<!DOCTYPE html>
<html ng-app="mineriaApp">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title','Principal')</title>
    <link href="{{ asset('css/icon.css') }}" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="{{ asset('plugins/node-waves/waves.css') }}" rel="stylesheet" />
    <link href="{{ asset('css/theme.css') }}" rel="stylesheet"/>
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
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="{{ asset('plugins/node-waves/waves.js') }}"></script>    
    <script src="{{ asset('plugins/angular.min.js') }}" ></script>
    <script src="{{ asset('plugins/sweetalert/sweetalert.min.js') }}"></script>
    <script src="{{ asset('js/admin.js') }}"></script>  
    @yield('scripts')

</body>
</html>
