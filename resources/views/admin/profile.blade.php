@extends('layout.base')

@section('title', 'Perfil')

@section('styles')
    <style>
    h2.exchange{
        font-weight:bold;
        font-size:2em;
        text-transform:uppercase;
        text-align:center;
        width:100%;
    }
    input.form-control{
        margin-left:10px;
    }
    div.card{
        padding:10px 10px;
    }
    </style>      
@endsection

@section('body')
<!-- Main Trading View Graphic -->
<div class="row clearfix" ng-controller="profileInterface">
    <form name="apiForm" id="apiForm"></form>
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
<script>

    function submitApi(event, id){
        event.preventDefault();
        
        var inp = $(`div[exchange-id="${id}"]`).find('input');

        if(inp[0].value == "" || inp[1].value == ""){
            return swal('Input Errors','Please fill the boxes','error');
        }

        angular.element('[ng-controller="profileInterface"]').scope()
        .$apply(($scope, $http) => {
            
            Swal.fire({
                title: "Are you sure?",
                type: 'info',
                text:'We will make movements in your account',
                showCloseButton: true,
                showCancelButton: true,
                focusConfirm: false,
                confirmButtonText:"Yes I'm",
                cancelButtonText:"No",
            }).then(res => {
                if(res.value){
                    $.post({
                        url:'/exchange/save', 
                        data: {
                            id_exchange: id,
                            api_key: inp[0].value,
                            api_secret: inp[1].value
                        },
                        success: (res) => {
                            swal(res.title,res.message,res.type);
                        }
                    });
                }
            });
        });
    }

    app.controller('profileInterface', ($http, $scope) => {

        String.prototype.replaceAll = function(search, replacement) {
            var target = this;
            return target.replace(new RegExp(search, 'g'), replacement);
        };

        $scope.fit = (item, toReplace) => {
            var string = toReplace;
            Object.keys(item).forEach(function(key, counter){
                string = string.replaceAll(`@{{${key}}}`,`${item[key]}`.toLowerCase());
            });
            return string;
        }

        $scope.uncover = (item, info, text) => {
            var string = text
            if(!info.user ||info.user.length < 1){
                string = string.replaceAll(`@{{api_key}}`,'').replaceAll(`@{{api_secret}}`,'')
            } else {
                info.user.forEach(function(item2, counter2){
                    if(item2.id_exchange == item.id){
                        string = string.replaceAll(`@{{api_key}}`,item2.api_key)
                        string = string.replaceAll(`@{{api_secret}}`,item2.api_secret)
                        info.user.splice(counter2, 1);
                    }
                });
            }
            return string;
        }

        $http.get('/resource/exchanges').then(res => {

            $scope.info = res.data;

            var $iteration = [];
            var $external = $('form#apiForm');
            var $row = $(`<div class="row"></div>`);

            $scope.info.data.forEach(function(item, counter){
                var mainText = $scope.uncover(item, $scope.info, `<a href="@{{url}}"><h2 style="color:@{{color}}" class="exchange">@{{description}}</h2></a>
                <div class="form-group">
                    <label for="@{{description}}-api_key">API Key</label>
                    <input value="@{{api_key}}" name="@{{description}}-api_key" ng-model="@{{description}}-api_key" ng-maxlength="120" class="form-control" id="@{{description}}-api_key" placeholder="Enter your API Key for this exchange" required>
                </div>
                <div class="form-group">
                    <label for="@{{description}}-api_secret">API Secret</label>
                    <input type="password" value="@{{api_secret}}" name="@{{description}}-api_secret" ng-model="@{{description}}-api_secret" ng-maxlength="120" class="form-control" id="@{{description}}-api_secret" name="" placeholder="Enter your API Secret" required> 
                </div>`);
                $iteration[counter] = $($scope.fit(item, `<div exchange-id="@{{description}}-@{{id}}" class="card col-md-5" style="display:none;margin:10px;color:@{{color}}"></div>`));
                $iteration[counter].append($($scope.fit(item,mainText)));
                $iteration[counter].append($($scope.fit(item,`<button type="button" onclick="submitApi(event, '@{{description}}-@{{id}}')" class="btn btn-primary waves-effect">Push API Key</button>`)));
            });

            $iteration.forEach(function(item){
                $external.append(item);
            });

            setTimeout(function(){
                $external.children().each(function(counter,item){
                    $(item).fadeIn();
                });
                $scope.$apply();
            }, 500);
        });
    })
</script>
@endsection
