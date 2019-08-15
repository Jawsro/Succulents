<template>
  <div>
      <!--***账户安全设置****-->
      <div id="account" class="mui-page">
			<div class="mui-navbar-inner mui-bar mui-bar-nav">
				<button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" @click="goBack()">
					<span class="mui-icon mui-icon-left-nav"></span>设置
				</button>
				<h1 class="mui-center mui-title">账号与安全</h1>
			</div>
			<div class="mui-page-content">
				<div class="mui-scroll-wrapper">
					<div class="mui-scroll">
						<ul class="mui-table-view">
							<li class="mui-table-view-cell">
								<a id="head" class="mui-navigate-right">头像
								<span class="mui-pull-right head">
									<img class="head-img mui-action-preview" id="head-img1" src=""/>
								</span>
							</a>
							</li>
							<li class="mui-table-view-cell">
								<a>姓名<span class="mui-pull-right">diudiu</span></a>
							</li>
							<li class="mui-table-view-cell">
								<a>diudiu账号<span class="mui-pull-right">diudiu@dcloud.io</span></a>
							</li>
						</ul>
						<ul class="mui-table-view">
							<li class="mui-table-view-cell">
								<a>QQ号<span class="mui-pull-right">88888888</span></a>
							</li>
							<li class="mui-table-view-cell">
								<a>手机号<span class="mui-pull-right">18601234567</span></a>
							</li>
							<li class="mui-table-view-cell">
								<a>邮箱地址<span class="mui-pull-right">diudiu@dcloud.io</span></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
  </div>
</template>
<script>
export default {
  data(){
	  return{

	  }
  },
  methods:{
      goBack(){
          this.$router.go(-1)
      }
  }
}
</script>
