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
    lastQuestion.children('input').attr('name', 'question' + counter);
    lastQuestion.children('textarea').attr('name', 'choice' + counter);
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


Array.prototype.randomElement = function () {
    return this[Math.floor(Math.random() * this.length)]
  };

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
  var i = 0
  var barColors = ["#4210AE", "#D5F800", "#8BA100", "#FFE4C4", '#8B0000', '#4B0082', '#FF6347']
  var dataArray = new Array();
  var choiceArray = $(this).parent().parent().find('li')
  var choiceCount = $.each(choiceArray,function(index,value){ i += 1 });
  var choiceList = $(this).parent().parent().children();


  // choiceList.each(function(index, list){
  //   dataArray.push( list.text().split(" ").join(",").split(",").reverse() );
  // });

  var rawData = $(this).parent().parent().children().children().text();
  var data = rawData.split(" ");

  //jquery includes text in a href to the array. remove it
  data.splice(data.length-3, 4);
  
  $.each(data, function(index,value){dataArray.push(value.split("-").join(",").split(",").reverse())})

  $.each(dataArray, function(index, value){
    value.push(barColors.randomElement());
  });

  //append graph
  var currentQuestion = $(this).attr("id");
  $(".question_" + currentQuestion).jqBarGraph({ data: dataArray });
});


// $('#graphdiv').jqBarGraph({ data: arrayOfData }); 


// sorting questions

$('form#update').sortable({handle: ".handle"}).disableSelection();


// dropdown menu

$('li a.dropdown').on('click', function(e) {
  e.preventDefault();
  dropdown = $(this).attr('id');
  $('header').toggleClass('space');
  if (dropdown=== "login") {
    $('form.signup').hide();
  }
  else {
    $('form.login').hide();
  }
  $('form.'+dropdown).toggle();
});
  
  $('.outer').on('click', function(e) {
    $('header').removeClass('space');
    $('form.dropdown').hide();
  });

});
