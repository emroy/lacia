@extends('layout.base')

@section('title', 'Nuevo Inversor')

@section('body')
<section ng-controller="Inversor">
    <div class="card">
        <div class="body">
            <form name="newForm" id="newForm">
                <div class="row">
                    <div class="form-group form-float">
                        <div class="col-md-6">
                            <div class="form-line">
                                <input name="nombre" ng-model="inversor.nombre" ng-maxlength="30" type="text" class="form-control" required>
                                <label class="form-label">Nombre del Inversor</label>
                            </div>
                            <span ng-show="newForm.nombre.$invalid" class="error">Nombre de inversor <b>Invalido</b></span>
                        </div>
                        <div class="col-md-6">
                            <div class="form-line">
                                <input name="correo" ng-model="inversor.correo" ng-maxlength="30" type="email" class="form-control" required>
                                <label class="form-label">Corréo del Inversor</label>
                            </div>
                            <span ng-show="newForm.correo.$invalid" class="error">Corréo <b>Invalido</b></span>
                        </div>
                    </div>
                </div>
                <div class="form-group form-float">
                    <div class="form-line">
                        <input type="number" name="fondos" ng-model="inversor.fondos" ng-maxlength="10" maxlength="10" class="form-control" required>
                        <label class="form-label">Fondo de Inversión <b>(BTC)</b></label>
                    </div>
                    <span ng-show="newForm.fondos.$invalid" class="error">Monto <b>Invalido</b></span>
                </div>
                <button type="button" ng-click="submitForm($event)" class="btn btn-primary m-t-15 waves-effect">Agregar nuevo Inversor</button>
            </form>
        </div>
    </div>

    <div class="card">
        <div class="body">
            <table id="spec" class="table table-bordered table-striped table-hover dataTable">
                <thead>
                    <tr>
                        <th>Nombre del Inversor</th>
                        <th>Nombre de Usuario</th>
                        <th>Corréo Electrónico</th>
                        <th>Fondos <b>BTC</b></th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>

</section>
@endsection

@section('scripts')
<script src="{{ asset('plugins/jquery-datatable/jquery.dataTables.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/extensions/export/buttons.flash.min.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/lang.js') }}"></script>
<script src="{{ asset('js/pages/inversor/new.js') }}"></script>
@endsection