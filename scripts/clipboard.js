$(document).ready(function(){

    $('a#copy').zclip({
        path:'ZeroClipboard.swf',
        copy:$('pre#repo').text()
    });
});
