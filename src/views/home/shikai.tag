// 时开
<shikai>
	<div class="ui segment">
		<h4 class="ui header"><span data-translate="shikai">시간대별 안내</span><i class="question circle outline icon"></i></h4>
		<div class="bordergroup one"></div>
		<div class="bordergroup two"></div>
		<p class="tips" data-translate="this_round_leaves">당첨자 발표 남은시간</p>
		<div class="ui grid">
			<div class="eight wide column">
				<p style="white-space: nowrap">
					<span id="countdown-shikai">6:00:00</span>
					<i class="icon stopwatch big"></i>
				</p>
				<p style="white-space: nowrap">
					<span data-translate="pool_leaves">상금풀 누적총량</span> { poolWhole.toFixed(5) } ETH
				</p>

			</div>
			<div class="eight wide column">
				<img src={ cycle } class="cycle one" />
				<img src={ cycle } class="cycle two" />
				<img src={ cycle } class="cycle three" />
			</div>
		</div>
		<div class="ui grid reward" if={ Interface.UI.language == 'en' && Interface.UI.device == 'mobile'}>
			<div class="row">
				<div class="four wide computer five wide tablet two wide mobile column" style="color:rgb(255,215,0);">
					<i class="icon trophy" style="color:rgb(255,215,0);"></i>
				</div>
				<div class="four wide computer five wide tablet two wide mobile column" style="color:rgb(255,215,0);">
					1
				</div>
				<div class="eight wide computer six wide tablet twelve wide mobile column" data-translate="roit40" style="color:rgb(255,215,0);">
					상금풀 총량의 40% 획득
				</div>
			</div>
			<div class="row">
				<div class="four wide computer five wide tablet two wide mobile column" style="color:rgb(233,233,216);">
					<i class="icon trophy" style="color:rgb(233,233,216);"></i>
				</div>
				<div class="four wide computer five wide tablet two wide mobile column" style="color:rgb(233,233,216);">
					20
				</div>
				<div class="eight wide computer six wide tablet twelve wide mobile column" data-translate="roit30" style="color:rgb(233,233,216);">
					상금풀 총량의 30%를 균등배당
				</div>
			</div>
			<div class="row">
				<div class="four wide computer five wide tablet two wide mobile column" style="color:rgb(184,115,51);">
					<i class="icon trophy" style="color:rgb(184,115,51);"></i>
				</div>
				<div class="four wide computer five wide tablet two wide mobile column" style="color:rgb(184,115,51);">
					50
				</div>
				<div class="eight wide computer six wide tablet twelve wide mobile column" data-translate="roit20" style="color:rgb(184,115,51);">
					상금풀 총량의 20%를 균등배당
				</div>
			</div>
		</div>
		<div class="ui grid reward" if={ !(Interface.UI.language == 'en' && Interface.UI.device == 'mobile')}>
			<div class="row">
				<div class="four wide computer five wide tablet three wide mobile column" data-translate="no_1">

				</div>
				<div class="four wide computer five wide tablet three wide mobile column" data-translate="one">
					1명
				</div>
				<div class="eight wide computer six wide tablet ten wide mobile column" data-translate="roit40">
					상금풀 총량의 40% 획득
				</div>
			</div>
			<div class="row">
				<div class="four wide computer five wide tablet three wide mobile column" data-translate="no_2">
					
				</div>
				<div class="four wide computer five wide tablet three wide mobile column" data-translate="twety">
					20명
				</div>
				<div class="eight wide computer six wide tablet ten wide mobile column" data-translate="roit30">
					상금풀 총량의 30%를 균등배당
				</div>
			</div>
			<div class="row">
				<div class="four wide computer five wide tablet three wide mobile column" data-translate="no_3">
					
				</div>
				<div class="four wide computer five wide tablet three wide mobile column" data-translate="fifty">
					50명
				</div>
				<div class="eight wide computer six wide tablet ten wide mobile column" data-translate="roit20">
					상금풀 총량의 20%를 균등배당
				</div>
			</div>
		</div>
		<p class="colored-tips" data-translate="roit5">당첨자 직대 소개인는 당첨금액의 5% 획득</p>
	</div>
	<div class="ui basic modal shikai">
		<div class="ui icon header" data-translate="shikai">
			시간대별 안내
		</div>
		<div class="content">
			<p data-translate="shikai_question_1">这是一个充满神奇魔力的时间沙漏。</p>
			<p data-translate="shikai_question_2">时间的尽头，不是荒凉的末日，而是财富和宝藏！</p>
			<p data-translate="shikai_question_3">时间之沙从6小时开始流失归零，每当玩家购买一把幸运钥匙Key，倒计时自动延长60秒，上限为6小时。</p>
			<p data-translate="shikai_question_4">当倒计时归零之时，最后71个购买幸运钥匙的玩家获得赐福，瓜分宝藏！</p>
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
		//属性
		_this.cycle = require('../../imgs/cycle.png')
		_this.poolWhole = BN(0)
		//事件
		Interface.UI.on('currentRoundInfo',function(currentRoundInfo){
			_this.poolWhole = currentRoundInfo.poolWhole.dividedBy(1e18)
		})
		
		//生命周期
		this.on('mount',function(){
			$('span#countdown-shikai').countdown(new Date().setHours(new Date().getHours()+6),function(e){
				$(this).html(e.strftime('%H:%M:%S'));
			}).countdown('stop')
			$('shikai .question.circle.outline.icon').click(function(){
				$('.shikai.ui.basic.modal').modal('show')
			})
		})
	</script>
	<style>
	shikai {
		white-space: nowrap;
	}
	h4.ui.header {
		font-size: 1.35rem;
		font-weight: normal;
		color: #508ff6;
		line-height: 1;
		margin-bottom: 1.5rem;
	}
	.ui.segment {
		color: #caccf7;
	}
	.ui.grid.reward {
		margin: 1rem -1rem;
	}
	
	.cycle {
		transform-origin: 50%,50%;
		animation: 1s linear rotateCycle infinite;
		height: 2.25em;
		margin: 0 .5rem;
	}
	.cycle.one {

	}
	.cycle.two {
		animation-delay: -.25s;
	}
	.cycle.three {
		animation-delay: -.75s;
	}
	.colored-tips {
		color: #508ff6;
	}
	.icon.stopwatch,.icon.ethereum {
		color: #fff;
	}
	[data-animeOrder] {
		color: #508ff6;
	}
	.bordergroup {
		width: 100%;
		height: 2px;
		position: absolute;
		left: 0;
		top: 2.8571rem;
	}
	.bordergroup.one {
		background-color: #1f1e3a;
		top: calc(2.8571rem - 2px);
	}
	.bordergroup.two {
		background-color: #282747;
	}
	@keyframes rotateCycle {
		from {
			transform: rotate(0deg);
		}
		to {
			transform: rotate(360deg)
		}
	}
</style>
</shikai>