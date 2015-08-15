$(document).ready(function(){
    $(".insert-snippet").on("click", function(e) {
        e.preventDefault();
        images[] = $(".gallery-thumbs").children("img").map();
        var urls = 
        console.log(urls);
        $("textarea").val($("textarea").val() + createSnippet("hero1.jpg", "hero2.jpg"));
    });
});

function createSnippet(){ 
    snippet = "<div class='banner'>" +
    "<a href='#' class='unslider-arrow prev icon-chevron-with-circle-left'></a>" +
    "<a href='#' class='unslider-arrow next icon-chevron-with-circle-right'></a>" +
    "<ul>"; 
    for( var image in arguments ){
    snippet += "<li style=\"background-image:'" + arguments[image] + "';\"></li> ";
    }
    snippet += "</ul></div>"; 
    return snippet;
}
