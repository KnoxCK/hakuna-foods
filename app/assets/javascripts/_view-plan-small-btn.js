$(document).ready(function() {
  $(".meal-plans-section #view-plan").click(function(e) {
    e.preventDefault();
    console.log($(this).data("target"));
    $($(this).data("target")).toggleClass("hidden");
    $(this).text(function(i, text) {
      return text === "HIDE PLAN" ? "VIEW PLAN" : "HIDE PLAN";
    });
    $($(this).data("button")).toggleClass("hidden");
  });
});

// $(document).on('click', '.view-maintain-btn', function(e) {
//   $(".maintain-read-more").removeClass("hidden");
//   $(".view-maintain-btn").addClass("hidden");
//   $(".book-maintain-btn").removeClass("hidden");
// e.preventDefault();
// });

// $(document).on('click', '.view-train-btn', function(e) {
//   $(".train-read-more").removeClass("hidden");
//   $(".view-train-btn").addClass("hidden");
//   $(".book-train-btn").removeClass("hidden");
// e.preventDefault();
// });

// $(document).on('click', '.view-train-btn', function(e) {
//   $(".train-read-more").removeClass("hidden");
//   $(".view-train-btn").addClass("hidden");
//   $(".book-train-btn").removeClass("hidden");
// e.preventDefault();
// });

// $(document).on('click', '.view-trim-btn', function(e) {
//   $(".trim-read-more").removeClass("hidden");
//   $(".view-trim-btn").addClass("hidden");
//   $(".book-trim-btn").removeClass("hidden");
// e.preventDefault();
// });

// $(document).on('click', '.view-postnatal-btn', function(e) {
//   $(".postnatal-read-more").removeClass("hidden");
//   $(".view-postnatal-btn").addClass("hidden");
//   $(".book-postnatal-btn").removeClass("hidden");
// e.preventDefault();
// });

// $(document).on('click', '.view-veg-btn', function(e) {
//   $(".veg-read-more").removeClass("hidden");
//   $(".view-veg-btn").addClass("hidden");
//   $(".book-veg-btn").removeClass("hidden");
// e.preventDefault();
// });

// $(document).on('click', '.view-bespoke-btn', function(e) {
//   $(".bespoke-read-more").removeClass("hidden");
//   $(".view-bespoke-btn").addClass("hidden");
//   $(".book-bespoke-btn").removeClass("hidden");
// e.preventDefault();
// });
