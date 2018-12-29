//收益子页面

<fallback>
	<h2 class="ui header"><span data-translate="income">资产收益</span><!-- <i class="question circle outline icon"></i> --></h2>
	<div class="bordergroup one"></div>
	<div class="bordergroup two"></div>
	<div class="content-wrapper">
		<div class="ui grid">
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="amount">已投入的资金</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">0.00000 ETH</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="my_keys">我的钥匙</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">0 Keys</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="keys_destoryed">博取的奖池收益</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">0 TMX</div>
		</div>
		<div class="ui divider"></div>
		<div class="ui grid">
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="benfit_dividend">分红收益</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">0.00000 ETH</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="benfit_prompt">推荐奖励</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">0.00000 ETH</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="out_3_leaves">离3倍出局还差</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">0.00000 ETH</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="benfit_pool">赢取的奖池收益</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">0.00000 ETH</div>
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="benfit_whole">总收益</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">0.00000 ETH</div>
		</div>
		<div class="ui divider"></div>
		<div class="ui grid">
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="coin_withdraw">已提币数量</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">0.00000 ETH</div> 
			<div class="eight wide computer eight wide tablet six wide mobile column" data-translate="coin_non_withdraw">未提币数量</div>
			<div class="eight wide computer eight wide tablet ten wide mobile column right aligned">0.00000 ETH</div> 
		</div>
		<div class="ui grid">
			<div class="sixteen wide column">
				<custom-button onclick={ notTheTime } class="btn-send" animated={true}><span data-translate="eth_withdraw">提取ETH</span></custom-button>
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
	.btn-send {
		margin-top: 2rem;
	}
</style>
<script>
	var _this = this
	_this.notTheTime = function(){
		$('.notTheTime.modal').modal('show')
	}
	this.on('mount',function(){
		
	})
</script>
</fallback>