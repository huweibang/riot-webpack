var anime = require('animejs')
var firstDrop = {
	roit:'0%'
}
var secondDrop = {
	roit:'0%'
}
var thirdDrop = {
	roit:'0%'
}
module.exports = function(){
	anime.timeline().add({
		targets:firstDrop,
		roit:'40%',
		round:1,
		easing:'easeInOutQuad',
		update: function() {
			
			$('[data-animeOrder=firstDrop]').text(firstDrop.roit)
		}
	}).add({
		targets:secondDrop,
		roit:'30%',
		round:1,
		easing:'easeInOutQuad',
		update: function() {
			$('[data-animeOrder=secondDrop]').text(secondDrop.roit)
		}
	})
	.add({
		targets:thirdDrop,
		roit:'20%',
		round:1,
		easing:'easeInOutQuad',
		update: function() {
			$('[data-animeOrder=thirdDrop]').text(thirdDrop.roit)
		}
	})
}