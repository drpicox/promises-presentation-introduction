(function($) {
    $(".diagram:not(.hand)").sequenceDiagram({theme: 'simple'});
    $(".diagram.hand").sequenceDiagram({theme: 'hand'});
})(jQuery);
