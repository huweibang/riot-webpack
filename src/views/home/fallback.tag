//收益子页面

<fallback>
	<h2 class="ui header"><span data-translate="income">资产收益</span><i class="question circle outline icon"></i></h2>
	<div class="bordergroup one"></div>
	<div class="bordergroup two"></div>
	<div class="content-wrapper">
		<div class="ui grid">
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="amount">已投入的资金</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">{ ethDeployed.toFixed(5) } ETH</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="my_keys">我的钥匙</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">{ keysBuyed.toFixed(0) } Keys</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="keys_destoryed"></div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">{ burnAmount.toFixed(5) } TMX</div>
		</div>
		<div class="ui divider"></div>
		<div class="ui grid">
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="benfit_dividend">分红收益</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">{ dividend.toFixed(5) } ETH</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="benfit_prompt">推荐奖励</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">{ invite_feedback.toFixed(5) } ETH</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="out_3_leaves">离3倍出局还差</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">{ escapeFromThree.toFixed(5) } ETH</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="benfit_pool">赢取的奖池收益</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">{ fallback.toFixed(5) } ETH</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="benfit_whole">总收益</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">{ (withdrawed.plus(ethsCanWithdraw)).toFixed(5) } ETH</div>
		</div>
		<div class="ui divider"></div>
		<div class="ui grid">
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="coin_withdraw">已提币数量</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">{ withdrawed.toFixed(5) } ETH</div> 
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="coin_non_withdraw">未提币数量</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">{ ethsCanWithdraw.toFixed(5) } ETH</div> 
		</div>
		<div class="ui grid">
			<div class="sixteen wide column">
				<button class={ ui:true,button:true,fluid:true,'btn-send':true,loading:withdrawing,graceButton:true } onclick={ withdraw } data-translate="eth_withdraw">提取ETH</button>
			</div>
		</div>
	</div>
	<div class="ui basic modal fallback">
		<div class="ui icon header" data-translate="income">
			我的收益
		</div>
		<div class="content">
			<p data-translate="fallback_question_1"></p>
			<p data-translate="fallback_question_2"></p>
			<p data-translate="fallback_question_3"></p>
			<p data-translate="fallback_question_4"></p>
			<p data-translate="fallback_question_5"></p>
			<p data-translate="fallback_question_6"></p>
		</div>
		<div class="actions">
			<div class="ui green ok inverted button">
				<i class="checkmark icon"></i>
				<span data-translate="ok"></span>
			</div>
		</div>
	</div>
	<style>
	fallback {
		font-size: 1.15rem;
		line-height: 1.5em;
	}
	.content-wrapper .right.aligned{
		text-shadow: 0 0 5px #02E5D1, 0 0 20px #4391FD, 0 0 10px #4391FD;
	}
	.ui.grid {
		white-space:nowrap;
	}
	.bordergroup {
		width: 100%;
		height: 2px;
		position: absolute;
		left: 0;
		top: 4.28576rem;
	}
	.bordergroup.one {
		background-color: #1f1e3a;
		top: calc(4.28576rem - 2px);
	}
	.bordergroup.two {
		background-color: #282747;
	}
	.btn-send.ui.button {
		margin-top: 2rem;

	}
</style>
<script>
	var _this = this
	var BN = require('bignumber.js')
	var Promise = require('bluebird')
	_this.mixin('BNMix')
	//属性
	_this.withdrawing = false
	_this.playerInfoTimeId = 0
	_this.countId = 0
	_this.burnAmount = BN(0)
	_this.keysBuyed = BN(0)
	_this.ethDeployed = BN(0)
	_this.dividend = BN(0)
	_this.fallback = BN(0)
	_this.persionBank = BN(0)
	_this.invite_feedback = BN(0)
	_this.withdrawed = BN(0)
	_this.escapeFromThree = BN(0)
	_this.ethsCanWithdraw = BN(0)

	//方法
	_this.withdraw = function(){
		if(_this.withdrawing){
			$('.ui.modal.tiny.Public .header').text($.i18n.map.welcome)
			$('.ui.modal.tiny.Public .content p').text($.i18n.map.process_purchasing)
			$('.ui.modal.tiny.Public').modal('show')
			return
		}
		if(Interface.Cache.isRegistered){
			_this.withdrawing = true
			Interface.Bridges.Metamask.contracts.LuckyStars.write('withdraw').then(function(){
				_this.withdrawing = false
			},function(){
				_this.withdrawing = false
			})
		}else {
			$('.ui.modal.tiny.Public .header').text($.i18n.map.welcome)
			$('.ui.modal.tiny.Public .content p').text($.i18n.map.please_register)
			$('.ui.modal.tiny.Public').modal('show')
		}
	}
	_this.getBurnAmount = function(){
		return Interface.Bridges.Metamask.contracts.Payment.read('getBurnAmount',[Interface.Bridges.Metamask._lastWallet]).then(function(data){
			_this.burnAmount = BN(data).dividedBy(_this.fullUnit)
		},function(err){
			Interface.UI.trigger('GraceWarning',$.i18n.map.networkCash)
		})
	}
	_this.getPlayerInfoByAddress = function(){

		return Promise.all([Interface.Bridges.Metamask.contracts.LuckyStars.read('getPlayerInfoByAddress',[Interface.Bridges.Metamask._lastWallet]),Interface.Bridges.Metamask.contracts.LuckyStars.read('getWinVaults',[Interface.Bridges.Metamask._lastWallet])]) .then(function(data){
			return Promise.resolve({
				keysBuyed:BN(data[0][0]),
				ethDeployed:BN(data[0][1]),
				dividend:BN(data[0][2]),
				persionBank:BN(data[0][3]),
				invite_feedback:BN(data[0][4]),
				withdrawed:BN(data[0][5]),
				fallback:BN(data[1])
			})
		},function(err){
			return Promise.reject(err)
		})
	}
	_this.initPlayerInfo = function(){
		_this.getPlayerInfoByAddress().then(function(playerInfo){
			Interface.UI.trigger('currentPlayerInfo',playerInfo)
		},function(err){
			Interface.UI.trigger('GraceWarning',$.i18n.map.networkCash)
		})
		clearInterval(_this.playerInfoTimeId)
		_this.playerInfoTimeId = setInterval(function(){
			_this.countId++
			var currentCountId = _this.countId
			_this.getPlayerInfoByAddress().then(function(playerInfo){
				if(_this.countId == currentCountId ){
					Interface.UI.trigger('currentPlayerInfo',playerInfo)
				}
				
			},function(err){
				if(_this.countId == currentCountId ){
					Interface.UI.trigger('GraceWarning',$.i18n.map.networkCash)
				}		
			})
		},1000)
	}
	//事件
	
	Interface.UI.on('currentPlayerInfo',function(playerInfo){
		_this.keysBuyed = playerInfo.keysBuyed.dividedBy(1e18)
		_this.ethDeployed = playerInfo.ethDeployed.dividedBy(1e18)
		_this.dividend = playerInfo.dividend.dividedBy(1e18)
		_this.persionBank = playerInfo.persionBank.dividedBy(1e18)
		_this.fallback = playerInfo.fallback.dividedBy(1e18)
		_this.invite_feedback = playerInfo.invite_feedback.dividedBy(1e18)
		_this.withdrawed = playerInfo.withdrawed.dividedBy(1e18)
		_this.escapeFromThree = (_this.ethDeployed.multipliedBy(3).minus(_this.invite_feedback.plus(_this.dividend)))
		if(!_this.escapeFromThree.isGreaterThan(BN(0)) && _this.keysBuyed.isGreaterThan(BN(0))){
			_this.dividend = BN(0)
			_this.invite_feedback = BN(0)
			_this.escapeFromThre = BN(0)
			_this.ethsCanWithdraw = BN(3).plus(_this.fallback).plus(_this.persionBank)
		}else if(_this.keysBuyed.isEqualTo(BN(0))){
			_this.escapeFromThree = BN(0)
			_this.ethsCanWithdraw = _this.dividend.plus(_this.invite_feedback).plus(_this.fallback).plus(_this.persionBank)
		}else {
			_this.ethsCanWithdraw = _this.dividend.plus(_this.invite_feedback).plus(_this.fallback).plus(_this.persionBank)
		}
	})
	Interface.Bridges.Websocket.contracts.TMX.on('Event',function(event){
		if(event.event == 'Transfer' && (event.returnValues.from.toLowerCase() == Interface.Bridges.Metamask._lastWallet.toLowerCase())){
			// 暂时性处理
			_this.getBurnAmount()		
		}
	})
	Interface.Bridges.Metamask.on('account.signedIn',function(){
		_this.getBurnAmount()
		_this.initPlayerInfo()

	})

	this.on('mount',function(){
		$('fallback .question.circle.outline.icon').click(function(){
			$('.fallback.ui.basic.modal').modal('show')
		})
		if(Interface.Bridges.Metamask.signedIn){
			_this.getBurnAmount()
			_this.initPlayerInfo()
		}
	})
</script>
</fallback>