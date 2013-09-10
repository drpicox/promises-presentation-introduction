(function(window,$,ga) {
    

    var path = window.location.pathname;
    
    $(".step").on("impress:stepenter", function (ev) {
	ga('send', 'pageview', path + "/" + $(this).attr('id'));
    });
    
})(window,jQuery,ga);
