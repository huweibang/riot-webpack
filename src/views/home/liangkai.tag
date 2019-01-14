// 量开
<liangkai>
	<div class="ui segment">
		<i class="ui icon cubes massive backicon"></i>
		<h4 class="ui header"><span data-translate="liangkai">에너지 단계</span><i class="question circle outline icon"></i></h4>
		<div class="bordergroup one"></div>
		<div class="bordergroup two"></div>
		<p class="tips" data-translate="pool_whole">상금풀 현재총량</p>
		<div class="ui grid content">
			<div class="eight wide column">
				<p style="white-space: nowrap">
					<span class="reward-pool">{ poolWhole.toFixed(5) }</span>
					<i class="icon ethereum big"></i>
				</p>
				<p style="white-space: nowrap">
					<span data-translate="next_count_leaves">다음발표 남은시간</span> { instanceBeforeNext.toFixed(5) } ETH
				</p>
			</div>
			<div class="eight wide column">
				<pending-line order="0" no="one"/>
				<pending-line order="1" no="two"/>
				<pending-line order="2" no="three"/>
				<pending-line order="3" no="four"/>
			</div>
		</div>
		<div class="ui grid reward" if={ !(Interface.UI.language == 'en' && Interface.UI.device == 'mobile')}>
			<div class="four wide computer five wide tablet three wide mobile column" data-translate="no_1">
				1등
			</div>
			<div class="four wide computer five wide tablet three wide mobile column" data-translate="one">
				1명
			</div>
			<div class="eight wide computer six wide tablet ten wide mobile column" data-translate="roit20W">
				상금 총액의 20% 획득
			</div>
			<div class="four wide computer five wide tablet three wide mobile column" data-translate="no_2">
				2등
			</div>
			<div class="four wide computer five wide tablet three wide mobile column" data-translate="twety">
				20명
			</div>
			<div class="eight wide computer six wide tablet ten wide mobile column" data-translate="roit30W">
				상금 총액의 30% 균등배당
			</div>
			<div class="four wide computer five wide tablet three wide mobile column" data-translate="no_3">
				3등
			</div>
			<div class="four wide computer five wide tablet three wide mobile column" data-translate="fifty">
				50명
			</div>
			<div class="eight wide computer six wide tablet ten wide mobile column" data-translate="roit50W">
				상금 총액의 50% 균등배당
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
				<div class="eight wide computer six wide tablet twelve wide mobile column" data-translate="roit20W" style="color:rgb(255,215,0);">

				</div>
			</div>
			<div class="row">
				<div class="four wide computer five wide tablet two wide mobile column" style="color:rgb(233,233,216);">
					<i class="icon trophy" style="color:rgb(233,233,216);"></i>
				</div>
				<div class="four wide computer five wide tablet two wide mobile column" style="color:rgb(233,233,216);">
					20
				</div>
				<div class="eight wide computer six wide tablet twelve wide mobile column" data-translate="roit30W" style="color:rgb(233,233,216);">
					
				</div>
			</div>
			<div class="row">
				<div class="four wide computer five wide tablet two wide mobile column" style="color:rgb(184,115,51);">
					<i class="icon trophy" style="color:rgb(184,115,51);"></i>
				</div>
				<div class="four wide computer five wide tablet two wide mobile column" style="color:rgb(184,115,51);">
					50
				</div>
				<div class="eight wide computer six wide tablet twelve wide mobile column" data-translate="roit50W" style="color:rgb(184,115,51);">
					
				</div>
			</div>
		</div>
		<p class="colored-tips" data-translate="roit5">당첨자 직대 소개인는 당첨금액의 5% 획득</p>
	</div>
	<div class="ui basic modal liangkai">
		<div class="ui icon header" data-translate="liangkai">
			能量阶梯
		</div>
		<div class="content">
			<p data-translate="liangkai_question_1">能量宝库持续吸收幸运钥匙Key的神奇能量。</p>
			<p data-translate="liangkai_question_2">当宝库中积累的能量达到设定的阶梯阈值时，将释放出丰厚的财富，反哺奖励给最后71个购买幸运钥匙的玩家。</p>
			<p data-translate="liangkai_question_3">八个开奖阶梯为：500ETH、1000ETH、2000ETH、3000ETH、5000ETH、10000ETH、20000ETH、30000ETH。</p>
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
	_this.poolWhole = BN(0)
	console.log(BN(0))
	_this.stageInfo = [500000000000000000000,1000000000000000000000,2000000000000000000000,3000000000000000000000,5000000000000000000000,10000000000000000000000,20000000000000000000000,30000000000000000000000]
	_this.instanceBeforeNext = BN(0)
	_this.currentStage = BN(0)
	// 事件
	Interface.UI.on('currentRoundInfo',function(currentRoundInfo){
		_this.poolWhole = currentRoundInfo.poolWhole.dividedBy(_this.fullUnit)
		_this.instanceBeforeNext = BN(_this.stageInfo[currentRoundInfo.currentStage.toNumber()-1]).dividedBy(_this.fullUnit).minus(_this.poolWhole)
		_this.currentStage = currentRoundInfo.currentStage
	})

	// 方法

	// 生命周期
	this.on('mount',function(){
		$('liangkai .question.circle.outline.icon').click(function(){
			$('.liangkai.ui.basic.modal').modal('show')
		})
	})
</script>
<style>
liangkai {
	white-space: nowrap;
}
h4.ui.header {
	font-size: 1.35rem;
	font-weight: normal;
	line-height: 1;
	color: #04e3d2;
	margin-bottom: 1.5rem;
}
liangkai .content span.reward-pool{
	font-size: 2.25em;
	vertical-align: middle;
	color: #04e3d2;
}
liangkai .content .icon {
	vertical-align: middle;
}
.currentStage {
	font-size: 4rem;
	position: absolute;
	right: 1.5rem;
	top: 1.5rem;
}
.ui.segment {
	color: #caccf7;
}
.ui.grid.reward {
	margin: 1rem -1rem;
}
.icon.stopwatch,.icon.ethereum {
	color: #fff;
}
.eight.wide.column svg{
	height: 2em;
	width: auto;
}
[data-animeOrder] {
	color: #04e3d2;
}
.colored-tips {
	color: #04e3d2;
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
</style>
</liangkai>