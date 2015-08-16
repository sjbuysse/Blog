$(document).ready(function(){
    $(".insert-snippet").on("click", function(e) {
        e.preventDefault();
        var urls = [];
        $(".gallery-thumbs").children("img").each(function(index){
            urls[index] = $(this).prop("src");
        });
        $("textarea").val($("textarea").val() + createSnippet(urls));
    });
});

function createSnippet(urls){ 
    snippet = "<div class='banner'>" +
    "<a href='#' class='unslider-arrow prev icon-chevron-with-circle-left'></a>" +
    "<a href='#' class='unslider-arrow next icon-chevron-with-circle-right'></a>" +
    "<ul>"; 
    for( var url in urls ){
    snippet += "<li style=\"background-image:url(" + urls[url] + ");\"></li> ";
    }
    snippet += "</ul></div>"; 
    return snippet;
}
