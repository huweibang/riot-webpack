<home>
	<div class="ui modal tiny notTheTime">
		<div class="header gracefulText" data-translate="welcome">欢迎！</div>
		<div class="content">
			<p data-translate="wait_word">全球同步开放注册中，即将正式启动，敬请期待！</p>
		</div>
		<div class="actions">
			<button class="ui green cancel button" data-translate="ok"></button>
		</div>
	</div>
	<div class="home-container ui container">
		<div class="logo-title">
			<img src={ logo_title } />
		</div>
		
		<h1 class="ui header title" data-translate="Lucky_Stars" if={ Interface.UI.language === 'zh' }>
			Lucky Stars, 코인장 하락세 고비를 우아하게 넘긴다!
		</h1>
		<h1 class="ui header title" data-translate="Lucky_Stars" if={ !(Interface.UI.language === 'zh') } style="text-align: center;">
			Lucky Stars, 코인장 하락세 고비를 우아하게 넘긴다!
		</h1>
		<div class="ui grid top-panel">
			<div class="eight wide computer sixteen wide mobile column">
				<shikai></shikai>

			</div>
			<div class="eight wide computer sixteen wide mobile column">
				<liangkai></liangkai>
			</div>
		</div>
		<div class="purchase-key">
			<custom-button animated={ true }>
				<div class="inner-content ui grid">
					<div class="two wide computer two wide tablet sixteen wide mobile column">
						<i class="key icon"></i> x10
					</div>
					<div class="twelve wide computer twelve wide tablet sixteen wide mobile column prompt-wrapper" data-translate="lucky_prompt1">
						幸运女神喜欢眷顾那些乐于分享的人
					</div>
					<div class="two wide computer column">
						
					</div>
				</div>
			</custom-button>
		</div>
		<div class="ui grid control-panel">
			<div class="eight wide computer sixteen wide mobile column">
				<div class="ui top attached tabular menu">
					<a class="item active" data-tab="purchase" data-translate="purchas">购买幸运钥匙</a>
					<a class="item" data-tab="fund" data-translate="benfit">我的收益</a>
					<a class="item" data-tab="invert" data-translate="invite_friends">邀请好友</a>
				</div>
				<div class="left-wrapper">
					<div class="ui bottom attached tab segment active" data-tab="purchase">
						<Subpage-purchase></Subpage-purchase>
					</div>
					<div class="ui bottom attached tab segment" data-tab="fund"><fallback></fallback></div>
					<div class="ui bottom attached tab segment" data-tab="invert"><invite-friend></invite-friend></div>
				</div>
				
			</div>
			<div class="eight wide computer sixteen wide mobile column">
				<div class="ui top attached tabular menu">
					<a class="item active" data-tab="round" data-translate="current_round">轮次</a>
					<a class="item" data-tab="count" data-translate="count">统计</a>
					<a class="item" data-tab="record" data-translate="record">记录</a>
				</div>
				<div class="right-wrapper">
					<div class="ui bottom attached tab segment active" data-tab="round"><round></round></div>
					<div class="ui bottom attached tab segment" data-tab="count"><count></count></div>
					<div class="ui bottom attached tab segment" data-tab="record"><record></record></div>
				</div>
			</div>
		</div>
		
	</div>
	<script>
		var anime = require('animejs')
		var logo_title = require('../../imgs/logo-title.png')
		var _this = this
	// 属性
	_this.logo_title = logo_title
	

	// 事件
	Interface.UI.on('Contracts.loaded',function(){
		riot.mount('module-loading','module-null')
	})
	Interface.UI.on('Home.Init.step1',function(){
		if(Interface.UI.device !== 'mobile'){
			anime.timeline().add({
				targets:'.ui.grid.top-panel .ui.segment',
				easing:'easeInOutQuad',
				opacity:[0,1],
				scale:[1.05,1],
				duration:500
			}).add({
				targets:'.purchase-key .custom-button',
				easing:'easeInOutQuad',
				opacity:[0,1],
				scale:[1.05,1],
				duration:500,
				offset:250
			}).add({
				targets:'.ui.grid.control-panel',
				easing:'easeInOutQuad',
				opacity:[0,1],
				scale:[1.05,1],
				duration:500,
				offset:500,
				complete:function(){
					
				}
			})
		}else {
			anime.timeline().add({
				targets:'.ui.grid.top-panel .ui.segment',
				easing:'easeInOutQuad',
				opacity:[0,1],
				translateY:[100,0],
				duration:700,
				delay:function(e,i){
					return i * 350
				}
			}).add({
				targets:'.purchase-key .custom-button',
				easing:'easeInOutQuad',
				opacity:[0,1],
				translateY:[50,0],
				duration:700,
				offset:-350
			}).add({
				targets:'.ui.grid.control-panel',
				easing:'easeInOutQuad',
				opacity:[0,1],
				scale:[1.05,1],
				duration:500,
				offset:500,
				complete:function(){
					
				}
			})
		}
	})

	// 方法
	

	// 生命周期
	this.on('mount',function(){
		$('.menu .item').tab()
		
	})

</script>

<style>
.ui.grid.top-panel .ui.segment {
	box-shadow: 0px 0px 20px 0 #21203f;
	opacity: 0;
}
.ui.grid.top-panel .question.circle {
	margin-top: 0;
}

.logo-title {
	overflow: hidden;
}
.logo-title img{
	display: block;
	margin: 1rem auto;
}
.ui.header.title {
	font-weight: 100;
	color: white;
	font-size: 3.5rem;
	text-align: justify;
	margin-bottom: 0;
	text-align-last: justify;
	font-weight: 100;
}
.ui.header.title::after {
	content: '';
	width: 100%;
	display: inline-block;
}
.tips {
	margin-bottom: 2rem;
}
.home-container {
	margin-top: 5.5rem;
}
.purchase-key {
	margin: 4rem 0;
}
.purchase-key .custom-button {
	opacity: 0;
}
.ui.segment {
	background: #21203f;
}
span#countdown-shikai {
	color: #508ff6;
	font-size: 2.25em;
	vertical-align: middle;
}
.inner-content div:first-child {
	text-align: left;
}
.ui.bottom.attached.tab.segment {
	padding-bottom: 2rem;
	box-shadow: 0px 0px 20px 0 #21203f;
}
.ui.grid.control-panel {
	min-height: 40.4178rem;
	opacity: 0;
}
.prompt-wrapper {
	white-space: pre-wrap;
}
/* .left-wrapper {
	min-height:36.0678rem;
}
.right-wrapper {
	min-height: 32.8214rem;
	} */
	@media only screen and (max-width: 991px) {
		.ui.header.title {
			font-size: 2rem;
			margin: 3rem 0 0;
		}
	}
	@media only screen and (max-width: 768px) {
		.ui.header.title {
			font-size: 1.5rem;
			margin: 3rem 0 0;
		}
		.inner-content {
			font-size: 1.2rem;
		}
		.inner-content div:first-child {
			text-align: center;
		}
	}
	@media only screen and (max-width: 392px) {
		.ui.header.title {
			font-size: 1.15rem;
			margin: 2rem 0 0;
		}
	}
</style>
</home>