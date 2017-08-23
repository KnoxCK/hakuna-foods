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
  if ( window.location.hash === "#about") {
    $('.navbar-hakuna-main a').each(function() {
      $(this).removeClass('active');
    });
    $('#navbar-about').addClass('active');
  } else {
    $('.navbar-hakuna-main a').each(function() {
      if ($(this).attr('href') === pathname) {
        $(this).addClass('active');
      }
    });
  }
});

$(function(){
  $('#navbar-about').click(function(e){
    $('.navbar-hakuna-main a').each(function() {
      $(this).removeClass('active');
    });
    $(this).addClass('active');
  });
});


