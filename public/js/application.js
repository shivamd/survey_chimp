$(document).ready(function() {
  $('#update').submit(function(e) {
    e.preventDefault();

    var data = $(this).serializeArray();
    var survey = $(this).attr("class");
    // debugger
    $.ajax({
      url: '/survey/' + survey + '/edit',
      type: 'post',
      data: data
    })
    .done(function(data) {
      window.location = data;
    })
  });

  var lastQuestion = $('form div.question:last');
  var counter = 2;

  

  $('#add-question').on('click', function() {
    $(lastQuestion).clone(true).hide().insertBefore(lastQuestion).slideDown();
    lastQuestion.attr('id', counter);
    counter += 1;

    $('div#'+counter+ ' input').focus();
    
    $(function(){
      $('body').animate({
        scrollTop: $(lastQuestion).offset().top + 'px'
      }, 'slow');
    })
  });

});
