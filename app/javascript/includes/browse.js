$(function(){
  var $activeSlide = $('#slides .slide:first-child')

  // show first slide
  // $activeSlide.addClass('showing');

  $(".match-tile").on("click", function() {
    var user_id = $(this).data("id");
    console.log(user_id)
    $.ajax({
      url: "/get/conversation/" + user_id,
      method: "post",
      dataType: "script"
    })

    $("#conversation").show();
  });

  $("#close-conversation").on("click", function() {
    $("#conversation").hide();
  })


  $("#decline").on("click", function(){
    goToSlide('decline');
  })

  $("#approve").on("click", function(){
    var user_id = $activeSlide.data("id");

    console.log(user_id);

    $.ajax({
      url: "/approve/" + user_id,
      method: "post",
      dataType: "ajax"
    })

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


