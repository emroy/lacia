
const EDIT = 1
const VIEW = 2

app.controller('workerList', ($scope, $http) => {

    $scope.workers = [];
    $scope.worker = [];

    $scope.updateWorker = $event => {
        $event.stopPropagation()
        if($scope.updateForm.$valid){
            $http({
                method:'post',
                url:'/workers/update',
                data: { ...$scope.worker }
            }).then(res => {
                var data = res.data
                if(data.success){
                    swal('MODIFICACIÓN EXITOSA', data.success.title , 'success').then(function(res) {
                        location.reload()
                    });
                } else {
                    swal('ERROR 400', data.error , 'warning');
                }
            })
        } else {
            return swal('ERROR', 'FALTAN CAMPOS POR LLENAR', 'warning');
        }
    }

    $scope.updateRow = (workerData) => {
        console.log(workerData)
        return
    }

    function addToScope(id, content){
        $scope.$apply(function(scope){
            scope.workers.push({
                id: id,
                content: content, 
            });
        })
    }

    angular.element(document).ready(function(){

        $('[data-dismiss]').click(function(e){
            e.preventDefault()
            $("#myModal").toggle('modal');
        })

        $scope.table = $(".dataTable").DataTable({
            language: datatablesLang,
            ajax:{
                url: "/workers/list",
                type:'GET',
                dataSrc:'workers'
            },
            columns:[
                {
                    className:'text-center mac',
                    data: "mac_address"
                },
                {
                    className:'text-center mac',
                    data: 'cod_location'
                },
                {
                    className:'text-center mac',
                    data: "hostname"
                },
                {
                    className:'text-center mac',
                    data: null, 
                    render: row => {
                        if(row.activo_e)
                            return '<span class="badge badge-success">Worker Registrado</span>'
                        else
                            return '<span class="badge badge-error">Nuevo Worker</span>'
                    }
                },
                {
                    className:'text-center mac',
                    data: null,
                    render: row => {
                        addToScope(row.id_e, row);
                        if(row.activo_e)
                            return '<button class="btn btn-success waves-effect waves-block" onclick="showEditModal(event, '+row.id_e+', false)">Ver Detalles</button>'
                        else
                            return '<button class="btn btn-danger waves-effect waves-block" onclick="showEditModal(event, '+row.id_e+', true)">Completar Información</button>'
                    }
                },
            ],
        });

    });

})

function showEditModal(event,i){
    try {

        var $scope = angular.element('section[ng-controller]').scope()
        var $row = $(event.target).parent().parent()[0];

        $scope.$apply(function(scope){
            scope.$row = $row
        })

        $scope.workers.map(obj => {
            if(obj.id == i){
                element = obj
            }
        })

        if(!element){
            throw 'Error de Data'
        }

        putDataInModal(element.content, element.id ,$scope, EDIT)
        displayModal(EDIT, $row)

    } catch(e) {

        swal('Error', e, 'error').then(function(e) {
            location.href = '/home';
        })

    } 
}

function putDataInModal(content, id , $scope, type){
    switch (type) {
        case EDIT:
            $scope.$apply(function(scope){
                scope.worker.mac_address = content.mac_address.toUpperCase()
                scope.worker.serial = content.cod_serial
                scope.worker.workername = content.workername
                scope.worker.hostname = content.hostname
                scope.worker.id = id 
            })
            break;

        case VIEW:

            break;
    }
}

function displayModal(type){
    switch (type) {
        case EDIT:
            $("#myModal").toggle('modal');
            var inputs = $("#updateForm").find('input:not([type="hidden"])')
            inputs.each(function(){ $(this).focus() })
            inputs[0].focus()       
            break;
    
        case VIEW:

            break;
    }
}