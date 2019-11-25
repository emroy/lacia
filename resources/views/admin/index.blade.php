@extends('layout.base')

@section('title', 'Administrador')

@section('body')
<!-- Main Trading View Graphic -->
<div class="row clearfix" ng-controller="adminInterface">
    <div class="card">
        <div class="title text-center" >
            <h3>Criptomonedas Soportadas</h3>
        </div>
        <div class="body">
            <table id="cryptos" class="table table-border table-striped table-hover dataTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>SYMBOL</th>
                        <th>Nombre</th>
                        <th>Supply</th>
                        <th>Market Cap</th>
                        <th>Last Update</th>
                        <th>Habilitar</th>
                        <th>Default</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>

</div>
@endsection

@section('scripts')
<script src="{{ asset('plugins/jquery-datatable/jquery.dataTables.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/extensions/export/buttons.flash.min.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/lang.js') }}"></script>
<script src="{{ asset('js/pages/admin.js') }}"></script>
<script src="{{ asset('js/pages/modal.js') }}"></script>
@endsection
