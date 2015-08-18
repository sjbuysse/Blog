$(document).ready(function(){
    $(".insert-snippet").on("click", function(e) {
        e.preventDefault();
        //var urls = [];
        //$(".gallery-thumbs > * > img").each(function(index){
            //urls[index] = $(this).prop("src");
        //});
        $("textarea[name='post[body]']").val($("textarea[name='post[body]']").val() + createLiquidSnippet());
    });
});
function createLiquidSnippet(){ 
    snippet = "<div class='banner'>" +
    "<a href='#' class='unslider-arrow prev icon-chevron-with-circle-left'></a>" +
    "<a href='#' class='unslider-arrow next icon-chevron-with-circle-right'></a>" +
    "<ul>" + 
    "{% for picture in pictures %}" +
        "<li style=\"background-image:url({{picture.image_url}});\"></li>" + 
    "{% endfor %}" +
    "</ul></div>"; 
    return snippet;
}

//function createJavascriptSnippet(urls){ 
    //snippet = "<div class='banner'>" +
    //"<a href='#' class='unslider-arrow prev icon-chevron-with-circle-left'></a>" +
    //"<a href='#' class='unslider-arrow next icon-chevron-with-circle-right'></a>" +
    //"<ul>"; 
    //for( var url in urls ){
    //snippet += "<li style=\"background-image:url(" + urls[url] + ");\"></li> ";
    //}
    //snippet += "</ul></div>"; 
    //return snippet;
//}
