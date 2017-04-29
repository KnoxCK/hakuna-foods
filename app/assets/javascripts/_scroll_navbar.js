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

