// this is where the captions are entered and the file name of the bird photos are stored. 

var random_images_array = [
{filename: "b-LCSP-Shannon-_-Dan-Skalos-27-Dec-2014-2014-157.jpg", caption: "LCSP-Shannon Dan Skalos 27-Dec-2014-2014"},

{filename: "2013-03-29-Tijuana-River-mouth-WIPL-MSadowski-a-2013-044.jpg", caption: "Tijuana River mouth MSadowski 2013-03-29"},

{filename: "2015-013-COSC-DN-BBouton1.jpg", caption: "BBouton1"},

{filename: "8596843542_3feee6457b_b-Jimmy-McMorran-27-Mar-2013-2013-043.jpg", caption: "TJimmy-McMorran 27-Mar-2013"},

{filename: "Arctic-Loon-(1)-DSC3304-Dave-Furseth-2-Jun-2013-2013-070.jpg", caption: "Arctic-Loon Dave Furseth 2-Jun-2013"},

{filename: "Bolinas-Black-Vulture-2-1-2015-Rick-Lebadour-2015-015.jpg", caption: "Bolinas-Black-Vulture Rick Lebadour 2-1-2015"},

{filename: "BWWA-MTY-KSpencer2-2015-078.jpg", caption: "KSpencer 2-2015"},

{filename: "CASP-6295-30May15-LA-LSansone-2015-040.jpg", caption: "May-30-15 LSansone"},

{filename: "ecc_b-GRSH-Alvaro-Jaramillo-11-Aug-2013-2013-103.jpg", caption: "Alvaro-Jaramillo 11-Aug-2013"},

{filename: "GRAT-SD-LRuby_4694-2015-074.jpg", caption: "GRAT-SD-LRuby"},

{filename: "GRHA-Carpinteria-26-Jan-14-2-Ryan-Winkleman-2013-225.jpg", caption: "GRHA-Carpinteria Ryan Winkleman 6-Jan-14"},

{filename: "hawaiian-petrel-(1)-David-Pavlik-2-Aug-2012-2013-100.jpg", caption: "Hawaiian petrel MSadowski 2-Aug-2012"},

{filename: "HUGO-(6)-Kenneth-Z.jpg", caption: "HUGO-(6)-Kenneth"},

{filename: "LI19FB~1-Curtis-A-Marantz-18-Dec-2013-2013-228.jpg", caption: "Curtis A Marantz 18-Dec-2013"},

{filename: "MASA-Joseph-Morlan-11-Apr-2014-2014-032.jpg", caption: "MASA Joseph-Morlan MSadowski 11-Apr-2014"},

{filename: "Matt-Grube-23-Mar-2013-2013-040.jpg", caption: "Matt Grube MSadowski 23-Mar-2013"},

{filename: "Olive-backed-Pipit-5922-02Nov14-Orange-Co.jpg", caption: "Olive-backed Pipit Nov-2-14"},

{filename: "Red-necked-Stint-(IMG_8801)---Harper-Dry-Lake---8-Aug-2013-Curtis-A-Marantz-2013-102.jpg", caption: "Red-necked Stint Curtis A Marantz 8-Aug-2013"},

{filename: "Ruby-throated-Hummingbird,-Adult-Male_6956-Marlin-Harms-5-Sep-2014-2014-079.jpg", caption: "TRuby-throated Hummingbird Marlin Harms 5-Sep-2014"},

{filename: "Varied-Bunting-m-9178-Larry-Sansone-30March14-Los-Angeles-Co.jpg", caption: "Varied Bunting Larry Sansone March-30-14 Los-Angeles"},

{filename: "woothr_primm-Thomas-A-Benson-31-Oct-2013-2013-194.jpg", caption: "woothr primm Thomas A Benson 31-Oct-2013"} 
]
    

// This is the end of the section for updating the captions 




function getRandomImage(imgAr) {
	var num = Math.floor(Math.random()*random_images_array.length)

    var img = imgAr[num].filename;
    var imgStr = '<img class="db-image" src="database_bird_photos/' + img + '" alt = "">';
    var captionStr = imgAr[num].caption;
    
    document.write(imgStr); 
    document.write('<p class="caption">' + captionStr + '</div>'); 
    document.close();
}



function assignListeners(){


var readMoreFunction = document.getElementById("Read_more_function");
var functionOfCommittee = document.getElementById("function-document");

var readMoreEditorial = document.getElementById("Read_more_editorial");
var journalEditorial = document.getElementById("editorial-document")

var collapsFunction = document.getElementById("collapse-function");
var collapsEditorial = document.getElementById("collapse-editorial")


readMoreFunction.addEventListener("click", function(){
        readMoreFunction.classList.add("hide");
         functionOfCommittee.classList.remove("hide");
});

readMoreEditorial.addEventListener("click", function(){
        readMoreEditorial.classList.add("hide");
         journalEditorial.classList.remove("hide");
});

collapsFunction.addEventListener("click", function(){
          readMoreFunction.classList.remove("hide");
          functionOfCommittee.classList.add("hide");
});
    

collapsEditorial.addEventListener("click", function(){
     journalEditorial.classList.add("hide");
     readMoreEditorial.classList.remove("hide");
});
   
}
	