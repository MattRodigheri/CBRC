// jQuery code to reflect the chosen report on the page
// execute code only when the document is fully loaded
$(document).ready(function() {

    
    // when the user selects new report from archive
    $("#reports").change(function() {

        var pdfLink,
            selectedOption = $("#reports option:selected"),
            title = selectedOption.attr('title');


        // append option's value and a tags to pdfLink variable
        // if a report has additional informaton like corrigenda, append it to pdfLink variable as well

        if (selectedOption.val() === "14") {
            pdfLink = " [<a href=\"" + selectedOption.val() + ".pdf\">PDF</a>] " + selectedOption.attr('addition') + " [<a href=\"" + selectedOption.attr('additionNumber') + ".pdf\"  target=\"_blank\">PDF</a>] ";
        } else {
            pdfLink = " [<a href=\"" + selectedOption.val() + ".pdf\"  target=\"_blank\">PDF</a>]";
        };

        // replace latest annual report with requested data
        $("#latest-report-heading").html("REQUESTED REPORT");
        $("#latest-report").html(title + pdfLink);
    });


    
    // when the user selects new meeting report from archive
    $("#meetings").change(function() {
        var pdfLink,
            selectedOption = $("#meetings option:selected"),
            title = selectedOption.text();

            // append selected meeting's value to pdfLink
            pdfLink = " [<a href=\"" + selectedOption.val() + ".pdf\"  target=\"_blank\">PDF</a>]";

          // replace latest meeting minutes with requested data
        $("#latest-meeting-heading").html("REQUESTED MEETING");
        $("#latest-meeting").html(title + pdfLink);
    });
    
});
