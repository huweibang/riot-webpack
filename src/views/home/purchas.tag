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