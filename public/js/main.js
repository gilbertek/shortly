$(document).ready(function(){
    $(".shortener_form").submit(function (e) {
        e.preventDefault();

        $.ajax({
            type: 'POST',
            url: '/',
            data: $(".shortener_form").serialize(),
            success: function(result) {
                console.log(result);
                display_shortlink(result);
            }
        });
    });
});

function display_shortlink(data) {
    $('<a>', {
        text:'Here is your shortened link',
        href: data
    }).appendTo($(".display_link"));
}