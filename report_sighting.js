$(document).ready(function(){

  $('#submit').click(function(){
    $.post("report_sighting.php", $("#mycontactform").serialize(), function(response) {
      //not so sure about this php script to change button content
      $('#submit').html(response);
    });
    return false;
  });

});
