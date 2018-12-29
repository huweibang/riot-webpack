const route = require('riot-route')
route.default('/..',function(){
	riot.mount('module-header','header')
	riot.mount('module-main','home')
	// riot.mount('module-loading')
	
	// Interface.Cache.fiatRatios = await jQuery.get("https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=BTC,USD,EUR")
	$('.fullscreen-loader').fadeOut(function(){
		Interface.UI.trigger('Home.Init.step1')
	})
})

route.default.base('/')
route.default.start(true)