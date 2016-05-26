// execute the following code only when the document is fully loaded
$(document).ready(function() {

// the following code returns the full code status

function getFullCodeStatus(abbr) {
    switch(abbr) {
    case "A":
        return  "Accepted";
        break;
    case "B":
        return "Batched";
        break;
    case "C":
        return "Recirculate";
        break;
    case "E":
        return "Not Accepted - Establishment of introduced population questionable";
        break;
    case "I":
        return "Info needed";
        break;
    case "M":
        return "Hold for meeting";
        break;
    case "N":
        return "New";
        break;
    case "O":
        return "Not Accepted - Natural occurrence questionable";
        break;
    case "Q":
        return "Assigned record number, but shouldn't have";
        break;
    case "R":
        return "Not Accepted - ID not established";
        break;
    case "S":
        return "Split into multiple records";
        break;
    case "U":
        return "Unsubmitted";
        break;
    case "W":
        return "Not Accepted - Withdrawn by observer";
        break;
    case "X":
        return "Unknown status";
        break;
    default:
        return "Status Error";
    }
}

// the following code returns the full county name
function getFullCountyName(abbr) {
    switch(abbr) {
        case "ALA":
            return "Alameda";
            break;
        case "ALP":
            return "Alpine";
            break;
        case "AMA":
            return "Amador";
            break;
        case "BUT":
            return "Butte";
            break;
        case "CC" :
            return "Contra Costa";
            break;
        case "CLV":
            return "Calaveras";
            break;
        case "COL":
            return "Colusa";
            break;
        case "DN" :
            return "Del Norte";
            break;
        case "ED" :
            return "El Dorado";
            break;
        case "FRE":
            return "Fresno";
            break;
        case "GLE":
            return "Glenn";
            break;
        case "HUM":
            return "Humboldt";
            break;
        case "IMP":
            return "Imperial";
            break;
        case "INY":
            return "Inyo";
            break;
        case "KER":
            return "Kern";
            break;
        case "KIN":
            return "Kings";
            break;
        case "LA" :
            return "Los Angeles";
            break;
        case "LAK":
            return "Lake";
            break;
        case "LAS":
            return "Lassen";
            break;
        case "MAD":
            return "Madera";
            break;
        case "MEN":
            return "Mendocino";
            break;
        case "MER":
            return "Merced";
            break;
        case "MNO":
            return "Mono";
            break;
        case "MOD":
            return "Modoc";
            break;
        case "MRN":
            return "Marin";
            break;
        case "MRP":
            return "Mariposa";
            break;
        case "MTY":
            return "Monterey";
            break;
        case "NAP":
            return "Napa";
            break;
        case "NEV":
            return "Nevada";
            break;
        case "ORA":
            return "Orange";
            break;
        case "PLA":
            return "Placer";
            break;
        case "PLU":
            return "Plumas";
            break;
        case "RIV":
            return "Riverside";
            break;
        case "SAC":
            return "Sacramento";
            break;
        case "SBA":
            return "Santa Barbara";
            break;
        case "SBE":
            return "San Bernardino";
            break;
        case "SBT":
            return "San Benito";
            break;
        case "SCL":
            return "Santa Clara";
            break;
        case "SCZ":
            return "Santa Cruz";
            break;
        case "SD" :
            return "San Diego";
            break;
        case "SF" :
            return "San Francisco";
            break;
        case "SHA":
            return "Shasta";
            break;
        case "SIE":
            return "Sierra";
            break;
        case "SIS":
            return "Siskiyou";
            break;
        case "SJ":
            return "San Joaquin";
            break;
        case "SLO":
            return "San Luis Obispo";
            break;
        case "SM" :
            return "San Mateo";
            break;
        case "SOL":
            return "Solano";
            break;
        case "SON":
            return "Sonoma";
            break;
        case "STA":
            return "Stanislaus";
            break;
        case "SUT":
            return "Sutter";
            break;
        case "TEH":
            return "Tehama";
            break;
        case "TRI":
            return "Trinity";
            break;
        case "TUL":
            return "Tulare";
            break;
        case "TUO":
            return "Tuolumne";
            break;
        case "VEN":
            return "Ventura";
            break;
        case "YOL":
            return "Yolo";
            break;
        case "YUB":
            return "Yuba"
            break;
        default:
            return "Unknown county";
    }
}


// the following code creates a tooltip for each targeted item
function createTooltip(targetItems, name) {

 $(targetItems).each(function(i) {

    // remove possible whitespaces from beginning and end
    // of abbreviation and store it in a variable
    var abbreviation = $.trim($(this).text());

    // use 'getFullCodeStatus' function if 
    // tooltips for statuses are created
    if (name === "statusTooltip" ) {

        // create a custom attribute 'data-fullname' for each table item
        // which holds the explanation of abbreviation
        // thus explanation will be stored 
        // and ready to be used

        // 'this' refers to the targeted table item
        $(this).attr("data-fullname", getFullCodeStatus(abbreviation));

    // use 'getFullCodeStatus' function if 
    // there is abbreviation for status
    } else if (name === "countyTooltip" && abbreviation !== "") {

        // use 'getFullCountyName' function if 
        // there is abbreviation for county
        $(this).attr("data-fullname", getFullCountyName(abbreviation));
    } else if (name === "countyTooltip2" && abbreviation !== "") {

        // use 'getFullCountyName' function if 
        // there is abbreviation for county2
        $(this).attr("data-fullname", getFullCountyName(abbreviation));
    } 

    // create a tooltip structure for non-empty table fields
    // (if there is no abbreviation, we don't need tooltips with explanation)
    if (abbreviation !== '') {
        $(this).append("<div class='tooltip' id=" + name + i + "></div>");
    }

    // store current tooltip in a variable
    var myTooltip = $("#" + name + i);

    // when user places mouse over the table item,
    // append its custom attribute's value to a tooltip
    // and show a tooltip
    $(this).mouseover(function() {
        $("#" + name + i).html("<p>" + $(this).attr("data-fullname") + "</p>");
        myTooltip.show();

    // hide tooltip when user removes mouse from targeted table item
    }).mouseout(function() {
        myTooltip.hide();
    });
  }); // end of .each block
} // end of createTooltip function


// the following code add full explanation for status and county
// in the mobile version of the table
function addFullName(targetItems, name) {
    $(targetItems).each(function(i) {

         // remove possible whitespaces from beginning and end
         // of abbreviation and store it in a variable
        var abbreviation = $.trim($(this).text());

        // get full names for statuses and county codes
        // if there is an abbreviation for them
        if (name === "statusAbbr" && abbreviation !== "") {
            $(this).text(getFullCodeStatus(abbreviation));
        } else if (name === "countyAbbr" && abbreviation !== "") {
            $(this).text(getFullCountyName(abbreviation));
        } else if (name === "countyAbbr2" && abbreviation !== "") {
            $(this).text(getFullCountyName(abbreviation));
        }
    }); 
}

// display spinning image when the data is being requested
   // hide it when data is received
    $(document)
          .ajaxStart(function () {
               $("#loading").show();
          })
          .ajaxStop(function () {
               $("#loading").hide();
          });

    // the following script creates a popup window
    // and appends a list of contributors to it
   function createPopup(e) {
        e.preventDefault();

        // store the link related to this record # in a variable
        var link = "../" + $(this).attr("href");

        // create the structure of a popup window
        var popup = "<div class='contributors-popup'>" + 
        "<div class='inner-popup'>"  +
        "<img id=\"loading\" src=\"CBRCPrototype/images/loading.gif\">" + 
        "<a class='close-popup' id='close-button' href='#'>x</a>" +
        "</div></div>";

        // append popup to the body of the document
        $("body").append(popup);
        
         // store current popup in a variable
        var currentPopup = $(".contributors-popup");

        // make Ajax request to the server to get a list of contributors
        // based on the link for the current record
        $.get(link, function(data) {

            // append the data returned from the server to the popup
            $(".inner-popup").append(data);
        });

        // show current popup
        currentPopup.fadeIn(350);
         
        // close popup when 'Close' link is clicked
        $(".close-popup").on('click', function(e) {
            e.preventDefault();
            currentPopup.fadeOut(350);

            // remove the current popup 
            setTimeout(function() {
                currentPopup.remove();
            }, 400);
         });
    };



    // execute the followding code for desktop screens
    if ($(window).width() >= 992) { 

        // create tooltips for certain table columns
        createTooltip("td[data-label=\"Status\"]", "statusTooltip");
        createTooltip("td[data-label=\"Co\"]", "countyTooltip");
        createTooltip("td[data-label=\"Co2\"]", "countyTooltip2");

     
         // create popup window with contributors when user clicks on a record #
        $("td[data-label=\"Record\"] a").click(createPopup);


    // limit number of words for Notes
    $("td[data-label=\"Note\"]").each(function() {
        var noteCell = $(this),
            noteContent = $(this).text(),
            noteArray = noteContent.split(" "),
            visibleNotePart = noteArray.slice(0, 5).join(" "),
            hiddenNotePart = noteArray.slice(5).join(" "),
            more = "<br><a href=\"#\" class=\"more-note\">more >></a>";

            console.log(noteArray);


        // show only first 5 words if note is too long 
        if (noteArray.length > 5) {

            $(this).text(visibleNotePart);
            $(this).append(more);  
        }


        // show the rest of the note when user click on 'more'
        noteCell.find(".more-note").click(function(event) { 
            event.preventDefault(); 
            noteCell.append(hiddenNotePart);
            $(this).hide();
        });
    });

     

    // execute the following code for tablet and mobile screens
    } else {

        //replace abbreviations with the full explanation
        addFullName("td[data-label=\"Status\"]", "statusAbbr");
        addFullName("td[data-label=\"Co\"]", "countyAbbr");
        addFullName("td[data-label=\"Co2\"]", "countyAbbr2");


    
    // create popup window with contributors when user clicks on a record #
    $("td[data-label=\"Record\"] a").click(createPopup);

        // update the subheader at the top of the table
        $(".table-subheading").text("Click on the row for more information.");
        $(".table-subheading2").hide();


          // add unique id to each table head cell in order to target them in styles
        $("th").each(function(i) {
            $(this).attr('id', "headcell" + i);
        });
   
        /*  hide some of the table head items */
        $("th#headcell0, th#headcell2, th#headcell3, th#headcell5, th#headcell7, th#headcell8, th#headcell9").remove();

        // append new row after each Status/Date/Location row
        // create two table cells in it
        // append additional information to each cell
        $("#database-table tbody tr").each(function(i) {


            // create structure for a new row and new table cells
            $(this).after("<tr class=\"details\"><td colspan=\"1\" id=\"mobile-info" + i + "\"></td>" +
                        "<td colspan=\"2\" id=\"mobile-note" + i + "\"></td></tr>");


            // target content in rows which is going to be put together
            var recordNumber = $(this).find($("td[data-label=\"Record\"]")).text();
            var recordLink = $(this).find($("td[data-label=\"Record\"] a")).attr("href");
            var species = $(this).find($("td[data-label=\"Species\"]")).text();
            var count = $(this).find($("td[data-label=\"Count\"]")).text();
            var county = $(this).find($("td[data-label=\"Co\"]")).text();
            var county2 = $(this).find($("td[data-label=\"Co2\"]")).text();
            var note = $(this).find($("td[data-label=\"Note\"]")).text();
            var br = "<br>";


            // add link to record number if there is any link
            if (recordLink !== undefined) {
                var recordInfo =  "<span>Record: </span> <a href=\"" + recordLink + "\">" + recordNumber + "</a>" + br;
            } else {
                var recordInfo =  "<span>Record: </span>" + recordNumber + br;
            }

            // add content together
            var fullInfo = recordInfo + 
                            "<span>Species: </span>" + species + br + 
                            "<span>Count: </span>" + count + br +
                            "<span>Co: </span>" + county + br +
                            "<span>Co2: </span>" + county2 + br;

            var fullNote = "<span>Note:</span> " + note + br;


            // append content to first cell
            $("#database-table #mobile-info" + i).append(fullInfo);


            // append content to second cell with note
             $("#database-table #mobile-note" + i).append(fullNote);


             // create a popup window with list of contributors
             // when user clicks on a record # with the link
            $("#database-table #mobile-info" + i + " a").click(createPopup);             
        });

        

        // replace 'First Date' with 'Date' in the table head
        $("th#headcell4").text("Date");


        // append last date to first date if it exist
        $("td[data-label=\"First Date\"]").each(function() {

            // remove possible whitespaces from the beginning 
            // and the end of the last date and store it in a variable
            var lastDate = $.trim($(this).next().text());

            // add first date to last date and store them in a variable
            var fullDate =  $(this).text() + "-" + lastDate;

            // replace first date with full date if last date exists
            if (lastDate !== "") {
                $(this).text(fullDate);
            }
        });

        // remove certain rows since they are no longer needed
        $("td[data-label=\"Record\"]").remove();
         $("td[data-label=\"Species\"]").remove();
        $("td[data-label=\"Count\"]").remove();
        $("td[data-label=\"Co\"]").remove();
        $("td[data-label=\"Co2\"]").remove();
        $("td[data-label=\"Note\"]").remove();
        $("td[data-label=\"Last Date\"]").remove();
        
        
        // open/close row with additional information
        // when clicking on table row
        $("#database-table tbody tr").not(".details").click(function() {
            $(this).next().toggle(500);
        });

    }; // end of if-else block 
});
