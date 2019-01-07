//记录子页面
<record>
	<h4 class="ui header" data-translate="purchas_record">내역</h4>
	<div class="record-table">
		<div class="ui grid">
			<div class="row" class="table-header">
				<div class="seven wide computer seven wide tablet five wide mobile column" data-translate="purchas_date">구입일자</div>
				<div class="three wide computer three wide tablet four wide mobile column">Key</div>
				<div class="three wide computer three wide tablet four wide mobile column">TMX</div>
				<div class="three wide computer three wide tablet three wide mobile column">ETH</div>
			</div>
			<div class="row" each={ item in purchaseRecord.sort(dateSorter) }>
				<div class="seven wide computer seven wide tablet five wide mobile column">{ dateFormate(item.timestamp) }</div>
				<div class="three wide computer three wide tablet three wide mobile column">{ item.Keys.toFixed(0) }</div>
				<div class="three wide computer three wide tablet four wide mobile column">{ item.TMX.toFixed(5) }</div>
				<div class="three wide computer three wide tablet four wide mobile column">{ item.ETH.toFixed(5) }</div>
			</div>
		</div>
	</div>
	
	
	<script>
		var _this = this
		var BN = require('bignumber.js')
		_this.mixin('BNMix')
		var Promise = require('bluebird')
	// 属性
	_this.fromBlock = '3642281'
	_this.LogBuyEventHash = "0x753f5d4574e2df385eacb33d9989c617c5ded51223ffb67dd572c331551f6f52"
	_this.purchaseRecord = []
	// 事件
	Interface.Bridges.Metamask.on('account.signedIn',function(){
		_this.getRecord()
	})
	Interface.Bridges.Websocket.contracts.LuckyStars.on('Event',function(event){
		var isMe = (event.returnValues['1'].toLowerCase() == Interface.Bridges.Metamask._lastWallet.toLowerCase())
		if(event.event == 'LogBuy' && isMe){
			// 更新购买记录
			_this.getRecord()
			_this.purchaseRecord.push({
				timestamp:event.returnValues['time'],
				Keys:BN(event.returnValues['keys']),
				TMX:BN(event.returnValues['TMX']),
				ETH:BN(event.returnValues['eth'])
			})
		}
	})
	// 方法
	_this.dateSorter = function(a,b){
		return a.timestamp - b.timestamp
	}
	_this.dateFormate = function(dateString){
		var date = new Date(dateString * 1000)
		return date.getFullYear()+'/'+(date.getMonth()+1)+'/'+date.getDate()
	}
	_this.getRecord = function(){
		function resolveEventData(eventArr){
			var dataReg = /0x(.{64})(.{64})(.{64})(.{64})/
			eventArr = eventArr.map(function(e,i){
				var tempDataSlice = e.data.match(dataReg)
				return {
					ETH:BN(tempDataSlice[2],16).dividedBy(1e18),
					Keys:BN(tempDataSlice[3],16).dividedBy(1e18),
					TMX:BN(tempDataSlice[4],16).dividedBy(1e18),
					blockNumber:e.blockNumber
				}
			})
			Promise.each(eventArr,function(buyDefiniton,index){
				return Interface.Bridges.Websocket.web3.eth.getBlock(buyDefiniton.blockNumber).then(function(data){
					if(data === null){
						console.log('null found',buyDefiniton,index)
					}
					eventArr[index].timestamp = data.timestamp
					return Promise.resolve()
				},function(){
					return Promise.reject(buyDefiniton.blockNumber + 'query fail!')
				})
			}).then(function(){
				_this.purchaseRecord = eventArr
				return Promise.resolve()
			},function(err){
				console.log(err)
				return Promise.reject(err)
			})


		}
		_this.getPastLogs().then(function(eventArr){
			resolveEventData(eventArr).then(function(){
				
			})
		},function(){

		})
	}
	_this.getPastLogs = function(){
		var topicAddress = Interface.Bridges.Metamask._lastWallet.split('')
		topicAddress.splice(2,0,'000000000000000000000000')
		topicAddress = topicAddress.join('')
		return Interface.Bridges.Websocket.web3.eth.getPastLogs({address:[Interface.Bridges.Metamask.contracts.LuckyStars.API.address],fromBlock:_this.fromBlock,topics:[
				_this.LogBuyEventHash,
				topicAddress
			]})
	}
	// 生命周期
	this.on('mount',function(){
		if(Interface.Bridges.Metamask.signedIn){
			_this.getRecord()
		}
	})
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
	overflow-x: hidden;
	overflow-y: auto;
}
.record-table .ui.grid {
	margin: 0;
}
</style>
</record>