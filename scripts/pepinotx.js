/*
Main script functions for Pepinot 86 website.
Depends on jQuery library.
*/

// Make extern links open in new tab/window.
function makeExternLinks()
{
	$('a.extern').attr('target', '_blank');
}

// Add Like buttons to the bottom of the page.
function addLikeButtons()
{
	var fbLike = '<div class="fb-like" data-href="http://stpettersens.github.com/Pepinot-86/"'
	+ 'data-send="false" data-width="450" data-show-faces="false" data-font="verdana"></div>';
	var gPlusOneLike = '<g:plusone></g:plusone>';
	$('div#like').append(gPlusOneLike + fbLike);
	/* Facebook Like button for some reason does not work in Chrome,
	adjust so that Google +1 button is further to the left if in Chrome. 
	Neither button works in Opera. They will just not display. */
	if($.browser.webkit) $('div#like').css('margin-left', '5em');
}
makeExternLinks();
addLikeButtons();
