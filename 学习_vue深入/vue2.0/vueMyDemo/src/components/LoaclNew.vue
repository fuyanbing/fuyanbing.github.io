<template>
	<div id="home">
		<div class="content">
			<BannerView></BannerView>
			<div class="newsList">
				<ul>
					<li v-for="(item,index) in arrList">
						<router-link :to="'/article/'+item.id">
							<h2>{{index}}. {{item.title}}</h2>
							<p>{{item.detail}}</p>
						</router-link>
					</li>
				</ul>
			</div>
		</div>
	</div>
</template>
<script>
	import BannerView from './Banner.vue'
	export default {
		data() {
			return {
				arrList: []
			}
		},
		components: {
			BannerView
		},
		mounted() {
			//获取数据
			this.fetchData();
		},
		methods: {
			fetchData() {
				var _this = this;
				this.$http.get('src/data/index.data').then(function(res) {
					_this.arrList = res.data;
				}).catch(function(err) {
					console.log('Home', err);
				});
			}
		}
	}
</script>
<style type="text/css" scoped="scoped">
	.content .newsList {
		width: 6.4rem;
		margin: 0 auto;
	}
	.newsList ul {
		padding: 0 0.4rem;
	}
	.newsList ul li {
		color: #494d4d;
		padding: 0.2rem 0;
		border-bottom: 1px dashed #ccc;
	}
	.newsList ul li h2 {
		max-height: 0.9rem;
		font-size: 0.33rem;
		overflow: hidden;
	}
	.newsList ul li p {
		max-height: 1.8rem;
		margin-top: 0.05rem;
		overflow: hidden;
	}
</style>