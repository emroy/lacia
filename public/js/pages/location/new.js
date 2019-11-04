app.controller('newLocation', ($http, $scope) => {
    
    $scope.validateNumber = $event => {
        var pattern = /[0-9]/i
        if(!pattern.test($event.key)){
            $event.preventDefault()
        }
    }

    $scope.submitForm = $event => {
        
        $event.stopPropagation()

        if($scope.newForm.$valid){
            $http({
                url:'/locations/save',
                method:'post',
                data:$scope.location,
            }).then(res => {
                if(res.data.success){
                    swal('EXITO', res.data.success, 'success').then(() => {
                        setTimeout(() => window.location.href = '/home', 2000)
                    })
                } else {
                    swal('ERROR', res.data.error, 'warning');
                }
            })
        } else {
            swal('ERROR', 'Existen campos invalidos', 'error');
        }

    }

})
