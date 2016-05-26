$(document).ready(function(){

  $(function() {
  	$(".search-icon").click(function() {
  		// $("#searchform #s").toggleClass("box-change");
      $(".top-search").toggleClass("box-change");
  	});
  });

});



$(document).ready(function(){
  $(".search-icon").click(function(){
    // $("header li :not(.search-icon)").toggle();
    // $(".top-search").toggle();
    // $("#searchform #s").css("width", "100%");
    // $("#searchform #s").toggleClass("show-search");


  // $(document).click(function(event) {
  // if(!$(event.target).closest('.top-search').length &&
  //    !$(event.target).is('.top-search')) {
  //     if($('.top-search').is(":visible")) {
  //         $('.top-search').hide();
  //     }
  //   }
  // });


    // $(".search-icon").click(function(e){
    //   e.stopPropagation();
    //     $(".top-search").toggle();
    // });
    //
    // $(document).click(function(){
    //   var $el = $(".top-search");
    //   if ($el.is(":visible")) {
    //     return false;
    //     $el.hide();
    //     // $el.fadeOut(200);
    //   }
    // })
  });
});


function dropMenu() {
    document.getElementsByTagName("ul")[0].classList.toggle("responsive");
    // document.getElementsByClassName("shade")[0].style.display="block");
};

/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function reportDropdown() {
    document.getElementById("reportDropdown").classList.toggle("show");
    // document.getElementById("test").style.borderBottom='thick solid #307984';
    // document.getElementById("test").style.paddingBottom='15px';
}

function aboutDropdown() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    for (var i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
