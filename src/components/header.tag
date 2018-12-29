			<header>
				<register-modal />
				<div class="header-container">
					<div class="ui container">
						<div class="ui grid">
							<div class="one wide computer two wide tablet three wide mobile column logo">
								<img src={ logo } />
							</div>
							<div class="eleven wide computer nine wide tablet nine wide mobile column">
								<div class="row">
									<div class="ui inline dropdown nationality" value="kr" ref="nationality">
										<div class="text"><i class="kr flag"></i>한국어</div>
										<i class="dropdown icon"></i>
										<div class="menu">
											<div class="item" data-value="kr"><i class="kr flag"></i>한국어</div>
											<div class="item" data-value="en"><i class="us flag"></i>En</div>
											<div class="item" data-value="zh"><i class="cn flag"></i>中文</div>
											
										</div>
									</div>
								</div>

								<div class="status-bar">
									<span >
										<i class="stopwatch icon"></i><span class="countdown-small">6:00:00</span>
									</span>
									<span>
										<i class="key icon"></i>0
									</span>
									<span>
										<i class="inbox icon"></i>2%(0.3ETH)
									</span>			
								</div>
							</div>
							<div class="two wide computer two wide tablet four wide mobile column right floated">
								<div class="ui active loader" if={ !signedIn }>
									
								</div>
								<div class="user-control">		
									<custom-button onclick={ register_handle } if={ signedIn && isRegistered === false }>
										<span data-translate="register"></span>
									</custom-button>
									<div class="registered" if={ signedIn && isRegistered === true }>
										<i class="check circle outline icon large"></i>
										<div>{ $.i18n.map.registered }</div>
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>		


			</div>

			<script>
				
				var _this = this

				// 属性
				_this.$ = $
				_this.translate = require('../i18n/translate.js')
				_this.logo = require("../imgs/logo.png")
				_this.signedIn = Interface.Bridges.Metamask?Interface.Bridges.Metamask.signedIn:false
				_this.isRegistered = undefined
				// 事件
				_this.register_handle = function(){
					if(Interface.Bridges.Metamask.signedIn){
						$('.ui.modal.register').modal({
							closable:false
						}).modal('show')
					}else {

					}
					
				}
				Interface.UI.on('registerSuccess',function(){
					_this.isRegistered = true
					_this.update()
					$('[data-translate=register]').text($.i18n.map.register)
				})
				Interface.UI.on('translate',function(){
					_this.translate.i18n($(_this.refs.nationality).dropdown('get value'))
				})
				Interface.Bridges.Metamask && Interface.Bridges.Metamask.on('account.signedIn',function(){
					if(Interface.Bridges.Metamask.signedIn){
						_this.signedIn = Interface.Bridges.Metamask.signedIn
						Interface.Bridges.Browser.contracts.LuckyStar.read('isInvitationVode',Interface.Bridges.Metamask._lastWallet).then(function(isRegistered){
							_this.isRegistered = isRegistered
							_this.update()
							$('[data-translate=register]').text($.i18n.map.register)
						},function(){

						})
						
					}
					
				})
				// 方法
				
				// 生命周期
				this.on('mount',function(){
					// $('.countdown-small').countdown(new Date().setHours(new Date().getHours()+6),function(e){
					// 	$(this).html(e.strftime('%H:%M:%S'));
					// })
					if(_this.signedIn){
						Interface.Bridges.Browser.contracts.LuckyStar.read('isInvitationVode',Interface.Bridges.Metamask._lastWallet).then(function(isRegistered){
							_this.isRegistered = isRegistered
							_this.update()
						},function(){

						})
					}
					
					$(_this.refs.nationality).dropdown({
						on:'click',
						onChange:function(value){
							if(Interface.UI.language!==value){
								Interface.UI.trigger('translate')

							}			
						}
					}).dropdown('set selected','kr')

				})
			</script>
			<style>
			.header-container {
				position: fixed;
				width: 100%;
				left: 0;
				top: 0;
				background: #21203f;
				z-index: 50;
				color: white;
			}
			.header-container .logo {
				position: relative;

			}
			.header-container .logo img {
				position: absolute;
				left: 50%;
				top: 50%;
				transform: translate(-50%,-50%);
				width: 90%;
			}
			.header-container .user-control {
				position: absolute;
				right: 1rem;
				top: 50%;
				transform: translateY(-50%);
				width: calc(100% - 2rem);
			}
			.status-bar {
				position: absolute;
				bottom: 1rem;
				left: 1rem;
				width: calc(100% - 1rem);
				display: flex;
				flex-wrap: wrap;
			}
			.status-bar>span {
				flex: 0 0 auto;
				
			}
			.header-container .user-control .custom-button {
				padding: 0;
				line-height: 2rem;
				font-size: 1rem;
				width: 100%;
			}
			.header-container .user-control .registered {
				color: #16ab39;
				text-align: center;
			}
			.header-container .status-bar>span {
				margin-right: 3rem;
			}
			.nationality {
				line-height: 3rem;
			}
			.nationality .menu {
				background: #21213d!important;
				box-shadow: 0 5px 10px 0 #0F0F0F;
			}
			.nationality .menu .item {
				color: white!important;
			}
			.header-container>.ui.container .ui.grid,.header-container>.ui.container .ui.grid>div {
				height: 6.5rem;
			}
			@media only screen and (max-width: 470px) {
				.header-container .logo img {
					width: 80%;
				}
			}
			@media only screen and (min-width: 471px) and (max-width: 991px) {
				.header-container .logo img {
					width: 60%;
				}
			}
			@media only screen and (min-width: 992px) and (max-width: 1200px) {
				.header-container .logo img {
					width: 100%;
				}
			}
			</style>

			</header>