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



// Bar Graph Stuff

  // arrayOfData = new Array(
  //      ["10.3",'Jan','#f3f3f3'],
  //      ["15.2",'Feb','#f4f4f4'],
  //      ["13.1",'Mar','#cccccc'],
  //      ["16.3",'Apr','#333333'],
  //      ["14.5",'May','#666666']
  // ); 

// make graph go away when clicked again

$('a.graph-button').on('click', function(e){
  e.preventDefault();
  var dataArray = new Array();


  dataArray.push( $(this).parent().prev().children().text().split(" ").join(",").split(",").reverse() );
  dataArray.push( $(this).parent().prev().prev().children().text().split(" ").join(",").split(",").reverse() );
  dataArray.push( $(this).parent().prev().prev().prev().children().text().split(" ").join(",").split(",").reverse() );
  dataArray.push( $(this).parent().prev().prev().prev().prev().children().text().split(" ").join(",").split(",").reverse() );

  (dataArray[0]).push('#f3f3f3');
  (dataArray[1]).push('#f3f3f3');
  (dataArray[2]).push('#f3f3f3');
  (dataArray[3]).push('#f3f3f3');

  $('#graphdiv').jqBarGraph({ data: dataArray });
});


// $('#graphdiv').jqBarGraph({ data: arrayOfData }); 

});
