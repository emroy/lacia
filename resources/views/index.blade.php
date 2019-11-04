@extends('layout.base')

@section('title', 'Página Principal')

@section('body')
<!-- Main Trading View Graphic -->
<div class="row clearfix" ng-controller="main">
    <div class="card">
        <div class="body">
            <table id="spec" class="table table-border table-striped table-hover dataTable">
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Tipo</th>
                        <th>Monto (BTC)</th>
                        <th>Costo (USD)</th>
                        <th>Costo Promedio</th>
                        <th>INC/DEC</th>
                        <th>GAIN/LOSS (USD)</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>

    <div class="card">
        <div class="body">
            <table id="mov" class="table table-border table-striped table-hover dataTable">
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Tipo</th>
                        <th>Cantidad</th>
                        <th>Base</th>
                        <th>Quote</th>
                        <th>INC/DEC</th>
                        <th>GAIN/LOSS (USD)</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>

    <div class="card">
    @include('layout.tradingview')
    </div>

</div>
@endsection

@section('scripts')
<script src="{{ asset('plugins/jquery-datatable/jquery.dataTables.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js') }}"></script>
<script src="{{ asset('js/pages/index.js') }}"></script>
<script src="{{ asset('js/pages/modal.js') }}"></script>
@endsection
