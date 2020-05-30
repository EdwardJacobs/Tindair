$(function() {
  var $activeSlide = $('#slides .slide:first-child')

  // $activeSlide.addClass('showing');

  $("#decline").on("click", function(){
    goToSlide('decline');
  })

  $("#approve").on("click", function(){
    goToSlide('approve');
  })


  function goToSlide(action) {
    $activeSlide.removeClass('showing');
    $activeSlide = $activeSlide.next(".slide");
    if (action == "approve") {
      console.log(action)
    } else {
      console.log(action)
    }

    $activeSlide.next(".slide").addClass("showing");

  }
});


