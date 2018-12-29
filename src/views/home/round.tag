//轮次子页面

<round>
	<h2 class="ui header"><span>{ currentRoundEx() }</span><!-- <i class="question circle outline icon"></i> --></h2>
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
				<span class="reward">0.00000</span>
				<i class="icon ethereum large"></i>
			</p>
			<p class="sub">
				≈ 0 USDT
			</p>
		</div>
	</div>
	<script>
		var _this = this
	// 属性
	_this.currentRound = 1
	

	// 事件

	// 方法
	_this.currentRoundEx = function(){
		return $.i18n.map['round']?$.i18n.map['round'].replace('{0}',_this.currentRound):''
	}

	// 生命周期
	this.on('mount',function(){
		// $('div#countdown').countdown(new Date().setHours(new Date().getHours()+6),function(e){
		// 	$(this).html(e.strftime('%H:%M:%S'));
		// })
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