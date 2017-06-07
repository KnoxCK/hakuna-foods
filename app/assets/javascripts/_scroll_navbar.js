$(window).scroll(function() {
    var scroll = $(window).scrollTop();

    if (scroll > $(window).height() * 0.10) {
        $(".navbar-hakuna-landing").addClass("hidden");
        $(".scroll-navbar").removeClass("hidden");
    } else if (scroll < $(window).height()) {
        $(".navbar-hakuna-landing").removeClass("hidden");
        $(".scroll-navbar").addClass("hidden");
    }
});

$(function(){
 var pathname = (window.location.pathname);
  $('.navbar-hakuna-main a').each(function() {
    if (window.location.hash == "#about") {
      $('#navbar-about').addClass('active');
    } else if ($(this).attr('href') === pathname) {
      $(this).addClass('active');
    }
  });
});
