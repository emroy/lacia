
app.controller('adminInterface', ($scope, $http) => {

    $("#cryptos").DataTable({
        ajax: {
            'url':'/admin/cryptos',
            'type':'post',
            'dataSrc':'data'
        },
        columns: [
            {
                data:'id',
                className:'text-center',
            },
            {
                data:'base',
                className:'text-center',
            },
            {
                data:'base_name',
                className:'text-center',
            },
            {
                data:null,
                className:'text-center',
                render: function(e) {
                    return `<b>${Math.floor(e.supply)} <span class="badge badge-danger">${e.base}</span></b>`;
                }
            },
            {
                data:null,
                className:'text-center',
                render: function(e) {
                    return `<b>${Math.floor(e.marketcap)} <span class="badge badge-danger">USD</span></b>`;
                }
            },
            {
                data:null,
                className:'text-center',
                render: function(e) {
                    return `<b>${e.timestamp}</b>`;
                }
            },
            {
                data:null,
                className:'text-center',
                render: function(e) {
                    if(e.estatus){
                        return `<button class="btn btn-danger" onclick="activate(true,false,this, ${e.id})">Deshabilitar</span>`;
                    } else {
                        return `<button class="btn btn-success" onclick="activate(true,true,this, ${e.id})">Habilitar</span>`;
                    }
                }
            },
            {
                data:null,
                className:'text-center',
                render: function(e) {
                    if(!e.default_coin){
                        return `<button class="btn btn-success" onclick="activate(false,true,this, ${e.id})">Marcar Base</span>`;
                    } else {
                        return `<button class="btn btn-danger" onclick="activate(false,false,this, ${e.id})">Quitar Base</span>`;
                    }
                    
                }
            }
        ]
        
    });

});

app.controller('profileInterface', ($scope, $http) => {


});

function activate(type, swi, element, id){
    $.ajax({
        url:'/admin/cryptos/activate',
        method:'POST',
        data:{
            type:(!type) ? 'default':'habilitate',
            switch:swi,
            id:id,
        },
        success: (res) => {
            if(res.success){
                return swal('Exito',res.success,'success').then(res => {
                    location.reload()
                });
            } else if(res.error){
                return swal('Error',res.error,'error');
            }
        }

    });
}