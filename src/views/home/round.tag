//轮次子页面

<round>
	<h2 class="ui header"><span>{ currentRoundEx() }</span><i class="question circle outline icon"></i></h2>
	<div class="bordergroup one"></div>
	<div class="bordergroup two"></div>
	<h1 class="ui header" data-translate="countdown_leaves">剩余倒计时</h1>
	<div id="countdown">
		6:00:00
	</div>
	<div class="ui grid fundcount stackable">
		<div class="eight wide computer eight wide tablet six wide mobile column left aligned" data-translate="pool_rounds_amount">奖池当前总量</div>
		<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">
			<p style="white-space: nowrap;margin-bottom: 0;">
				<span class="reward">{ poolWhole.toFixed(5) }</span>
				<i class="icon ethereum large"></i>
			</p>
			<p class="sub">
				≈ { (poolWhole.multipliedBy(USDRoit)).toFixed(2) } USDT
			</p>
		</div>
	</div>
	<div class="ui basic modal round">
		<div class="ui icon header" data-translate="current_round">
			轮次
		</div>
		<div class="content">
			<p data-translate="round_question_1"></p>
			<p data-translate="round_question_2"></p>
		</div>
		<div class="actions">
			<div class="ui green ok inverted button">
				<i class="checkmark icon"></i>
				<span data-translate="ok"></span>
			</div>
		</div>
	</div>
	<script>
		var _this = this
		var BN = require('bignumber.js')
		var Promise = require('bluebird')
		_this.mixin('BNMix')
	// 属性
	_this.currentRound = 1
	_this.poolWhole = BN(0)
	_this.USDRoit = 0
	$.get('https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD',function(data){
		_this.USDRoit = data.USD
	})
	// 事件
	Interface.UI.on('currentRoundInfo',function(currentRoundInfo){
		_this.poolWhole = currentRoundInfo.poolWhole.dividedBy(1e18)
		_this.currentRound = currentRoundInfo.rID.toNumber()
	})
	// 方法
	_this.currentRoundEx = function(){
		return $.i18n.map['round']?$.i18n.map['round'].replace('{0}',_this.currentRound):"제"+ _this.currentRound +"회"
	}
	_this.updateCountdown = function(){
		Interface.Bridges.Metamask.contracts.LuckyStars.read('getTimeLeft').then(function(data){
			$('div#countdown,span#countdown-shikai,.countdown-small').countdown(new Date().setSeconds(new Date().getSeconds()+data.toNumber())).countdown('start')
		},function(err){
			Interface.UI.trigger('GraceWarning',err)
		})
	}
	// 生命周期
	this.on('mount',function(){

		$('round .question.circle.outline.icon').click(function(){
			$('.round.ui.basic.modal').modal('show')
		})
		$('div#countdown,span#countdown-shikai,.countdown-small').countdown(new Date().setHours(new Date().getHours() + 6),function(e){
			$(this).html(e.strftime('%H:%M:%S'));
		}).countdown('stop')
		_this.updateCountdown()
		setInterval(_this.updateCountdown,30000)
		Interface.Bridges.Metamask.contracts.LuckyStars.read('rID_').then(function(data){
			_this.currentRound = data.toNumber()
			_this.update()
		},function(err){
			Interface.UI.trigger('GraceWarning',err)
		})
	})
</script>
<style>
h1.ui.header {
	text-align: center;
	color: white;
	font-weight: 400;
	font-size: 1.5rem;
}
#countdown {
	font-size: 3rem;
	text-align: center;
	line-height: 1.5;
	height: 3rem;
	margin-bottom: 4.6rem;
}
.fundcount.ui.grid {
	background: #1d1c3a;
	padding-top: 1rem;
	padding-bottom: 1rem;
	margin: 0;
	font-size: 1.5rem;
	line-height: 2em;
	white-space:nowrap;
}
.fundcount .column:last-child{
	text-align: right;
}
.fundcount .reward {
	font-size: 2rem;
	vertical-align: middle;
}
.sub {
	font-size: 1rem;
}
.icon.ethereum.large {
	width: auto;
	font-size: 1.5rem;
}
.left.aligned {
	line-height: 2.4285em;
	font-size: 1.5rem;
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
</style>
</round>