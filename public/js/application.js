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

});
