// 邀请好友子页面
<invite-friend>
	<div class="ui grid">
		<div class="row">
			<div class="ten wide computer ten wide tablet ten wide mobile column invite-link-wrapper">
				<span data-translate="invite_link">邀请链接：</span><br />{ shareLink() }
			</div>
			<div class="six wide computer six wide tablet six wide mobile column share-button-wrapper right aligned">
				<div class="whole-wrapper">
					<i class="question circle outline icon"></i><br />
					<custom-button><span data-translate="share">分享</span></custom-button>
				</div>
				
			</div>
		</div>
	</div>
	<h4 class="ui header" data-translate="invite_fund">초대 리워드</h4>
	<div class="invite-reward-list" ref="reward_list">
		<div class="ui grid">
			<div class="row" each={ item,i in friendsMap }>
				<div class="six wide computer six wide tablet sixteen wide mobile column">
					<span data-translate={ "friends_" + (i + 1) }>{ $.i18n.map["friends_" + (i + 1)] }</span>{ item.amount.toNumber() }
				</div>
				<div class="ten wide computer ten wide tablet sixteen wide mobile column right aligned">
					<span data-translate="prompt_fund">추천인 리워드：</span>{ item.dividend.toFixed(5) }ETH
				</div>
			</div>	
		</div>	
	</div>
	<div class="ui basic modal invite-friend">
		<div class="ui icon header" data-translate="invite_friends">
			邀请好友
		</div>
		<div class="content">
			<p data-translate="invite_friend_question_1"></p>
			<p data-translate="invite_friend_question_2"></p>
			<p data-translate="invite_friend_question_3"></p>
		</div>
		<div class="actions">
			<div class="ui green ok inverted button">
				<i class="checkmark icon"></i>
				<span data-translate="ok"></span>
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
	.invite-reward-list {
		background: #1d1c3a;
		padding: 1rem;
		height: 20rem;
		overflow-x: hidden;
		overflow-y: auto;
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
	var Promise = require('bluebird')
	_this.$ = $
	_this.clipboard = null
	_this.friendsMap = []
	// 方法
	_this.shareLink = function(){
		if(Interface.Bridges.Metamask && Interface.Bridges.Metamask._lastWallet){
			return 'https://luckystars.folengame.com/?inviteCode='+Interface.Bridges.Metamask._lastWallet
		}else {
			return 'https://luckystars.folengame.com'
		}
	}
	_this.copySuccessCb = function(){
		Interface.UI.trigger('inviteCodeCopied')
	}
	_this.getFriendsMap =function(){
		Promise.all([Interface.Bridges.Metamask.contracts.Register.read('getNumberOfInvited',Interface.Bridges.Metamask._lastWallet),Interface.Bridges.Metamask.contracts.LuckyStars.read('getPlayerAffValue',Interface.Bridges.Metamask._lastWallet)]).then(function(data){
			var length = data[0][0].toNumber()
			length = (length > 13) ? 13 : length
			var relationComplexed = []
			for(var i = 0;i < length; i++){
				relationComplexed.push({
					amount : data[0][i],
					dividend : data[1][i]
				})
			}
			_this.friendsMap = relationComplexed
			_this.update()
		},function(err){
			Interface.UI.trigger('GraceWarning',err)
		})

	}

	_this.validateRelative = function(address){
		return Interface.Bridges.Websocket.contracts.Register.read('getRelationChain',[address]).then(function(relationArray){
			return Promise.resolve(relationArray.some(function(e){
				return e.toLowerCase() == Interface.Bridges.Metamask._lastWallet
			}))
		},function(err){
			return Promise.reject(err)
		})
	}
	// 事件
	Interface.Bridges.Websocket.contracts.Register.on('Event',function(event){
		var isMe = (event.returnValues.inviter.toLowerCase() == Interface.Bridges.Metamask._lastWallet)
		if(event.event == 'LogRegistered' && isMe){
			_this.getFriendsMap()
		}else if(Interface.Bridges.Metamask._lastWallet){
			_this.validateRelative(event.returnValues.player).then(function(isRelated){
				if(isRelated){
					_this.getFriendsMap()
				}
			},function(err){
				Interface.UI.trigger('GraceWarning',err)
			})
		}
	})
	Interface.Bridges.Metamask.on('account.signedIn',function(){
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
		$('invite-friend .question.circle.outline.icon').click(function(){
			$('.invite-friend.ui.basic.modal').modal('show')
		})
		if(Interface.Bridges.Metamask.signedIn){
			_this.getFriendsMap()
		}
		if(Interface.UI.device === 'others'){
			$(_this.refs.reward_list).mCustomScrollbar({
				theme:'minimal',
				mouseWheel:{ enable:true},
				autoHideScrollbar:true
			})
		}
	})
</script>
</invite-friend>