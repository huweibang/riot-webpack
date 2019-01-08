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
		<input type="text" placeholder="100 Keys" id="amount" oninput={ keysInput }/>
		<div class="ui basic label">@{ calcedEth.toFixed(5) }ETH</div>
	</div>
	<div class="TMX">
		<div class="ethPlaceHolder">
			
		</div>
		<div class="TMXs">
			{ calcedTMX.toFixed(5) }TMX
		</div>
		<div class="TMXprice">
			TMX price:{ TMXprice.toFixed(5) }ETH
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
			<custom-button class="btn-send" animated={true} onclick={ purchase }>
				<span data-translate="send_eth">ETH사용</span>
			</custom-button>
		</div>
		<div class="eight wide computer eight wide tablet sixteen wide mobile column">
			<button class="ui blue basic button fluid" onclick={ reverse }>
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
	<div class="ui tiny modal reverse">
		<div class="header" data-translate="reverse">提现</div>
		<div class="content">
			<div class="ui fluid icon input">
				<input type="text" class="reverseAmount" />
				<i class="ethereum icon"></i>
			</div>
		</div>
		<div class="actions">
			<div class="ui green button" id="reverse" data-translate="reverse" onclick={ reverseHandler }>提现</div>
			<div class="ui cancel red button" data-translate="cancel">取消</div>
		</div>
	</div>
	<script>
		var BN = require('bignumber.js')
		var Promise = require('bluebird')
		var _this = this
		_this.mixin('BNMix')
	// 属性
	_this.keys = 10
	_this.TMXprice = BN(0)
	_this.calcedEth = BN(0)
	_this.calcedTMX = BN(0)
	_this.calcing = false
	_this.purchasing = false
	_this.TMXs = 0
	_this.operateCount = 0
	_this.delayQueryEthTimeId = 0
	// 事件
	_this.keysInput = function(e){
		_this.keys = parseInt(e.target.value) || 0
		e.preventUpdate = true
		_this.calcing = true
		clearTimeout(_this.delayQueryEthTimeId)
		_this.delayQueryEthTimeId = setTimeout(function(){
			$('#amount').val(_this.keysFilter())
			_this.reCalcETHandTMX()
		}, 1000)
	}
	_this.more10Key = function(){
		_this.keys += 10
		$('#amount').val(_this.keysFilter())
		_this.reCalcETHandTMX()
	}
	_this.more20Key = function(){
		_this.keys += 20
		$('#amount').val(_this.keysFilter())
		_this.reCalcETHandTMX()
	}
	_this.more40Key = function(){
		_this.keys += 40
		$('#amount').val(_this.keysFilter())
		_this.reCalcETHandTMX()
	}
	_this.more80Key = function(){
		_this.keys += 80
		$('#amount').val(_this.keysFilter())
		_this.reCalcETHandTMX()
	}
	_this.more100Key = function(){
		_this.keys += 100
		$('#amount').val(_this.keysFilter())
		_this.reCalcETHandTMX()
	}
	
	_this.notTheTime = function(){
		$('.notTheTime.modal').modal('show')
	}
	_this.purchase = function(){
		function processPurchase(){
			Interface.Bridges.Metamask.contracts.LuckyStars.write('buy',[],undefined,{value:currentPurchasEth.multipliedBy(_this.fullUnit).toFixed(0).toString() }).then(function(){
				_this.purchasing = false
				Interface.UI.trigger('confirmPurchas')
			},function(){
				Interface.UI.trigger('cancelPurchas')
				_this.purchasing = false
			})
		}
		function initPurchase(){
			var allowance,balance,TMXToDestory = currentPurchasTMX
			return Promise.all([_this.getAllowance(),_this.getBalanceOfMe()]).then(function(data){
				allowance = BN(data[0])
				balance = BN(data[1])
				return new Promise(function(res,rej){
					res({
						allowance:allowance,
						balance:balance,
						TMXToDestory:TMXToDestory
					})
				})
			},function(err){
				Interface.UI.trigger('GraceError',err)
			})
		}
		var currentPurchasEth,currentPurchasTMX
		if(_this.purchasing){
			$('.ui.modal.tiny.Public .header').text("提示")
			$('.ui.modal.tiny.Public .content p').text("正在处理当前购买！")
			$('.ui.modal.tiny.Public').modal('show')
			return
		}
		_this.purchasing = true
		
		if(_this.calcing){
			_this.purchasing = false
			return
		}
		if(!Interface.Cache.isRegistered){
			$('.ui.modal.tiny.Public .header').text($.i18n.map.welcome)
			$('.ui.modal.tiny.Public .content p').text($.i18n.map.please_register)
			$('.ui.modal.tiny.Public').modal('show')
			_this.purchasing = false
			return
		}
		
		_this.reCalcETHandTMX(function(err){
			if(err){
				return
			}
			currentPurchasEth = _this.calcedEth
			currentPurchasTMX = _this.calcedTMX
			if(currentPurchasEth.isLessThan(BN('0.1')) || currentPurchasEth.isGreaterThan(BN("30"))){
				$('.ui.modal.tiny.Public .header').text("提示")
				$('.ui.modal.tiny.Public .content p').text("支付的ETH在0.1ETH-30ETH之间！")
				$('.ui.modal.tiny.Public').modal('show')
				_this.purchasing = false
				return
			}		
			initPurchase().then(function(data){
				if(data.balance.isLessThan(data.TMXToDestory)){
					$('.ui.modal.tiny.Public .header').text("提示")
					$('.ui.modal.tiny.Public .content p').text("TMX余额不足！")
					$('.ui.modal.tiny.Public').modal('show')
					_this.purchasing = false
					return
				}else if(data.allowance.isLessThan(data.TMXToDestory)){
					_this.newApprove().then(function(){
						processPurchase()
					},function(){

					})
				}else {
					processPurchase()
				}
			})
		})
		

	}
	_this.reverse = function(){
		$('.ui.tiny.modal.reverse').modal('show')
	}
	_this.reverseHandler = function(e){
		var reverseAmount = (BN(parseFloat($('.reverseAmount').val())).multipliedBy(_this.fullUnit)).toString()
		Interface.Bridges.Metamask.contracts.LuckyStars.write('reLoadBuy',[reverseAmount]).then(function(){
			$('.ui.tiny.modal.reverse').modal('hide')
		},function(){
			$('.ui.tiny.modal.reverse').modal('hide')
		})
	}
	// 方法
	_this.keysFilter = function(){
		if(_this.keys > 1){
			return _this.keys + ' Keys'
		}else {
			return _this.keys + ' Key'
		}
		
	}
	_this.newApprove = function(){
		return Interface.Bridges.Metamask.contracts.TMX.write('approve',[Interface.Bridges.Metamask.contracts.Payment.API.address,1e23.toString()]).then(_this.processApprove)
	}
	_this.processApprove = function(){
		return new Promise(function(res,rej){
			function validateAllowance(){
				_this.getAllowance().then(function(data){
					if((BN(data)).isEqualTo(1e23)){
						res(true)
					}else {
						validateAllowance()
					}
				},function(err){
					validateAllowance()
				})
			}
			validateAllowance()
		})
	}
	_this.getAllowance = function(){
		return Interface.Bridges.Metamask.contracts.TMX.read('allowance',[Interface.Bridges.Metamask._lastWallet,Interface.Bridges.Metamask.contracts.Payment.API.address])
	}
	_this.getBalanceOfMe = function(){
		return Interface.Bridges.Metamask.contracts.TMX.read('balanceOf',[Interface.Bridges.Metamask._lastWallet])
	}
	
	_this.reCalcETHandTMX = function(cb){
		_this.operateCount++
		_this.calcing = true
		var currentOperate = _this.operateCount
		var currentCalcKeys = _this.keys
		Interface.Bridges.Metamask.contracts.LuckyStars.read("iWantXKeys",[((BN(_this.fullUnit)).multipliedBy(BN(currentCalcKeys))).toString()]).then(function(data){
			if(_this.operateCount == currentOperate){
				var priceFix = BN(data[0]).multipliedBy((currentCalcKeys+0.01)/currentCalcKeys)
				_this.calcedEth = priceFix.dividedBy(_this.fullUnit)
				_this.calcedTMX = (BN(data[1])).dividedBy(_this.fullUnit)
				_this.calcing = false
				_this.update()
				if(cb) cb()
			}
	},function(err){
		Interface.UI.trigger('purchasFail',err)
		if(cb) cb(err)
	})
	}
	
	_this.getTMXPrice = function(){
		Interface.Bridges.Metamask.contracts.Payment.read("getTMXprice").then(function(data){
			_this.TMXprice = (BN(1)).dividedBy(data)
			_this.update()
		},function(err){
			Interface.UI.trigger('GraceWarning',err)
		})
	}
	// 生命周期
	this.on('mount',function(){
		$('#amount').val('10 Keys')
		$('Subpage-purchase h2 .question.circle.outline.icon').click(function(){
			$('.subpage-purchase.ui.basic.modal').modal('show')
		})
		$('Subpage-purchase .TMX .question.circle.outline.icon').click(function(){
			$('.TMXModal.ui.basic.modal').modal('show')
		})
		_this.getTMXPrice()
		_this.reCalcETHandTMX()
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