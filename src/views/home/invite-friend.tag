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
	<div class="invite-reward-list">
		<div class="ui grid">
			<div class="row" each={ value,i in friendsMap }>
				<div class="six wide computer six wide tablet sixteen wide mobile column">
					<span data-translate={ "friends_" + (i + 1) }>{ $.i18n.map["friends_" + (i + 1)] }</span>{  friendsMap[i].toNumber() }
				</div>
				<div class="ten wide computer ten wide tablet sixteen wide mobile column right aligned">
					<span data-translate="prompt_fund">추천인 리워드：</span>0.00000ETH
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
	_this.shareLink = function(){
		if(Interface.Bridges.Metamask && Interface.Bridges.Metamask._lastWallet){
			return 'https://luckystars.folengame.com/?inviteCode='+Interface.Bridges.Metamask._lastWallet
		}else {
			return 'https://luckystars.folengame.com'
		}
	}
	_this.copySuccessCb = function(){
		alert('您的专属邀请链接已复制！')
	}
	_this.getFriendsMap =function(){
		Interface.Bridges.Metamask.contracts.Register.read('getNumberOfInvited',Interface.Bridges.Metamask._lastWallet).then(function(friendsMap){
			friendsMap.length = friendsMap[0].toNumber()
			_this.friendsMap = friendsMap
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
		$('invite-friend .question.circle.outline.icon').click(function(){
			$('.invite-friend.ui.basic.modal').modal('show')
		})
		if(Interface.Bridges.Metamask && Interface.Bridges.Metamask.signedIn){
			_this.getFriendsMap()
		}
	})
</script>
</invite-friend>