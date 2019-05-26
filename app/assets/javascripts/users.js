// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
    $("input[name=terms]").change(function(){
        $("#signup").removeClass("ui disabled yellow button large").addClass("ui yellow button");
    });

    $("input[name=terms]").click(function(){
        if($(this).is(":checked")){
            $("#signup").removeAttr("disabled");
        } else {
            $("#signup").attr("disabled", "disabled");
        }
    });


    $('.delete-event').on('click', function(){
        $('.small.test.modal').modal("show");
    })
    
    
    $('.message .close').on('click', function() {
        $(this).closest('.message').transition('fade');
    });
    
    $('.red.cancel.button').on('click', function(){
        $('.small.test.modal').modal("hide");
    });

});

