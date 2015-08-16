$(document).ready(function(){
    $(".insert-snippet").on("click", function(e) {
        e.preventDefault();
        $("textarea").val($("textarea").val() + createSnippet());
    });
});

function createSnippet(){ 
    snippet = "<div class='banner'>" +
    "<a href='#' class='unslider-arrow prev icon-chevron-with-circle-left'></a>" +
    "<a href='#' class='unslider-arrow next icon-chevron-with-circle-right'></a>" +
    "<ul>" + 
    //pictures is een variabele die je meegeeft aan de liquid render (product.pictures)
    "{% for picture in pictures %}" +
    "<li style=\"background-image:'{{picture.url(:medium)}}';\"></li> " +
    "{% endfor %}" +
    "</ul></div>"; 
    return snippet;
}

