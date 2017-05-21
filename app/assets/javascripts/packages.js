$(document).on('turbolinks:load', function() {
    $("table tbody tr").click(function(){
        location.href = $(this).data('href');
    });
})