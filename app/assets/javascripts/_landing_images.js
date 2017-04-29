$(window).scroll(function() {    
    var scroll = $(window).scrollTop();

    if (scroll > $(window).height() * 0.60) {
        $(".landing-images").removeClass("hidden");
    } else if (scroll < $(window).height()) {
    }
});

