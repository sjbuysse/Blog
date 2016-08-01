function objectfill(){
    if('objectFit' in document.documentElement.style === false) {
      $('.post-image-container').each(function () {
        var $container = $(this),
            imgUrl = $container.find('img').prop('src');
        if (imgUrl) {
          $container
            .css('backgroundImage', 'url(' + imgUrl + ')')
            .addClass('compat-object-fit');
        }  
      });
    }
}
