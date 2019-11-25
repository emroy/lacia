app.controller('Inversor', ($http, $scope) => {

    $scope.inversiones = []    

    var t = $("#spec").DataTable()
    
    $http({
        url:'/investor/index',
        method:'get',
        headers: { 'X-CSRF-TOKEN': $("meta[name='csrf-token']").attr("content") }
    }).then(res => {
        if(res.data){
            $scope.inversiones = res.data
            $scope.inversiones.forEach((item, counter) => {
                t.row.add([
                    item.apelnomb,
                    item.username,
                    item.correo,
                    "<span class='stand' data-quantity='"+item.fondos+"' convertable data-type='BTC'>"+item.fondos+"</span>",
                    '<button onclick="displayModal('+item.inversionista+','+item.fondos+')" class="btn btn-primary">Administrar</button>',
                ]).draw(false);
            });
        } else {
            swal('Error','Error al obtener los datos de inversionistas','warning');
        }
    })

    $scope.submitForm = $event => {
        
        $event.stopPropagation()

        if($scope.newForm.$valid){
            $http({
                url:'/investor/save',
                method:'post',
                data:$scope.inversor,
                headers: {
                    'X-CSRF-TOKEN': $("meta[name='csrf-token']").attr("content")
                }
            }).then(res => {
                if(res.data.success){
                    swal('Completado', res.data.success, 'success').then(() => {
                        window.location.href = '/home'
                    })
                } else {
                    swal('Error', res.data.error, 'warning');
                }
            })
        } else {
            swal('Error', 'Existen campos invalidos', 'error');
        }

    }

});