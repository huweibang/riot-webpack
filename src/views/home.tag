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
		var logo_title = require('../imgs/logo-title.png')
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

//购买子页面
<Subpage-purchase>
	<h2 class="ui header">Key<i class="question circle outline icon"></i></h2>
	<div class="bordergroup one"></div>
	<div class="bordergroup two"></div>
	<p data-translate="keys_10">10개 이상의 ‘행운의 열쇠’를 구입하시면, 행운의 여신이 회원님에게 더 많은 ETH를 드립니다!</p>
	<div class="ui right labeled input fluid">
		<label for="amount" class="ui label">
			<i class="icon ethereum normal"></i>
		</label>
		<input type="text" placeholder="100 Keys" id="amount" value={ keysFilter() } onblur={ keysInput }/>
		<div class="ui basic label">@0.100000ETH</div>
	</div>
	<div class="TMX">
		<div class="ethPlaceHolder">
			
		</div>
		<div class="TMXs">
			100TMX
		</div>
		<div class="TMXprice">
			TMX price:0.000100ETH
		</div>
		<i class="question circle outline icon"></i>	
	</div>
	<div class="purchas-keys-buttons">
		<div onclick={ more10Key }>+10 Key</div>
		<div onclick={ more20Key }>+20 Key</div>
		<div onclick={ more40Key }>+<br />40</div>
		<div onclick={ more80Key }>+<br />80</div>
		<div onclick={ more100Key }>+<br />100</div>
	</div>
	<div class="send-eth ui grid">
		<div class="eight wide computer eight wide tablet sixteen wide mobile column">
			<custom-button class="btn-send" animated={true} onclick={ notTheTime }>
				<span data-translate="send_eth">ETH사용</span>
			</custom-button>
		</div>
		<div class="eight wide computer eight wide tablet sixteen wide mobile column">
			<button class="ui blue basic button fluid" onclick={ notTheTime }>
				<span data-translate="reverse">보너스 사용</span>
			</button>
		</div>

	</div>
	<div class="ui basic modal subpage-purchase">
		<div class="ui icon header">
			Key
		</div>
		<div class="content">
			<p data-translate="purchas_question_1">幸运钥匙Key是玩家的分红权证和中奖凭证。</p>
			<p data-translate="purchas_question_2">Key的起始兑换价格是0.1个ETH=10个Key，玩家需购买10个及以上的Key，方可获得进场夺宝与分红的资格。</p>
			<p data-translate="purchas_question_3">当玩家收获3倍的财富回报时，手中的Key将被幸运女神收回。玩家须重新购买Key，才能继续进场参与夺宝。</p>
		</div>
		<div class="actions">
			<div class="ui green ok inverted button">
				<i class="checkmark icon"></i>
				<span data-translate="ok"></span>
			</div>
		</div>
	</div>
	<div class="ui basic modal TMXModal">
		<div class="ui icon header">
			TMX
		</div>
		<div class="content">
			<p data-translate="TMX_question_1">TMX是进入幸运之星的必备门票，是幸运之城“TryMinex全鈱控股”发行的生态权益通证。</p>
			<p data-translate="TMX_question_2">进场的门票TMX将被焚毁献祭给幸运女神，为玩家加持幸运值。</p>
			<p data-translate="TMX_question_3">玩家持有TMX，可以获得全鈱控股旗下生态平台的增值收益与回报。</p>
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
	// 属性
	_this.keys = 10
	

	// 事件
	_this.keysInput = function(e){
		_this.keys = parseInt(e.target.value) || 0
	}
	_this.more10Key = function(){
		_this.keys += 10
	}
	_this.more20Key = function(){
		_this.keys += 20
	}
	_this.more40Key = function(){
		_this.keys += 40
	}
	_this.more80Key = function(){
		_this.keys += 80
	}
	_this.more100Key = function(){
		_this.keys += 100
	}
	_this.notTheTime = function(){
		$('.notTheTime.modal').modal('show')
	}

	// 方法
	_this.keysFilter = function(){
		if(_this.keys > 1){
			return _this.keys + ' Keys'
		}else {
			return _this.keys + ' Key'
		}
		
	}

	// 生命周期
	this.on('mount',function(){
		$('Subpage-purchase h2 .question.circle.outline.icon').click(function(){
			$('.subpage-purchase.ui.basic.modal').modal('show')
		})
		$('Subpage-purchase .TMX .question.circle.outline.icon').click(function(){
			$('.TMXModal.ui.basic.modal').modal('show')
		})
	})
</script>

<style>
Subpage-purchase {
	font-size: 1.25rem;
	line-height: 1.5;
}
#amount {
	text-align: center;
	outline: none;
	border: none;
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
.ui.label {

	text-align: center;
}
.ui.label .icon.ethereum {
	text-align: center;
	margin: 0;
}
.purchas-keys-buttons {
	display: flex;
	flex-wrap: nowrap;

}
.purchas-keys-buttons div{
	line-height: 1.5rem;
	flex: 1;
	text-align: center;
	border: 1px solid #ff8031;
	border-right: 0;
}
.purchas-keys-buttons div:nth-child(1) {
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}
.purchas-keys-buttons div {
	color: #d37d4a;
	margin-top: 1.5rem;
	transition: .3s ease-in-out all;
	cursor: pointer;
}
.purchas-keys-buttons div:hover {
	background: #ff8031;
	color: white;
}
.purchas-keys-buttons div:last-child {
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
	border-right: 1px solid #ff8031;
}
.purchas-keys-buttons div:nth-child(1),.purchas-keys-buttons div:nth-child(2){
	flex: 5;
	line-height: 3rem;

}
.send-eth.ui.grid {
	margin-top: 1.5rem;
}
.send-eth.ui.grid .ui.button {
	font-size: 1.25rem;
	line-height: 1.5;
	padding: .375rem .75rem;
	border-radius: .25rem;
}
.ui.blue.button.fluid,.ui.blue.button.fluid:hover,.ui.blue.button.fluid:active,.ui.blue.button.fluid:focus {
	color: #fff!important;
	border: 1px solid #02e4d1;
}
.TMX {
	margin-top: 1rem;
	display: flex;
}
.TMX .TMXprice {
	flex: 0 0 7.7487rem;
	text-align: right;
	white-space: nowrap;
	text-align: right;
	padding-right: 1em;
}
.TMX .ethPlaceHolder {
	flex: 0 0 2.2916rem;

}
.TMX .TMXs {
	text-align: center;	
	flex: 1 1 auto;
}
.TMX .question.circle.outline.icon {
	flex: 0 0  1.25rem;
	margin-top: 0;
	vertical-align: middle;
}
</style>
</Subpage-purchase>


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

// 邀请好友子页面
<invite-friend>
	<div class="ui grid">
		<div class="row">
			<div class="ten wide computer ten wide tablet ten wide mobile column invite-link-wrapper">
				<span data-translate="invite_link">邀请链接：</span><br />{ shareLink() }
			</div>
			<div class="six wide computer six wide tablet six wide mobile column share-button-wrapper right aligned">
				<custom-button><span data-translate="share">分享</span></custom-button>
			</div>
		</div>
	</div>
	<h4 class="ui header" data-translate="invite_fund">초대 리워드</h4>
	<div class="ui grid invite-reward-list">
		<div class="row">
			<div class="six wide computer six wide tablet sixteen wide mobile column">
				<span data-translate="friends_one">一级好友:</span>{ friendListOne }
			</div>
			<div class="ten wide computer ten wide tablet sixteen wide mobile column right aligned">
				<span data-translate="prompt_fund">추천인 리워드：</span>0.00000ETH
			</div>
		</div>
		<div class="row">
			<div class="six wide computer six wide tablet sixteen wide mobile column">
				<span data-translate="friends_two">二级好友：</span>{ friendListTwo }
			</div>
			<div class="ten wide computer ten wide tablet sixteen wide mobile column right aligned">
				<span data-translate="prompt_fund">推荐奖励：</span>0.00000ETH
			</div>
		</div>
	</div>
	<style>
	.ui.grid .custom-button {
		font-size: 1rem;
		margin: 0.625rem;
	}
	.ui.header {
		color: white;
	}
	.ui.grid.invite-reward-list {
		background: #1d1c3a;
		margin-left: 0;
		margin-right: 0;
		padding-top: 1rem;
		padding-bottom: 1rem;
	}
	.invite-reward-list .row {
		margin-bottom: 1rem;
		white-space: nowrap;
	}
	.share-button-wrapper {

	}
	.ui.grid .custom-button {
		width: auto;
		display: inline-block;

	}
	.invite-link-wrapper {
		word-break: break-all;
	}
</style>
<script>
	var _this = this
	_this.clipboard = null
	_this.friendListOne = 0
	_this.friendListTwo = 0
	_this.shareLink = function(){
		if(Interface.Bridges.Metamask && Interface.Bridges.Metamask._lastWallet){
			return `https://luckystars.folengame.com/?inviteCode=${Interface.Bridges.Metamask._lastWallet}`
		}else {
			return 'https://luckystars.folengame.com'
		}
	}
	_this.copySuccessCb = function(){
		alert('您的专属邀请链接已复制！')
	}
	_this.getFriendsMap =function(){
		Interface.Bridges.Metamask.contracts.LuckyStar.read('getNumberOfInvited',Interface.Bridges.Metamask._lastWallet).then(function(friendsMap){
			_this.friendListOne = friendsMap[0].toNumber()
			_this.friendListTwo = friendsMap[1].toNumber()
			_this.update()
		},function(error){})
		
	}
	Interface.Bridges.Metamask && Interface.Bridges.Metamask.on('account.signedIn',function(){
		_this.clipboard = new ClipboardJS('invite-friend .share-button-wrapper .custom-button', {
    		text:_this.shareLink
		})
		_this.update()
		_this.getFriendsMap()
	})
	this.on('mount',function(){
		_this.clipboard = new ClipboardJS('invite-friend .share-button-wrapper .custom-button', {
    		text:_this.shareLink
		})
		_this.clipboard.on('success',_this.copySuccessCb)
		if(Interface.Bridges.Metamask && Interface.Bridges.Metamask.signedIn){
			_this.getFriendsMap()
		}
	})
</script>
</invite-friend>

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
			0.00000 ETH
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
			0 TMX
		</div>
		<div class="eight wide computer eight wide tablet six wide mobile column left aligned" data-translate="keys_amount">
			key 총량
		</div>
		<div class="eight wide computer eight wide tablet ten wide mobile column right aligned gracefulText">
			0 Key
		</div>
		<div class="eight wide computer eight wide tablet six wide mobile column left aligned" data-translate="times_amount">
			누적시간
		</div>
		<div class="eight wide computer eight wide tablet ten wide mobile column right aligned gracefulText">
			0.00 <span data-translate="year">년</span>
		</div>
	</div>
	<script>
		var _this = this
	// 属性
	
	

	// 事件
	

	// 方法
	

	// 生命周期
	this.on('mount',function(){
		
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
					<span data-translate="pool_leaves">상금풀 누적총량</span> 0.00000 ETH
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
		//属性
		_this.cycle = require('../imgs/cycle.png')

		//事件
		this.on('mount',function(){
			// $('span#countdown-shikai').countdown(new Date().setHours(new Date().getHours()+6),function(e){
			// 	$(this).html(e.strftime('%H:%M:%S'));
			// })
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

// 量开
<liangkai>
	<div class="ui segment">
		<h4 class="ui header"><span data-translate="liangkai">에너지 단계</span><i class="question circle outline icon"></i></h4>
		<div class="bordergroup one"></div>
		<div class="bordergroup two"></div>
		<p class="tips" data-translate="pool_whole">상금풀 현재총량</p>
		<div class="ui grid content">
			<div class="eight wide column">
				<p style="white-space: nowrap">
					<span class="reward-pool">0.00000</span>
					<i class="icon ethereum big"></i>
				</p>
				<p style="white-space: nowrap">
					<span data-translate="next_count_leaves">다음발표 남은시간</span> 0.00000 ETH
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
	// 属性
	_this.lineCycle = require('../imgs/gg.svg')
	

	// 事件
	

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

//记录子页面
<record>
	<h4 class="ui header" data-translate="purchas_record">내역</h4>
	<div class="record-table">
		<div class="ui grid">
			<div class="row" class="table-header">
				<div class="seven wide column" data-translate="purchas_date">구입일자</div>
				<div class="three wide column">Key</div>
				<div class="three wide column">TMX</div>
				<div class="three wide column">ETH</div>
			</div>
		</div>
	</div>
	
	
	<script>
		var _this = this
	// 属性
	
	

	// 事件
	

	// 方法
	

	// 生命周期
</script>
<style>

h4.ui.header {
	font-size: 1.15rem;
	font-weight: normal;
	color: white;
}
.record-table {
	background: #1d1c3a;
	height: 25rem;
	font-size: 1.15rem;

}
.record-table .ui.grid {
	margin: 0;
}
</style>
</record>

//自定义按钮

<custom-button>
	<div class="{custom-button:true,animated:opts.animated}"><yield /></div>
	<style>
	.custom-button {
		display: block;
		font-weight: 400;
		text-align: center;
		white-space: nowrap;
		vertical-align: middle;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
		border: 1px solid transparent;
		padding: .375rem .75rem;
		font-size: 1.25rem;
		line-height: 1.5;
		border-radius: .25rem;
		transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		background-image: linear-gradient(90deg, rgb(2, 229, 209) 0%, rgb(67, 145, 253) 100%);
		
		color: white;
		cursor: pointer;
	}
	.custom-button.animated {
		animation: custom-button-anime 0.75s infinite;

	}
	.custom-button.animated:hover {
		box-shadow: none;
		text-shadow: none;
	}
	.custom-button:hover {
		box-shadow: 0 0 2px #02E4D1, 0 0 25px #02E4D1, 0 0 5px #02E4D1;
		text-shadow: 0 0 2px #02E4D1;
	}
	@keyframes custom-button-anime {
		0% {
			box-shadow: 0 0 0 0 rgba(2, 228, 209, 0.8);
		}
		70% {
			box-shadow: 0 0 0 5px rgba(2, 228, 209, 0.3);
		}
		100% {
			box-shadow: 0 0 0 10px rgba(2, 228, 209, 0);
		}
	}
</style>
</custom-button>
