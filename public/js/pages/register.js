$(function(){

    $('input').keypress(function(){
        if($(this).parent('.form-line').hasClass('error')) 
            $(this).parent('.form-line').removeClass('error');
    })

    $('#registerBtn').click(e => {
        e.preventDefault();
        try{
            const inputs = $('#registro').find('input');
            notEmpty(inputs);
            passwordsNotEqual(inputs);
            isValidEmail(inputs);
            $.ajax({
                url:'/register',
                type:'post',
                'data':$('#registro').serialize(),
                'success': response => {
                    if(response.success){
                        swal(response.success, 'Se ha enviado un correo a su e-mail para la confirmación','success').then(response => {
                            if(response.value){
                                return window.location.replace('/login');
                            }
                        });
                    } else if(response.error) {
                        return swal(response.error, '','error');
                    }
                }
            });
        }catch(e){
            return swal('Error', e);
        }
    });

    function notEmpty(inputs){
        var counter = 0;
        $.each(inputs, (c, e) => {
            if(e.value == ''){
                $(e).parent('.form-line').addClass('error');
                counter++
            }
        });
        if(counter > 0){
            throw 'Faltan valores por llenar';
        }
    }

    function passwordsNotEqual(inputs){
        if(inputs[3].value !== inputs[4].value){
            $(inputs[3]).parent('.form-line').addClass('error');
            $(inputs[4]).parent('.form-line').addClass('error');
            throw 'Las contraseñas no coinciden';
        }
    }

    function isValidEmail(inputs){
        var string = String(inputs[2].value).toLowerCase();
        var ptt = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(!ptt.test(string)){
            $(inputs[1]).parent('.form-line').addClass('error');
            throw 'Correo invalido';
        }
    }
});