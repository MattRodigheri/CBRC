
// execute the following code when the document is fully loaded
$(document).ready(function() {

    
    // execute the following code when the user selects new report from archive
    $("#reports").change(function() {

        // empty container in case some meeting has been requested before
        $("#requested-report").text("");


        var selectedOption = $("#reports option:selected"),
            report = selectedOption.attr("value");

        // show the header 'Resuested report' that was previously hidden
        $("#requested-report-heading").show();

        // append the chosen report's value to the corresponding container 
        // report will be opened in a new window
        $("#requested-report").append("<p>" + report + "</p>");
    });


    
    // when the user selects new meeting report from archive
    $("#meetings").change(function() {

        // empty container in case some meeting has been requested before
        $("#requested-meeting").text("");

        var selectedOption = $("#meetings option:selected"),
            meeting = selectedOption.attr("value");

         // show the header 'Resuested meeting' that was previously hidden
        $("#requested-meeting-heading").show();

        // append the chosen meeting's value to the corresponding container 
        // meeting report will be opened in a new window
        $("#requested-meeting").html("<p>" + meeting + "</p>");
    });
    
});
