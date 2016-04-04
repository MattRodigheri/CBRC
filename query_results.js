// execute code only when the document is fully loaded
$(document).ready(function() {


    // add additional row to the end of each record
    // to include arrow image for responsive design
    $("#database-table tr").append("<td><div class=\"arrow\"></div></td>");

    
    
    // find and show the hidden rows by clicking on arrow image
    $(".arrow").click(function() {

        // find the record section the clicked arrow belongs to
        // 'this' refers to the arrow clicked
        var currentRow = $(this).closest("tr");


        // find all hidden rows in the current section
        var hiddenRows = $(currentRow).find("td").filter(function() {
           return $(this).css('display') == 'none';
        });

        // find all opened rows in the current section
        // that were previously hidden (by class 'opened')
        var openedRows = $(currentRow).find("td").filter(function() {
           return $(this).hasClass("opened");
        });

        // if there are any hidden rows, show them,
        // assign class 'opened' to mark them,
        // and change arrow image to arrow up
        if (hiddenRows.length > 0) {
            hiddenRows.css("display", "block");
            hiddenRows.addClass("opened");
            $(this).css("background-image",  "url('images/arrowup.png')");
            
        // if there is no hidden rows, close those that 
        // were previously opened and remove the class
        // change arrow image to arrow down
        } else {
            openedRows.css("display", "none");
            hiddenRows.removeClass("opened");
            $(this).css("background-image",  "url('images/arrowdown.png')");
        }
    });



        // make some changes if the screen is less than or equal to 768px
        if ($(window).width() <= 768) { 

            
            // iterate through each status row
            // and replace status codes with status full description
           $("td[data-label=\"Status\"]").each(function() {
               var status = $(this).text();
               switch (status) {
                   case "A":
                       $(this).text("Accepted");
                        break;
                   case "B":
                        $(this).text("Batched");
                        break;
                    case "C":
                        $(this).text("Recirculate");
                        break;
                    case "E":
                        $(this).text("Not Accepted - Establishment of introduced population questionable");
                        break;
                    case "I":
                        $(this).text("Info needed");
                        break;
                    case "M":
                        $(this).text("Hold for meeting");
                        break;
                    case "N":
                        $(this).text("New");
                        break;
                    case "O":
                        $(this).text("Not Accepted - Natural occurrence questionable");
                        break;
                    case "Q":
                        $(this).text("Assigned record number, but shouldn't have");
                        break;
                    case "R":
                       $(this).text("Not Accepted - ID not established");
                        break;
                    case "S":
                        $(this).text("Split into multiple records");
                        break;
                   case "U":
                       $(this).text("Unsubmitted");
                        break;
                    case "W":
                       $(this).text("Not Accepted - Withdrawn by observer");
                        break;
                    case "X":
                       $(this).text("Unknown status");
                        break;
                   default: 
                       break;
               }        
            }); 
        }
});
