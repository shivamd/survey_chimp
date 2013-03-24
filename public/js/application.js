$(document).ready(function() {
  $('#create-survey').on('click', function(e) {
    e.preventDefault();

    var data = $('#update').serializeArray();
    var survey = $('#update').attr("class");
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

  var counter = 2;

  $('#add-question').on('click', function() {
    var lastQuestion = $('form div.question:last'); 
    $(lastQuestion).clone(true).hide().insertAfter(lastQuestion).slideDown();
    lastQuestion.attr('id', counter);
    counter += 1;

    $('div#'+counter+ ' input').focus();
    
    $(function(){
      $('body').animate({
        scrollTop: $(lastQuestion).offset().top + 'px'
      }, 'slow');
    })
  });

  $('a.remove').on('click', function(e) {
    e.preventDefault();
    $(this).closest('div').hide('slow', function() {
      $(this).remove();
    });
  });

});
