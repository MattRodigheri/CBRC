$(document).ready(function(){

  $('.submit').click(function(){
    $.post("report_sighting.php", $(".sighting-form").serialize(), function(response) {

      //not so sure about this php script to change button content
      $('.submit').innerHTML(response);
    });
    return false;
  });

});
