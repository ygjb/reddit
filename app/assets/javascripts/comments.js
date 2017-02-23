"use strict";

document.addEventListener("turbolinks:load", function () {
  var $input = $("form input[type='submit']");
  var $textarea = $("form textarea");
  $("#new_comment").submit(function (event) {
    var textarea = $textarea;
    var value = textarea.val();
    if (value.length > 0) {
      $(".fountainG").css("animation-name", "bounce_fountainG");
      $("#fountainG").css("visibility", "visible");
      return;
    } else {
      event.preventDefault();
    }
  });
  $("#new_comment").on("ajax:complete", function (event, xhr, status) {
    $textarea.val("");
    $(".fountainG").css("animation-name", "0");
    $("#fountainG").css("visibility", "hidden");
    console.log("sended!");
  });
});