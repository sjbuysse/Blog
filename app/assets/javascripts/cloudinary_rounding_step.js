function add_rounding_step(step){
    $('img').each(function() {
       var $image = $(this);
       var imgUrl = $image.attr('data-src');
       var width_rounding = "w_auto:" + step;
       newUrl = imgUrl.replace("w_auto", width_rounding);
      $image.attr('data-src', newUrl);
    });
}
