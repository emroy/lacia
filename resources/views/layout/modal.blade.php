<div ng-controller="modalController">

    <div class="fixed-right-button" ng-click="triggerModal('trans')">
        <span>
            <span class="material-icons">event_available</span>
        </span>
    </div>

    <div class="fixed-right-button-second" ng-click="triggerModal('mov')">
        <span>
            <span class="material-icons">open_with</span>
        </span>
    </div>

    <div class="trans modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">NUEVA TRANSACCIÓN</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group form-float">
                        <div class="form-line">
                            <input type="text" name="cantidad" ng-model="transaction.quantity" ng-maxlength="10" maxlength="10" class="form-control" required>
                            <label class="form-label">Cantidad de Transacción <b>(BTC)</b></label>
                        </div>
                    </div>
                    <div class="form-group form-float">
                        <div class="form-line">
                            <input type="text" name="tasa" ng-keypress="desactivate($event)" ng-model="transaction.rate" ng-maxlength="10" maxlength="10" class="form-control" required>
                            <label class="form-label">Tasa de Cambio <b>(USD)</b></label>
                        </div>
                    </div>
                    <div class="form-group form-float">
                        <div class="form-line">
                            <input type="text" name="comision" ng-model="transaction.fee" ng-maxlength="10" maxlength="10" class="form-control" value="0" required>
                            <label class="form-label">Comision <b>(BTC)</b></label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" ng-click="modal.save(1)">Retiro</button>
                    <button type="button" class="btn btn-primary" ng-click="modal.save(2)">Deposito</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
        
    <div class="mov modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">NUEVO MOVIMIENTO</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="wizard">
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav wizard nav-tabs" role="tablist">

                                <li role="presentation" class="active buy">
                                    <a class="wizard" href="#buy" data-toggle="tab" ng-click="interpolate('buy')" aria-controls="BUY" role="tab" title="BUY CRYPTO">
                                        <span class="round-tab buy">
                                        BUY
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="sell">
                                    <a class="wizard" href="#sell" data-toggle="tab" ng-click="interpolate('sell')" aria-controls="SELL" role="tab" title="SELL CRYPTO">
                                        <span class="round-tab sell">
                                        SELL
                                        </span>
                                    </a>
                                </li>

                            </ul>
                        </div>

                        <form role="form">
                            <div class="container">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <select name="base" ng-model="mov.base" ng-change="triggerChange($event,'base',this)" class="form-control" required>
                                            <option ng-repeat="x in base" value="@{{ x.id }}">@{{ x.base_name }}</option>
                                        </select>
                                        <label class="form-label">Moneda Base</label>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <select name="base" ng-model="mov.quote" ng-change="triggerChange($event,'quote',this)" class="form-control" required> 
                                            <option ng-repeat="x in quote"" value="@{{ x.id }}">@{{ x.base_name }}</option>
                                        </select>
                                        <label class="form-label">Moneda Destino</label>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="number" name="cantidad" ng-keypress="check($event, this)" ng-model="mov.quantity" ng-maxlength="10" disabled maxlength="10" class="form-control" required>
                                        <label class="form-label">Cantidad a Comprar <b>(@{{ active.quote.base }})</b></label>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="number" name="tasa" ng-model="mov.rate" ng-keypress="desactivate($event)" ng-maxlength="10" maxlength="10" class="form-control" disabled required>
                                        <label class="form-label">Précio <b>(@{{ active.base.base }})</b></label>
                                    </div>
                                </div>
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="number" name="comision" ng-model="mov.fee" ng-maxlength="10" maxlength="10" class="form-control" disabled value="0" required>
                                        <label class="form-label"><b>%</b> Comision</label>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="buy">
                                    <ul class="list-inline pull-right">
                                        <li><button type="button" ng-click="action('buy')" class="btn btn-success"><b>BUY</b></button></li>
                                    </ul>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="sell">
                                    <ul class="list-inline pull-right">
                                        <li><button type="button" ng-click="action('sell')" class="btn btn-danger"><b>SELL</b></button></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>