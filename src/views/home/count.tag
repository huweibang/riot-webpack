//统计子页面

<count>
	<div class="ui grid">
		<div class="eight wide computer eight wide tablet six wide mobile column left aligned" data-translate="round_benfit_whole">
			이번 누적수익
		</div>
		<div class="eight wide computer eight wide tablet ten wide mobile column right aligned gracefulText">
			0.00000 ETH
		</div>
		<div class="eight wide computer eight wide tablet six wide mobile column left aligned" data-translate="pool_rounds_amount">
			상금풀 누적총량
		</div>
		<div class="eight wide computer eight wide tablet ten wide mobile column right aligned gracefulText">
			0.00000 ETH
		</div>
		<div class="eight wide computer eight wide tablet six wide mobile column left aligned" data-translate="pool_current_amount">
			상금풀 현재총량
		</div>
		<div class="eight wide computer eight wide tablet ten wide mobile column right aligned gracefulText">
			{ poolWhole.toFixed(5) } ETH
		</div>
		<div class="eight wide computer eight wide tablet six wide mobile column left aligned" data-translate="benfit_dividend_whole">
			배당총량
		</div>
		<div class="eight wide computer eight wide tablet ten wide mobile column right aligned gracefulText">
			0.00000 ETH
		</div>
		<div class="eight wide computer eight wide tablet six wide mobile column left aligned" data-translate="keys_destoryed">
			소멸된 입장권
		</div>
		<div class="eight wide computer eight wide tablet ten wide mobile column right aligned gracefulText">
			{ burnAmount.toFixed(5) } TMX
		</div>
		<div class="eight wide computer eight wide tablet six wide mobile column left aligned" data-translate="keys_amount">
			key 총량
		</div>
		<div class="eight wide computer eight wide tablet ten wide mobile column right aligned gracefulText">
			{ keysAmount.toFixed(0) } Key
		</div>
		<div class="eight wide computer eight wide tablet six wide mobile column left aligned" data-translate="times_amount">
			누적시간
		</div>
		<div class="eight wide computer eight wide tablet ten wide mobile column right aligned gracefulText">
			{ timeAmount() }
		</div>
	</div>
	<script>
		var _this = this
		var BN = require('bignumber.js')
		_this.mixin('BNMix')
		var Promise = require('bluebird')
	// 属性
	_this.poolWhole = BN(0)
	_this.keysAmount = BN(0)
	_this.burnAmount = BN(0)

	// 事件
	Interface.UI.on('currentRoundInfo',function(currentRoundInfo){
		_this.poolWhole = currentRoundInfo.poolWhole.dividedBy(1e18)
		_this.keysAmount = currentRoundInfo.keysAmount.dividedBy(1e18)
	})
	Interface.Bridges.Metamask.on('account.signedIn',function(){
		_this.initCount()
	})
	Interface.Bridges.Websocket.contracts.TMX.on('Event',function(event){
		var isMe = (event.returnValues.from.toLowerCase() == Interface.Bridges.Metamask._lastWallet.toLowerCase())
		if(event.event == 'Transfer' && isMe){
			// 暂时性处理
			_this.initCount()
			
		}
	})
	// 方法
	_this.getBurnAmount = function(){
		return Interface.Bridges.Metamask.contracts.Payment.read('getBurnAmount',[Interface.Bridges.Metamask._lastWallet])
	}
	_this.initCount = function(){
		Promise.all([_this.getBurnAmount()]).then(function(dataArray){
			_this.burnAmount = BN(dataArray[0]).dividedBy(_this.fullUnit)
		},function(err){
			Interface.UI.trigger('GraceWarning',err)
		})
	}
	_this.timeAmount = function(){
		var staticAmount = 6*60*60
		var timeAmount = staticAmount + _this.keysAmount.toNumber()*60
		if(timeAmount <= 43200){
			return Math.floor(timeAmount/3600) + $.i18n.map.hour + Math.floor((timeAmount%3600)/60) + $.i18n.map.minute
		}else {
			return "12" + $.i18n.map.hour
		}
		
	}

	// 生命周期
	this.on('mount',function(){
		if(Interface.Bridges.Metamask.signedIn){
			_this.initCount()
		}
	})
</script>
<style>
.ui.grid {
	margin: 2rem 0;
	padding: 1rem 0;
	background: #1d1c3a;
	font-size: 1.15rem;
	white-space:nowrap;
	line-height: 1.5;
}
.ui.grid .right.floated {
	text-align: right;

}
.ui.grid p {
	margin: 0;
}
.ui.grid p:first-child {
	font-size: 2rem;
}
.ui.grid p:last-child {
	font-size: 1rem;
}
.left.aligned,.right.aligned {
	line-height: 2.4285em;
}
</style>
</count>