$(function(){

    $('input').keypress(function(){
        if($(this).parent('.form-line').hasClass('error')) 
            $(this).parent('.form-line').removeClass('error');
    })

    $('#log-button').click(e => {
        e.preventDefault();
        try{
            const inputs = $('#login').find('input');
            notEmpty(inputs);
            $.ajax({
                url:'/login',
                type:'post',
                'data':$('#login').serialize(),
                'success': response => {
                    if(response.success){
                        return swal(response.success,' ','success').then(res => location.href = response.path)
                    } else if(response.error) {
                        return swal('Intente nuevamente', response.error ,'error');
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
});