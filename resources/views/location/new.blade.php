@extends('layout.base')

@section('title', 'Nueva Locacion')

@section('body')
<section ng-controller="newLocation">
    <div class="card">
        <div class="body">
            <form name="newForm" id="newForm" novalidate>
            <div class="form-group form-float">
                <div class="form-line">
                    <input name="nombre" ng-model="location.nombre" ng-maxlength="60" type="text" class="form-control" required>
                    <label class="form-label">Nombre de la Locación</label>
                </div>
                <span ng-show="newForm.nombre.$invalid" class="error">Nombre Invalido</span>
            </div>
            <div class="form-group form-float">
                <div class="form-line">
                    <input type="text" name="codigo" ng-model="location.codigo" ng-keypress="validateNumber($event)" ng-maxlength="10" maxlength="10" class="form-control" required>
                    <label class="form-label">Código de la Locación</label>
                </div>
                <span ng-show="newForm.codigo.$invalid" class="error">Código Invalido</span>
            </div>
            <div class="form-group form-float">
                <div class="form-line">
                    <textarea cols="30" name="detalle" ng-model="location.detalle" ng-maxlength="128" maxlength="128" rows="10" class="form-control" required></textarea>
                    <label class="form-label">Detalles de Locación</label>
                </div>
                <span ng-show="newForm.detalle.$invalid" class="error">Detalle Invalido</span>
            </div>
            <button type="button" ng-click="submitForm($event)" class="btn btn-primary m-t-15 waves-effect">Agregar Locación</button>
            </form>
        </div>
    </div>
</section>
@endsection

@section('scripts')
<script src="{{ asset('plugins/sweetalert/sweetalert.min.js') }}"></script>
<script src="{{ asset('js/pages/location/new.js') }}"></script>
@endsection