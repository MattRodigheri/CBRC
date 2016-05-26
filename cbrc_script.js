function reportDropdown() {
    document.getElementById("reportDropdown").classList.toggle("show");
}

function listsDropdown() {
    document.getElementById("listsDropdown").classList.toggle("show");
}

function aboutDropdown() {
    document.getElementById("aboutDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

function dropMenu() {
    document.getElementsByTagName("ul")[0].classList.toggle("responsive");
};

function revert(x) {
  x.style.borderColor="#9db8bd";
  document.getElementById("submit_btn").innerHTML = "Submit";
}

function revertRecorded() {
  document.getElementById("recorded").style.color="#307984";
  document.getElementById("submit_btn").innerHTML = "Submit";
}

function revertCertain() {
  document.getElementById("certain").style.color="#307984";
  document.getElementById("submit_btn").innerHTML = "Submit";
}

$(document).ready(function() {

  if (navigator.appVersion.indexOf("Win")!=-1){
    document.getElementById("uploadFile").style.marginTop = "60px";
    document.getElementById("uploadFile").style.marginLeft = "-100px";
  };

  if ($(window).width() <= 992 ) {
    $("#search-input").attr("placeholder","Search");
  }

  //----- OPEN
  $('[data-popup-open]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-open');
        $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);

        e.preventDefault();
    });

    //----- CLOSE
    $('[data-popup-close]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-close');
        $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);

        e.preventDefault();
    });

  $(".search-icon").click(function() {
    $(".top-search").toggleClass("box-change");
  });

  $("#species").autocomplete({
    source: [
      "Black-bellied Whistling-Duck Dendrocygna autumnalis",
      "Fulvous Whistling-Duck Dendrocygna bicolor",
      "Tundra Bean-Goose Anser serrirostris",
      "Emperor Goose Chen canagica",
      "Whooper Swan Cygnus cygnus",
      "Falcated Duck Anas falcata",
      "American Black Duck Anas rubripes",
      "Garganey Anas querquedula",
      "Baikal Teal Anas formosa",
      "Common Pochard Aythya ferina",
      "Steller's Eider Polysticta stelleri",
      "King Eider Somateria spectabilis",
      "Common Eider Somateria mollissima",
      "Common Scoter Melanitta nigra",
      "Smew Mergellus albellus",
      "Arctic Loon Gavia arctica",
      "Yellow-billed Loon Gavia adamsii",
      "Least Grebe Tachybaptus dominicus",
      "White-capped Albatross Thalassarche cauta",
      "Salvin's Albatross Thalassarche salvini",
      "Chatham Albatross Thalassarche eremita",
      "Light-mantled Albatross Phoebetria palpebrata",
      "Wandering Albatross Diomedea exulans",
      "Short-tailed Albatross Phoebastria albatrus",
      "Great-winged Petrel Pterodroma macroptera",
      "Stejneger's Petrel Pterodroma longirostris",
      "Bulwer's Petrel Bulweria bulwerii",
      "White-chinned Petrel Procellaria aequinoctialis",
      "Parkinson's Petrel Procellaria parkinsoni",
      "Streaked Shearwater Calonectris leucomelas",
      "Cory's Shearwater Calonectris diomedea",
      "Great Shearwater Puffinus gravis",
      "Wedge-tailed Shearwater Puffinus pacificus",
      "Newell’s Shearwater Puffinus newelli",
      "Ringed Storm-Petrel Oceanodroma hornbyi",
      "Wedge-rumped Storm-Petrel Oceanodroma tethys",
      "Tristram's Storm-Petrel Oceanodroma tristrami",
      "White-tailed Tropicbird Phaethon lepturus",
      "Red-tailed Tropicbird Phaethon rubricauda",
      "Magnificent Frigatebird Fregata magnificens",
      "Great Frigatebird Fregata minor",
      "Lesser Frigatebird Fregata ariel",
      "Masked Booby Sula dactylatra",
      "Nazca Booby Sula granti",
      "Red-footed Booby Sula sula",
      "Northern Gannet Morus bassanus",
      "Anhinga Anhinga anhinga",
      "Tricolored Heron Egretta tricolor",
      "White Ibis Eudocimus albus",
      "Glossy Ibis Plegadis falcinellus",
      "Roseate Spoonbill Platalea ajaja",
      "Black Vulture Coragyps atratus",
      "Swallow-tailed Kite Elanoides forficatus",
      "Mississippi Kite Ictinia mississippiensis",
      "Common Black Hawk Buteogallus anthracinus",
      "Gray Hawk Buteo plagiatus",
      "Purple Gallinule Porphyrio martinicus",
      "Common Crane Grus grus",
      "Lesser Sand-Plover Charadrius mongolus",
      "Greater Sand-Plover Charadrius leschenaultii",
      "Wilson's Plover Charadrius wilsonia",
      "Common Ringed Plover Charadrius hiaticula",
      "Piping Plover Charadrius melodus",
      "Eurasian Dotterel Charadrius morinellus",
      "Terek Sandpiper Xenus cinereus",
      "Gray-tailed Tattler Tringa brevipes",
      "Spotted Redshank Tringa erythropus",
      "Common Greenshank Tringa nebularia",
      "Marsh Sandpiper Tringa stagnatilis",
      "Wood Sandpiper Tringa glareola",
      "Upland Sandpiper Bartramia longicauda",
      "Little Curlew Numenius minutus",
      "Bristle-thighed Curlew Numenius tahitiensis",
      "Hudsonian Godwit Limosa haemastica",
      "Bar-tailed Godwit Limosa lapponica",
      "Curlew Sandpiper Calidris ferruginea",
      "Long-toed Stint Calidris subminuta",
      "Red-necked Stint Calidris ruficollis",
      "Little Stint Calidris minuta",
      "White-rumped Sandpiper Calidris fuscicollis",
      "Jack Snipe Lymnocryptes minimus",
      "Common Snipe Gallinago gallinago",
      "American Woodcock Scolopax minor",
      "Thick-billed Murre Uria lomvia",
      "Long-billed Murrelet Brachyramphus perdix",
      "Kittlitz's Murrelet Brachyramphus brevirostris",
      "Least Auklet Aethia pusilla",
      "Crested Auklet Aethia cristatella",
      "Swallow-tailed Gull Creagrus furcatus",
      "Red-legged Kittiwake Rissa brevirostris",
      "Ivory Gull Pagophila eburnea",
      "Black-headed Gull Chroicocephalus ridibundus",
      "Little Gull Hydrocoloeus minutus",
      "Ross's Gull Rhodostethia rosea",
      "Belcher's Gull Larus belcheri",
      "Black-tailed Gull Larus crassirostris",
      "Iceland Gull Larus glaucoides",
      "Slaty-backed Gull Larus schistisagus",
      "Great Black-backed Gull Larus marinus",
      "Kelp Gull Larus dominicanus",
      "Sooty Tern Onychoprion fuscatus",
      "Bridled Tern Onychoprion anaethetus",
      "White-winged Tern Chlidonias leucopterus",
      "Sandwich Tern Thalasseus sandvicensis",
      "Oriental Turtle-Dove Streptopelia orientalis",
      "Ruddy Ground-Dove Columbina talpacoti",
      "Common Cuckoo Cuculus canorus",
      "Black-billed Cuckoo Coccyzus erythropthalmus",
      "Groove-billed Ani Crotophaga sulcirostris",
      "Snowy Owl Bubo scandiacus",
      "Elf Owl Micrathene whitneyi",
      "Chuck-will's-widow Antrostomus carolinensis",
      "Buff-collared Nightjar Antrostomus ridgwayi",
      "Eastern Whip-poor-will Antrostomus vociferus",
      "White-collared Swift Streptoprocne zonaris",
      "Common Swift Apus apus",
      "Green Violetear Colibri thalassinus",
      "Magnificent Hummingbird Eugenes fulgens",
      "Blue-throated Hummingbird Lampornis clemenciae",
      "Ruby-throated Hummingbird Archilochus colubris",
      "Broad-billed Hummingbird Cynanthus latirostris",
      "Violet-crowned Hummingbird Amazilia violiceps",
      "Xantus's Hummingbird Hylocharis xantusii",
      "Red-headed Woodpecker Melanerpes erythrocephalus",
      "Crested Caracara Caracara cheriway",
      "Eurasian Kestrel Falco tinnunculus",
      "Gyrfalcon Falco rusticolus",
      "Greater Pewee Contopus pertinax",
      "Eastern Wood-Pewee Contopus virens",
      "Yellow-bellied Flycatcher Empidonax flaviventris",
      "Alder Flycatcher Empidonax alnorum",
      "Dusky-capped Flycatcher Myiarchus tuberculifer",
      "Nutting's Flycatcher Myiarchus nuttingi",
      "Great Crested Flycatcher Myiarchus crinitus",
      "Sulphur-bellied Flycatcher Myiodynastes luteiventris",
      "Couch's Kingbird Tyrannus couchii",
      "Thick-billed Kingbird Tyrannus crassirostris",
      "Fork-tailed Flycatcher Tyrannus savana",
      "Brown Shrike Lanius cristatus",
      "White-eyed Vireo Vireo griseus",
      "Blue-headed Vireo Vireo solitarius",
      "Blue Jay Cyanocitta cristata",
      "Sky Lark Alauda arvensis",
      "Cave Swallow Petrochelidon fulva",
      "Winter Wren Troglodytes hiemalis",
      "Sedge Wren Cistothorus platensis",
      "Dusky Warbler Phylloscopus fuscatus",
      "Arctic/Kamchatka Leaf Warbler Phylloscopus borealis/examinandus",
      "Lanceolated Warbler Locustella lanceolata",
      "Bluethroat Luscinia svecica",
      "Red-flanked Bluetail Tarsiger cyanurus",
      "Taiga Flycatcher Ficedula albicilla",
      "Northern Wheatear Oenanthe oenanthe",
      "Stonechat Saxicola torquatus",
      "Veery Catharus fuscescens",
      "Gray-cheeked Thrush Catharus minimus",
      "Wood Thrush Hylocichla mustelina",
      "Eyebrowed Thrush Turdus obscurus",
      "Rufous-backed Robin Turdus rufopalliatus",
      "Curve-billed Thrasher Toxostoma curvirostre",
      "Eastern Yellow Wagtail Motacilla tschutschensis",
      "Gray Wagtail Motacilla cinerea",
      "White Wagtail Motacilla alba",
      "Olive-backed Pipit Anthus hodgsoni",
      "Smith's Longspur Calcarius pictus",
      "Snow Bunting Plectrophenax nivalis",
      "Worm-eating Warbler Helmitheros vermivorum",
      "Louisiana Waterthrush Parkesia motacilla",
      "Golden-winged Warbler Vermivora chrysoptera",
      "Blue-winged Warbler Vermivora cyanoptera",
      "Connecticut Warbler Oporornis agilis",
      "Mourning Warbler Geothlypis philadelphia",
      "Cape May Warbler Setophaga tigrina",
      "Cerulean Warbler Setophaga cerulea",
      "Grace's Warbler Setophaga graciae",
      "Golden-cheeked Warbler Setophaga chrysoparia",
      "Red-faced Warbler Cardellina rubrifrons",
      "Cassin's Sparrow Peucaea cassinii",
      "Field Sparrow Spizella pusilla",
      "Baird's Sparrow Ammodramus bairdii",
      "Le Conte's Sparrow Ammodramus leconteii",
      "Little Bunting Emberiza pusilla",
      "Rustic Bunting Emberiza rustica",
      "Pyrrhuloxia Cardinalis sinuatus",
      "Varied Bunting Passerina versicolor",
      "Rusty Blackbird Euphagus carolinus",
      "Common Grackle Quiscalus quiscula",
      "Streak-backed Oriole Icterus pustulatus",
      "Brambling Fringilla montifringilla",
      "Black Rosy-Finch Leucosticte atrata",
      "Common Rosefinch Carpodacus erythrinus",
      "White-winged Crossbill Loxia leucoptera",
      "Common Redpoll Acanthis flammea",
      "Taiga/Tundra Bean-Goose Anser fabalis/serrirostris",
      "Magnificent/Great/Lesser Frigatebird Fregata magnificens/minor/ariel",
      "Masked/Nazca Booby Sula dactylatra/granti",
      "Blue-winged X Golden-winged Warbler Vermivora cyanoptera X V. chrysoptera"
      ]
  });


  $("#submit_btn").click(function() {

    if(document.getElementById("species").value=="" || document.getElementById("species").value==null){
      document.getElementById("species").style.borderColor = "red";
      document.getElementById("submit_btn").innerHTML = "Required Input Missing";
      return false;
    }
    if(document.getElementById("firstDate").value != document.getElementById("firstDate").value.match(/[0-9]{2}\/[0-9]{2}\/[0-9]{2}/) && document.getElementById("firstDate").value != document.getElementById("firstDate").value.match(/[0-9]{2}\/[0-9]{2}\/[0-9]{4}/) || document.getElementById("firstDate").value==null){
      document.getElementById("firstDate").style.borderColor = "red";
      document.getElementById("submit_btn").innerHTML = "Required Input Missing";
      return false;
    }
    if(document.getElementById("number").value=="" || document.getElementById("number").value==null){
      document.getElementById("number").style.borderColor = "red";
      document.getElementById("submit_btn").innerHTML = "Required Input Missing";
      return false;
    }
    if(document.getElementById("county").value=="select"){
      document.getElementById("county").style.borderColor = "red";
      document.getElementById("submit_btn").innerHTML = "Required Input Missing";
      return false;
    }
    if(document.getElementById("location").value=="" || document.getElementById("location").value==null){
      document.getElementById("location").style.borderColor = "red";
      document.getElementById("submit_btn").innerHTML = "Required Input Missing";
      return false;
    }
    if(document.getElementById("name").value=="" || document.getElementById("name").value==null){
      document.getElementById("name").style.borderColor = "red";
      document.getElementById("submit_btn").innerHTML = "Required Input Missing";
      return false;
    }
    if(document.getElementById("email").value != document.getElementById("email").value.match(/[-a-z0-9~!$%^&*_=+.]+@[-a-z0-9~!$%^&*_=+.]+/i) || document.getElementById("email").value==null){
      document.getElementById("email").style.borderColor = "red";
      document.getElementById("submit_btn").innerHTML = "Required Input Missing";
      return false;
    }
    if(!document.getElementById("recordedYes").checked && !document.getElementById("recordedNo").checked){
      document.getElementById("recorded").style.color = "red";
      document.getElementById("submit_btn").innerHTML = "Required Input Missing";
      return false;
    }
    if(!document.getElementById("certainYes").checked && !document.getElementById("certainNo").checked){
      document.getElementById("certain").style.color = "red";
      document.getElementById("submit_btn").innerHTML = "Required Input Missing";
      return false;
    }
    if(document.getElementById("description").value=="" || document.getElementById("description").value==null){
      document.getElementById("description").style.borderColor = "red";
      document.getElementById("submit_btn").innerHTML = "Required Input Missing";
      return false;
    }

      var proceed = true;
        if(proceed) //everything looks good! proceed...
        {
           //data to be sent to server
            var m_data = new FormData();
            m_data.append( 'species', $('input[name=species]').val());
            m_data.append( 'firstDate', $('input[name=firstDate]').val());
            m_data.append( 'lastDate', $('input[name=lastDate]').val());
            m_data.append( 'number', $('input[name=number]').val());
            m_data.append( 'county', $('select[name=county]').val());
            m_data.append( 'name', $('input[name=name]').val());
            m_data.append( 'email', $('input[name=email]').val());
            m_data.append( 'location', $('input[name=location]').val());
            m_data.append( 'others', $('input[name=others]').val());
            m_data.append( 'opticals', $('input[name=opticals]').val());
            m_data.append( 'time', $('input[name=time]').val());
            m_data.append( 'recorded', $('input[name=recorded]:checked').val());
            m_data.append( 'certain', $('input[name=certain]:checked').val());
            m_data.append( 'sightingdescription', $('textarea[name=sightingdescription]').val());
			      m_data.append( 'file_attach', $('input[name=file_attach]')[0].files[0]);

            //instead of $.post() we are using $.ajax() because $.ajax() has more options and flexibly.
  			$.ajax({
              url: 'report_sighting.php',
              data: m_data,
              processData: false,
              contentType: false,
              type: 'POST',
              dataType:'json',
              success: function(response){
               }
            });
        }
        document.getElementById("submit_btn").innerHTML = "Thank you for your submission";
    });
});

// This is for the Foundations page //
//////////////////////////////////////

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
