<GraceTopHeader>
	<div class={ "graceTopHeader " + contentType } ref="domNode">
		<div class="content">
			{ content }
		</div>
	</div>
	<script>
		var _this = this
		var animate = require('animejs')
	// 属性
		_this.content = 'example text'
		_this.contentType = 'success'
		

	// 事件
	Interface.UI.on('inviteCodeCopied',function(){
		_this.showTopHeader($.i18n.map.inviteCodeCopied,'success')
	})
	Interface.UI.on('GraceError',function(err){
		_this.showTopHeader(err.toString(),'error')
	})
	Interface.UI.on('GraceWarning',function(err){
		_this.showTopHeader(err.toString(),'warning')
	})
	// 方法
	_this.showTopHeader = function(content,contentType){
		_this.content = content
		_this.contentType = contentType
		_this.animation.play()
		_this.animation.restart()	
	}

	// 生命周期
	this.on('mount',function(){
		_this.animation = animate.timeline({
			autoplay:false,
		}).add({
			targets:_this.refs.domNode,
			height:['0rem','3rem'],
			lineHeight:['0rem','3rem'],
			easing:'easeInOutQuad',
			duration:500,
			begin:function(){				
				_this.update()
			}
		}).add({
			targets:_this.refs.domNode,
			duration:2000
		}).add({
			targets:_this.refs.domNode,
			height:['3rem','0rem'],
			lineHeight:['3rem','0rem'],
			easing:'easeInOutQuad',
			duration:500,
			
		})
	})
</script>
<style>
.graceTopHeader {
	position: fixed;
	top: 82.6px;
	left: 0;
	height: 0rem;
	width: 100%;
	z-index: 10;
	overflow: hidden;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}
.graceTopHeader.success {
	background: #16ab39;
	box-shadow: 0 0 0 5px #16ab39 inset;
}
.graceTopHeader.warning {
	background: #eaae00;
	box-shadow: 0 0 0 5px #eaae00 inset;
}
.graceTopHeader.error {
	background: #d01919;
	box-shadow: 0 0 0 5px #d01919 inset;
}
.graceTopHeader .content {
	text-align: center;
	font-size: 1.25rem;
	white-space: nowrap;
	overflow-y: hidden;
	text-overflow: ellipsis;
	color: white;
	text-shadow: 
}
</style>
</GraceTopHeader>