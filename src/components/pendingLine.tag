<pending-line>
	<div class={ "pending-line "+opts.no }>
		<div class="stroke"></div>
	</div>
	<script>
		const anime = require('animejs')
		var _this = this
	// 属性
	

	// 事件
	

	// 方法
	

	// 生命周期
	this.on('mount',function(){
		anime.timeline({
			direction: 'alternate',
			loop: true,
			delay:Math.random()*450
		}).add({
			targets:'.pending-line.'+ _this.opts.no+' .stroke',
			height:['10%','90%'],
			easing:'easeInOutQuad',
			direction: 'alternate',
			duration:450,
			
		})
	})
</script>
<style>
.pending-line {
	position: relative;
	display: inline-block;
	height: 2em;
	width: 5px;
	background: #646379;
	float: left;
	margin: 0 .35rem;
}
.pending-line .stroke {
	position: absolute;
	width: 100%;
	bottom: 0;
	height: 0;
	left: 0;
	background: #04e3d2;
}
</style>
</pending-line>