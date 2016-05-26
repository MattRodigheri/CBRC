// this is where the captions are entered and the file name of the bird photos are stored. 

var random_images_array = [
{filename: "b-LCSP-Shannon-_-Dan-Skalos-27-Dec-2014-2014-157.jpg", caption: "Le Conte's Sparrow, 27 Dec 2014, Pt. Reyes MRN &copy; Dan Skalos"},

{filename: "2013-03-29-Tijuana-River-mouth-WIPL-MSadowski-a-2013-044.jpg", caption: "Wilson's Plover, 29 Mar 2013, Imperial Beach SD &copy; Matt Sadowski"},

{filename: "2015-013-COSC-DN-BBouton1.jpg", caption: "Common Scoter, 25 Jan 2015, Crescent City DN &copy; Bill Bouton"},

{filename: "Arctic-Loon-(1)-DSC3304-Dave-Furseth-2-Jun-2013-2013-070.jpg", caption: "Arctic Loon, 2 Jun 2013, San Dimas LA &copy; Dave Furseth"},

{filename: "Bolinas-Black-Vulture-2-1-2015-Rick-Lebadour-2015-015.jpg", caption: "Black Vulture, 1 Feb 2014, Bolinas MRN &copy; Rick LeBaudour"},

{filename: "BWWA-MTY-KSpencer2-2015-078.jpg", caption: "Blue-winged Warbler, 24 May 2015, Monterey Bay MTY &copy; Kate Spencer"},

{filename: "CASP-6295-30May15-LA-LSansone-2015-040.jpg", caption: "Cassin's Sparrow, 30 May 2015, Castaic LA &copy; Larry Sansone"},

{filename: "ecc_b-GRSH-Alvaro-Jaramillo-11-Aug-2013-2013-103.jpg", caption: "Great Shearwater, 11 Aug 2013, off SE Farallon SF &copy; Alvaro Jaramillo"},

{filename: "GRHA-Carpinteria-26-Jan-14-2-Ryan-Winkleman-2013-225.jpg", caption: "Gray Hawk, 6 Jan 2014, Carpinteria SBA &copy; Ryan Winkleman"},

{filename: "hawaiian-petrel-(1)-David-Pavlik-2-Aug-2012-2013-100.jpg", caption: "Hawaiian Petrel, 2 Aug 2013, Monterey Bay MTY &copy; David Pavlik"},

{filename: "HUGO-(6)-Kenneth-Z.jpg", caption: "Hudsonian Godwit, 25 May 2013, Kershaw Pond IMP &copy; Kenneth Z. Kurland"},

{filename: "LI19FB~1-Curtis-A-Marantz-18-Dec-2013-2013-228.jpg", caption: "Little Bunting, 18 Dec 2013, McKinleyville HUM &copy; Curtis A. Marantz"},

{filename: "MASA-Joseph-Morlan-11-Apr-2014-2014-032.jpg", caption: "Marsh Sandpiper, 11 Apr 2014, Dixon SOL &copy; Joseph Morlan"},

{filename: "Matt-Grube-23-Mar-2013-2013-040.jpg", caption: "Cave Swallow, 23 Mar 2013, Salton Sea IMP &copy; Matt Grube"},

{filename: "Olive-backed-Pipit-5922-02Nov14-Orange-Co.jpg", caption: "Olive-backed Pipit, 2 Nov 2014, Anaheim ORA &copy; Larry Sansone"},

{filename: "Red-necked-Stint-(IMG_8801)---Harper-Dry-Lake---8-Aug-2013-Curtis-A-Marantz-2013-102.jpg", caption: "Red-necked Stint, 8 Aug 2013, Harper Dry Lake SBE &copy; Curtis A Marantz"},

{filename: "Ruby-throated-Hummingbird,-Adult-Male_6956-Marlin-Harms-5-Sep-2014-2014-079.jpg", caption: "Ruby-throated Hummingbird, 5 Sep 2014, Arroyo Grande SLO &copy; Marlin Harms"},

{filename: "Varied-Bunting-m-9178-Larry-Sansone-30March14-Los-Angeles-Co.jpg", caption: "Varied Bunting, 30 Mar 2014, Encanto Park LA &copy; Larry Sansone"},

{filename: "woothr_primm-Thomas-A-Benson-31-Oct-2013-2013-194.jpg", caption: "Wood Thrush, 31 Oct 2013, Primm Valley SBE &copy; Thomas A. Benson"} 
]
    

// This is the end of the section for updating the captions and photo file names




function getRandomImage(imgAr) {
	var num = Math.floor(Math.random()*random_images_array.length)

    var img = imgAr[num].filename;
    var imgStr = '<img class="db-image" src="database_bird_photos/' + img + '" alt = "">';
    var captionStr = imgAr[num].caption;
    
    document.write(imgStr); 
    document.write('<p class="caption">' + captionStr + '</div>'); 
    document.close();
}



	