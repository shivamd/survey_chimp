$(document).ready(function() { 
$('form.dropdown.signup').on('submit', function(e) {
    
    form = $(this).attr('id')
    $('#errors li').remove();
    var username = $('form#'+form+' input[type=text]').val();
    var email = $('form#'+form+' input[type=email]').val();
    var password = $('form#'+form+' input[type=password]').val();
 
    var re = new RegExp("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,6})$")
    var re_num = new RegExp("\d");
    var re_8 = new RegExp(".{6,}");
    
    var email_result = re.test(email);
    var password_num = re_num.test(password);
    var password_8 = re_8.test(password);

    if (username === "") {
        $('#errors').append('<li>Cannot have a blank username</li>')
        e.preventDefault();
    }

    if (email_result == false) {
        $('#errors').append('<li>Must be a valid email</li>');
        e.preventDefault();
    };
    if ( password_num == false) {
        $('#errors').append("<li>Password must have at least one numeric character (0-9)</li>");
        e.preventDefault();
    };
    
    if (password_8 == false) { 
        $('#errors').append("<li>Password must be at least 8 characters long</li>");
        e.preventDefault();
    };
});


});