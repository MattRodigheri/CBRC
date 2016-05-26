
// execute the following code when the document is fully loaded
$(document).ready(function() {

	// show more text when user clicks on 'Read More'
	// display 'Read Less' when the whole text is displayed
	// hide text again when user clicks 'Read Less'
	$(".read-more").each(function() {

		$(this).click(function(event) {
			event.preventDefault();

			var introText = $(this).next(),
				readMore = $(this),
				readLess = $(".read-less");

			readMore.hide();
			introText.show();
			readLess.show();
			introText.find(".read-less").click(function(event) {
				event.preventDefault();
				introText.hide();
				readMore.show();
				readLess.hide();
			});
		});
	});


	
	// execute the followding code for mobile screens
    if ($(window).width() <= 768) { 

    	// hide the data inside sections
    	$(".main-list, .legend-list, .supplemental-list").css("display", "none");


    	// add click event for each h2 heading
    	$(".birdlist-wrapper h2").each(function() {
    		$(this).click(function() {


    			// set a variable for the section wtih data
    			// that is located after h2 heading
    			var section = $(this).next();

    			// shildeToggle() will show section on click if it's closed
    			// and close it if it's opened
    			section.slideToggle();
    		});
    	});
    }
});