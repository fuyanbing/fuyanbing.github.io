<template>
	<div id="app">
		<!-- 标准的按钮 -->
		<button type="button" class="btn btn-default">默认按钮</button>
		<!-- 提供额外的视觉效果，标识一组按钮中的原始动作 -->
		<button type="button" class="btn btn-primary">原始按钮</button>
		<!-- 表示一个成功的或积极的动作 -->
		<button type="button" class="btn btn-success">成功按钮</button>
		<!-- 信息警告消息的上下文按钮 -->
		<button type="button" class="btn btn-info">信息按钮</button>
		<!-- 表示应谨慎采取的动作 -->
		<button type="button" class="btn btn-warning">警告按钮</button>
		<!-- 表示一个危险的或潜在的负面动作 -->
		<button type="button" class="btn btn-danger">危险按钮</button>
		<!-- 并不强调是一个按钮，看起来像一个链接，但同时保持按钮的行为 -->
		<button type="button" class="btn btn-link">链接按钮</button>
		
		<div class="dropdown">
			<button type="button" class="btn dropdown-toggle" id="dropdownMenu1" 
					data-toggle="dropdown">
				主题
				<span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				<li role="presentation">
					<a role="menuitem" tabindex="-1" href="#">Java</a>
				</li>
				<li role="presentation">
					<a role="menuitem" tabindex="-1" href="#">数据挖掘</a>
				</li>
				<li role="presentation">
					<a role="menuitem" tabindex="-1" href="#">数据通信/网络</a>
				</li>
				<li role="presentation" class="divider"></li>
				<li role="presentation">
					<a role="menuitem" tabindex="-1" href="#">分离的链接</a>
				</li>
			</ul>
		</div>
		
		
		<ul class="pagination">
			<li><a href="#">&laquo;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
</template>

<script>
</script>

<style>
</style>