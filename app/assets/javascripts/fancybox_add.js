$(document).ready(function() {
  $("a.fancybox").fancybox({
    maxWidth: 900,
    helpers : {
        overlay : {
            css : {
                'background' : 'rgba(0, 0, 0, 0.8)'
            }
        },
    }
  });
  $("#close-this").click(function(){
    $.fancybox.close()
    });
});
