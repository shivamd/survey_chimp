$(document).ready(function() {
  $('#update').submit(function(e) {
    e.preventDefault();
    var data = $(this).serializeArray();
    var survey = $(this).attr("class");

    $.ajax({
      url: '/survey/' + survey + '/edit'
      type: 'post'
      data: json
    })
    .done(function() {
      alert('success!')
    })

    
  });

});
