/*
Main script functions for Pepinot 86 website.
Depends on jQuery library.
*/

function addLikeButtons()
{
	var fbLike = '<div class="fb-like" data-href="http://stpettersens.github.com/Pepinot-86/"'
	+ 'data-send="false" data-width="450" data-show-faces="false" data-font="verdana"></div>';
	var gPlusOneLike = '<g:plusone></g:plusone>';
	$('div#like').append(gPlusOneLike + fbLike);
}
addLikeButtons();
