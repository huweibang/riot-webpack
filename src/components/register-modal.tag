<register-modal>
	<div class="ui tiny modal register" ref="modal">
		<div class="ui dimmer">
			<div class="ui text loader">{ loadingText }</div>
		</div>
		<div class="header" data-translate="register">신규가입</div>
		<i class="close icon"></i>
		<div class="content">
			<form class="ui form register-form" ref="form">
				<div class="field">
					<label class="label" data-translate="eth_address">ETH 주소</label>
					<input type="text" name="address" disabled value={ address } autocomplete="off">
				</div>
				<div class="field">
					<label class="label" data-translate="prompt_eth_address">추천인 ETH 주소</label>
					<input type="text" name="InvitationVode" autocomplete="off" value={ inviteCode } oninput={ inviteCodeInput } autocomplete="off"/>
				</div>
				<button class="ui button fluid positive" type="submit" data-translate="register_now">가  입</button>
			</form>
		</div>
	</div>
	<script>
		var route = require('riot-route')
		var Promise = require('bluebird')
		var _this = this
		
	// 属性
	_this.signedIn = Interface.Bridges.Metamask?Interface.Bridges.Metamask.signedIn:false
	_this.address = _this.signedIn?Interface.Bridges.Metamask._lastWallet:''
	_this.inviteCode = route.default.query().inviteCode || ''
	_this.detectRegisterTimeId = 0
	_this.loadingText = ''
	// 事件
	_this.inviteCodeInput = function(e){
		_this.inviteCode = e.target.value
	}
	Interface.Bridges.Metamask && Interface.Bridges.Metamask.on('account.signedIn',function(){
		if(Interface.Bridges.Metamask.signedIn){
			_this.address = Interface.Bridges.Metamask._lastWallet
		}
		
	})
	// 方法
	_this.detectRegisterSuccess = function(){
		function detect(){
			Interface.Bridges.Metamask.contracts.Register.read('isInvitationVode',[_this.address]).then(function(isRegistered){
				if(isRegistered){
					$(_this.refs.modal).modal('hide')
					$('.modal.register .ui.dimmer').removeClass('active')
					Interface.UI.trigger('registerSuccess')
					$.ajax({
						url:'https://luckystars.folengame.com/api/newRegisterInfo',
						data:{
							gmt_create: Date.now(),
							channel_id: route.default.query().channel_id || '-1',
							reg_addr: Interface.Bridges.Metamask._lastWallet,
							invite_addr: _this.inviteCode || '-1'
						},
						success:function(){
							console.log('register successfully!')
						},
						error:function(){
							console.log('api error!')
						}

					})
					return true
				}else {
					detect()
				}
			},function(err){
				Interface.UI.trigger('GraceWarning',$.i18n.map.networkCash)
			})
		}
		detect()
	}

	// 生命周期
	this.on('mount',function(){
		$('.register-form').form({
			inline:true,
			fields:{
				InvitationVode:{
					identifier:'InvitationVode',
					rules:[{
						type:'regExp[/^0x.{40}$/]',
						prompt:function(){
							return $.i18n.map.invitecode_formate_error
						}
					}]
				}
			},
			onSuccess:function(e){
				e.preventDefault()
				_this.loadingText = $.i18n.map.validate_invitecode
				_this.update()
				$('.modal.register .ui.dimmer').addClass('active')
				Interface.Bridges.Metamask.contracts.Register.read('isInvitationVode',[_this.inviteCode]).then(function(isinviteCodeValid){
					if(!isinviteCodeValid){
						Interface.UI.trigger('GraceError',$.i18n.map.invalid_code)
						$('.modal.register .ui.dimmer').removeClass('active')
						return
					}
					_this.loadingText = $.i18n.map.confirm_register
					_this.update()
					Interface.Bridges.Metamask.contracts.Register.write('register',[_this.inviteCode]).then(function(){
						_this.loadingText = $.i18n.map.wait_for_register
						_this.update()
						_this.detectRegisterSuccess()
					},function(){
						$(_this.refs.modal).modal('hide')
						$('.modal.register .ui.dimmer').removeClass('active')
					})
				},function(error){})
				
				
			}
		})
		
	})
</script>
<style>

</style>
</register-modal>