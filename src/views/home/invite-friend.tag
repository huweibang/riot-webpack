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