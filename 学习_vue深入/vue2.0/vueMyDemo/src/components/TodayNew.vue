<template>
	<div id="home">
		<div class="content">
			<!--<BannerView></BannerView>-->
			<div class="newsList">
				<ul>
					<li v-for="item in arrList">
						<router-link :to="'/newsDetails'+item.source_url">
							<div class="item_detail">
								<div id="imgbox" v-show="item.image_url">
									<img :src="item.image_url" /> </div>
								<div class="dotdot line3">{{item.title}}</div>
								<div class="list_image" v-show="item.image_list.length>0">
									<img v-for="img in item.image_list" :src='img.url' /> </div>
								<div class="item_info">
									<span class="hot_label space" v-show="item.label">{{item.label}}</span>
									<span class="src space">{{item.media_name}}</span>
									<span class="cmt space">
										评论{{item.comment_count}}
									</span>
									<span class="time" title="2017-10-22 19:33">6分钟前</span>
									<span data-id="6479626498374353166" class="dislike-news fr"></span>
								</div>
							</div>
						</router-link>
					</li>
				</ul>
			</div>
		</div>
	</div>
</template>
<script>
	import BannerView from './Banner.vue'
	var jsonp = require('jsonp')
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
			/*fetchData() {
				var _this = this;
				this.$http.get('src/data/todaynew.json').then(function(res) {
					console.log(res.data.data);
					_this.arrList = res.data.data;
				}).catch(function(err) {
					console.log('Home', err);
				});
			}*/
			fetchData() {
				var _this = this;
				jsonp('https://m.toutiao.com/list/?tag=__all__&ac=wap&count=20&format=json_raw&as=A135A96EEC6579F',null,function (err,data) {
					if (err) {
						console.log(err.message)
					} else{
						console.log(data.data)
						_this.arrList = data.data;
					}
				})
			}
		}
	}
</script>
<style type="text/css">
	.dotdot {
		color: #222;
		font-size: 16px;
		position: relative;
		padding-top: 4px;
		padding-bottom: 5px;
	}
	.hot_label{
		color: red;
	}
	.item_detail {
		overflow: hidden;
	}
	.list_image{
		overflow: hidden;
		margin-bottom: 5px;
	}
	.newsList ul {
		padding: 50px 10px;
	}
	#imgbox {
		width: 32%;
		overflow: hidden;
		float: right;
	}
	#imgbox img {
		width: 100%;
	}
	.list_image img {
		display: block;
		float: left;
		width: 32%;
	}
	.list_image img:nth-child(2) {
		margin: 0 2%;
	}
	.newsList ul li:after {
		content: '';
		display: block;
		height: 0;
		clear: both;
		visibility: hidden;
	}
	.newsList ul li {
		position: relative;
		border-bottom: 1px solid rgba(221, 221, 221, 0.6);
		padding: 10px 0;
	}
	.newsList ul li a{
		overflow: hidden;
		width: 100%;
		box-sizing: border-box;
		display: block;
	}
	.item_info{
		color: #999;
	}
</style>