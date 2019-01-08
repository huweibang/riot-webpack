import route from 'riot-route'
import riot from 'riot'
import 'riot-hot-reload'
import '../semantic/dist/semantic.min.css'
import './css/index.css'
import '../semantic/dist/semantic.min.js'
import './views/home/home.tag'
import './views/home/fallback.tag'
import './views/home/count.tag'
import './views/home/invite-friend.tag'
import './views/home/shikai.tag'
import './views/home/liangkai.tag'
import './views/home/purchas.tag'
import './views/home/record.tag'
import './views/home/round.tag'
import './components/header.tag'
import './components/custom-button.tag'
import './components/null.tag'
import './components/register-modal.tag'
import './components/pendingLine.tag'
import './components/graceTopHeader.tag'
import '@babel/polyfill'
import './i18n/jquery-i18n-properties.js'
import './i18n/lang_zh.properties'
import './i18n/lang.properties'
import './i18n/lang_kr.properties'
import './i18n/lang_en.properties'
import '../node_modules/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js'
import '../node_modules/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css'
import contractsDetails from './libs/web3Helper/contractDefinition.js'
const Ethereum = require('./libs/web3Helper/contractsHelper.js')
window.Interface = require('./libs/web3Helper/contractInterface.js')
require('jquery-countdown')
if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
	Interface.UI.device = 'mobile'
}else {
	Interface.UI.device = 'others'
	$("body").mCustomScrollbar({
		autoDraggerLength:true,
		scrollInertia:600,
		autoHideScrollbar: true,
		theme:'minimal'
	})
}
var BNMix = {
	init:function(){
		this.fullUnit = 1e18
	}
}
riot.mixin('BNMix',BNMix)
// 初始化web3 合约
$(async function(){	
	await Interface.connect({
		providers: [
		{
			name: "Metamask",
			API: (typeof web3 !== "undefined" ? web3 : false)
		}, {
			name: "Browser",
			// API: "https://rinkeby.infura.io/YKZGQG2QTBx0tiWoB2IF"
			API: "https://rinkeby.infura.io/YKZGQG2QTBx0tiWoB2IF"
		}, {
			name: "Websocket",
			// API: new Web3(new Web3.providers.WebsocketProvider("wss://rinkeby.infura.io/_ws"))
			API: new Web3(new Web3.providers.WebsocketProvider("wss://rinkeby.infura.io/_ws"))
		}
		],
		contracts: [
		{
			name: contractsDetails['Register'].name,
			model: Ethereum.Register,      
			address: contractsDetails['Register'].address
		},
		{
			name: contractsDetails['TMX'].name,
			model: Ethereum.TMX,      
			address: contractsDetails['TMX'].address
		},
		{
			name: contractsDetails['Payment'].name,
			model: Ethereum.Payment,      
			address: contractsDetails['Payment'].address
		},
		{
			name: contractsDetails['LuckyStars'].name,
			model: Ethereum.LuckyStars,      
			address: contractsDetails['LuckyStars'].address
		}
		]
	})
	if(!Interface.Bridges.Metamask){
		$('.envError .content').text('No metamask or trustwallet detected!')
		$('.envError.ui.tiny.modal').modal({
			closable:false
		}).modal('show')
		return
	}
	var isNet = await Interface.checkNetwork()
	if(!isNet){
		$('.envError .content').text('You\'re not on the right network!')
		$('.envError.ui.tiny.modal').modal({
			closable:false
		}).modal('show')
		return
	}
	// 监听 web3 websocket事件
	await Interface.Bridges.Websocket.contracts.Register.listen()
	await Interface.Bridges.Websocket.contracts.TMX.listen()
	await Interface.Bridges.Websocket.contracts.Payment.listen()
	await Interface.Bridges.Websocket.contracts.LuckyStars.listen()

	
	Interface.Bridges.Websocket.contracts.Register.on('Event', async (event) => {
		console.log('ContractEvent',event)
	})
	Interface.Bridges.Websocket.contracts.TMX.on('Event', async (event) => {
		console.log('TMXEvent',event)
	})
	Interface.Bridges.Websocket.contracts.Payment.on('Event', async (event) => {
		console.log('PaymentEvent',event)
	})
	Interface.Bridges.Websocket.contracts.LuckyStars.on('Event', async (event) => {
		console.log('LSEvent',event)
	})
	//大量的游戏事件trigger
	Interface.Bridges.Websocket.contracts.LuckyStars.on('Event',function(event){
		switch(event.event){
			case 'LogAirdrop':
			Interface.UI.trigger('Airdrop')
			break;
			case 'LogTimeEndRound':
			Interface.UI.trigger('TimeEndRound')
			break;
			case 'LogQuantityAward':
			Interface.UI.trigger('QuantityAward')
			break;
			case 'LogWithdraw':
			Interface.UI.trigger('Withdraw')
			break;
		}
	})
	require('./router.js')
	
})





