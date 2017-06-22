//example menu right arrow clik
$(".right-arrow-1").click(function(e) {
  e.preventDefault();
  $(".example-menu-1").addClass("hidden");
  $(".example-menu-2").removeClass("hidden");
});
$(".right-arrow-2").click(function(e) {
  e.preventDefault();
  $(".example-menu-2").addClass("hidden");
  $(".example-menu-3").removeClass("hidden");
});
$(".right-arrow-3").click(function(e) {
  e.preventDefault();
  $(".example-menu-3").addClass("hidden");
  $(".example-menu-4").removeClass("hidden");
});
$(".right-arrow-4").click(function(e) {
  e.preventDefault();
  $(".example-menu-4").addClass("hidden");
  $(".example-menu-5").removeClass("hidden");
});
$(".right-arrow-5").click(function(e) {
  e.preventDefault();
  $(".example-menu-5").addClass("hidden");
  $(".example-menu-1").removeClass("hidden");
});

//example menu left arrow clik
$(".left-arrow-1").click(function(e) {
  e.preventDefault();
  $(".example-menu-1").addClass("hidden");
  $(".example-menu-5").removeClass("hidden");
});
$(".left-arrow-2").click(function(e) {
  e.preventDefault();
  $(".example-menu-2").addClass("hidden");
  $(".example-menu-1").removeClass("hidden");
});
$(".left-arrow-3").click(function(e) {
  e.preventDefault();
  $(".example-menu-3").addClass("hidden");
  $(".example-menu-2").removeClass("hidden");
});
$(".left-arrow-4").click(function(e) {
  e.preventDefault();
  $(".example-menu-4").addClass("hidden");
  $(".example-menu-3").removeClass("hidden");
});
$(".left-arrow-5").click(function(e) {
  e.preventDefault();
  $(".example-menu-5").addClass("hidden");
  $(".example-menu-4").removeClass("hidden");
});
