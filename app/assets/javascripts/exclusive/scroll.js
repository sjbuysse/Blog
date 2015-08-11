$(document).ready(function(){
    var navbarHeight = $(".navbar").css("height");
    navbarHeight = navbarHeight.replace("px","");
    $('a[href*="#"]').on('click', function(event) {
        var target = $(this).attr('href').replace("index.html", "");
        var $target = $(target);
        console.log($target.length)
        if( $target.length ) {
            event.preventDefault();
            var difference = ($target.offset().top  - navbarHeight);
            if (target == "#top") {
                difference = 0;
            }
            console.log(difference);
            $('html, body').animate({
                //offset().top returns the offset of the element that calls it relative to the top.
                //we call the scrollTop on the html and body element (use both elements for browser support)
                //scrollTop will set the vertical position of the scrollbar of the element that calls scrollTop 
                //(this element is here html and body) to the numerical value it receives as an argument
                //This argument is here the offset of the element compared to the top (of html and body)
                scrollTop: difference 
            }, 1000);
        }
    });
});

