
app.controller('modalController', ($http, $scope) => {

    $scope.transaction = JSON.parse(`{"rate":0,"fee":0,"quantity":0}`);
    $scope.mov = JSON.parse(`{"rate":0,"fee":0.25,"quantity":0}`);
    $scope.active = {base:undefined,quote:undefined, selected:undefined}
    $scope.WS = undefined;
    $scope.user = {};
    $scope.info = {};
    $scope.quote = [];
    $scope.base = [];
    $scope.coins = {};
    $scope.modal = {};
    $scope.val = "";

    $http.get('/resource/coins').then(res => {
        if(res.data){
            res.data.base.forEach(item => {
                $scope.base.push(item);
            });
            res.data.quote.forEach(item => {
                $scope.quote.push(item);
            });
            setTimeout(function(){
                $scope.$digest();
            },0);
        }
    });

    $scope.triggerChange = ($event, type, element) => {
        var selected = $scope[type].filter(x => x.id == $scope.mov[type])[0];
        var existent = $scope.user.holdings.filter(x => x.id == selected.id)[0];
        $scope.active[type] = selected;
        if($scope.active.base != undefined && $scope.active.quote != undefined){
            $('[ng-model="mov.quantity"],[ng-model="mov.rate"],[ng-model="mov.fee"]').prop('disabled',false);
        }
        if(type == 'base'){
            $scope.active.selected = $scope.mov.quantity = (existent == undefined) ? 0:parseFloat(existent.fondos);
            $scope.setRate(selected);
        }
        setTimeout(function(){
            $scope.$digest()
        },0);
    }

    $scope.interpolate = type => {
        
        if($scope.WS != undefined){
            $scope.WS.close()
        }

        $http.get('/resource/coins').then(res => {
            
            if(res.data){
                 
                $scope.base = [];
                $scope.quote = [];
                
                if(type == 'buy'){
                    res.data.base.forEach(item => {
                        $scope.base.push(item);
                    });
                    res.data.quote.forEach(item => {
                        $scope.quote.push(item);
                    });
                } else if(type == 'sell'){
                    res.data.quote.forEach(item => {
                        $scope.base.push(item);
                        $scope.quote.push(item);
                    });
                }

                setTimeout(function(){
                    $scope.$digest();
                },0);
            }
        }); 



    }

    $scope.action = type => {

        if($scope.active.base == undefined && $scope.active.quote == undefined){
            return swal('Error', 'Seleccione una moneda base y una destino','error');
        }

        if($scope.active.selected < $scope.mov.quantity){
            return swal('Error', 'Fondos de '+$scope.active.base.base_name+' insuficientes','error');
        }
        
        swal({
            title: '¿Realizar movimiento?',
            text: "Esta acción es irreversible",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Confirmar'
          }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: '/movimiento/new',
                    type:'post',
                    data:{
                        ...$scope.mov, 
                        type:type,
                        base: $scope.active.base.id,
                        quote: $scope.active.quote.id
                    },
                    success: res => {
                        if(res.success){
                            swal('Exito',res.success,'success').then(() => {
                                location.reload()
                            });
                        } else if(res.error){
                            swal('Intente nuevamente',res.error,'error')
                        }
                    }
                });
            }
          });
    }

    $scope.$watch('mov.rate', function(nval, oval) {
        var e = $('[ng-model="mov.rate"]');
        if(e.hasClass('unactive') && $scope.WS != undefined) {
            $scope.WS.close()
        }
    });

    $scope.$on('update-modal', (_, data) => {
        setTimeout(function(){
            $scope.transaction.rate = parseFloat(data.bitcoin);
            $scope.$digest()
        }, 0);
    });

    $scope.$on('user-data', (_, data) => {
        $scope.transaction.quantity = parseFloat(data.user.raw);
        $scope.user = data.user;
        setTimeout(function(){
            $scope.$digest()
        },500);
    });

    $scope.setRate = selected => {
        
        if($scope.WS != undefined){
            $scope.WS.close()
        }
        
        $scope.WS = new WebSocket('wss://ws.coincap.io/prices?assets='+selected.base_name.toLowerCase());
        $scope.WS.onmessage = function(msg){
            var data = JSON.parse(msg.data);
            $scope.mov.rate = parseFloat(data[selected.base_name.toLowerCase()]);
        }
        setTimeout(function(){
            $scope.$digest()
        });
    }

    $scope.modal.save = (type) => {

        $http({
            url:'/transaction/new',
            method:'post',
            data: { ...$scope.transaction, type:type },
            headers: { 'X-CSRF-TOKEN': $("meta[name='csrf-token']").attr("content") }
        }).then(res => {
            if(res.data.success){
                swal('Exito', res.data.success, 'success').then( () => {
                    location.reload();
                });
            } else {
                swal('Error',res.data.error,'warning');
            }
        })
    }

    $scope.desactivate = $event => {
        $($event.currentTarget).addClass('unactive')
    }

    $scope.modal.move = () => {

        $http({
            url:'/transaction/movement',
            method:'post',
            data: { ...$scope.modal },
            headers: { 'X-CSRF-TOKEN': $("meta[name='csrf-token']").attr("content") }
        }).then(res => {
            if(res.data.success){
                swal('Exito', res.data.success, 'success').then( () => {
                    location.reload();
                });
            } else {
                swal('Error',res.data.error,'warning');
            }
        })
    }

    angular.element('[ng-controller="mainController"]').ready(function() {

        $('.nav-tabs > li a[title]').tooltip();
        
        //Wizard
        $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
    
            var $target = $(e.target);
        
            if ($target.parent().hasClass('disabled')) {
                return false;
            }
        });
    
        $(".next-step").click(function (e) {
    
            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);
    
        });
        $(".prev-step").click(function (e) {
    
            var $active = $('.wizard .nav-tabs li.active');
            prevTab($active);
    
        });

        $scope.triggerModal = type => {
            $(`.modal.${type}`).modal("toggle");
            $(`.modal.${type} input[name='cantidad']+label`)[0].click()
        }

    });

    
});

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}

function archive(element,id){
    var $tr = $(element).parent().parent();
    var $id = id;
    swal({
        title: '¿Archivar esta transacción?',
        text: "Esta acción es irreversible ",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Archivar'
      }).then((result) => {
        if (result.value) {
            $.ajax({
                url: '/transaction/archive',
                type:'post',
                data:{id:$id},
                success: res => {
                    if(res.success){
                        $tr.fadeOut()
                    }
                }
            });
        }
      });
}
