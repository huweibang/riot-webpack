const route = require('riot-route')
route.default('/..',function(){
	riot.mount('module-header','header')
	riot.mount('module-main','home')
	$('.fullscreen-loader').fadeOut(function(){
		Interface.UI.trigger('Home.Init.step1')
	})
})

route.default.base('/')
route.default.start(true)