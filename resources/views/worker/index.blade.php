@extends('layout.base')

@section('title', 'Workers Registrados')

@section('styles')
<link rel="stylesheet" href="{{ asset('plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.min.css') }}">
<style>
    div.card{padding:20px 20px !important}
    .mac{text-transform:uppercase !important;font-weight:bold;text-shadow:rgba(0,0,0,.5) 0 0 10px}
</style>
@endsection

@section('body')
<section ng-controller="workerList">
    <div class="card">
        <table class="table table-bordered table-striped table-hover dataTable">
            <thead>
                <tr>
                    <th>Mac_Address</th>
                    <th>Locación</th>
                    <th>Hostname</th>
                    <th>Estatus</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <div tabindex="-1" role="dialog" class="modal" id="myModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">EDITAR WORKER</h5>
                    <button type="button" data-dismiss="modal" arial-label="Close" class="close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <form name="updateForm" id="updateForm">
                            <input type="hidden" name="id_e"  value="@{{ id_e }}">
                            <div class="col-md-6">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="mac_address" ng-model="worker.mac_address" class="form-control" required>
                                        <label class="form-label">MacAddress</label>
                                    </div>
                                    <span ng-show="updateForm.mac_address.$invalid" class="error">MacAddress invalida</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="hostname" ng-model="worker.hostname" class="form-control" required>
                                        <label class="form-label">Hostname</label>
                                    </div>
                                    <span ng-show="updateForm.hostname.$invalid" class="error">Hostname invalido</span>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="serial" ng-model="worker.serial" class="form-control" required>
                                        <label class="form-label">Serial</label>
                                    </div>
                                    <span ng-show="updateForm.serial.$invalid" class="error">Serial invalido</span>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" name="workername" ng-model="worker.workername" class="form-control" required>
                                        <label class="form-label">WorkerName</label>
                                    </div>
                                    <span ng-show="updateForm.workername.$invalid" class="error">Workername invalido</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" ng-click="updateWorker($event)" class="btn btn-primary ">Guardar</button>
                    <button type="button" class="btn btn-danger" data-dismiss="myModal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

</section>
@endsection

@section('scripts')
<script src="{{ asset('plugins/jquery-datatable/jquery.dataTables.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/extensions/export/buttons.flash.min.js') }}"></script>
<script src="{{ asset('plugins/sweetalert/sweetalert.min.js') }}"></script>
<script src="{{ asset('plugins/jquery-datatable/lang.js') }}"></script>
<script src="{{ asset('js/pages/worker/index.js') }}"></script>
@endsection