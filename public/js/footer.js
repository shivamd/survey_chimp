$(document).ready(function() {
	$('footer img:not(.monkey)').on('mouseover', function() {
		$('img.monkey').hide('slow');
		image = $(this).attr('class');
		$('footer div.'+image).show('slow');
	}).on('mouseleave', function() {
		$('img.monkey').show('slow');
		$('footer div.'+image).hide('slow');
	});
});