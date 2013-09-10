    (function(){
    var hostname = window.location.hostname.toLowerCase();
    if (hostname == "localhost" || hostname.slice(0,3) == "192") {
    var port = 19002;//35729;
    var livereload = document.createElement("SCRIPT");
    livereload.setAttribute('src', 
    'http://'+window.location.hostname+':'+port+'/livereload.js');
    document.getElementsByTagName("BODY")[0].appendChild(livereload);
    }})();
