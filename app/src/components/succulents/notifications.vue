<template>
  <div>
      <div id="notifications" class="mui-page">
			<div class="mui-navbar-inner mui-bar mui-bar-nav">
				<button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" @click="goBack()">
					<span class="mui-icon mui-icon-left-nav"></span>设置
				</button>
				<h1 class="mui-center mui-title">新消息通知</h1>
			</div>
			<div class="mui-page-content">
				<div class="mui-scroll-wrapper">
					<div class="mui-scroll">
						<ul class="mui-table-view">
							<li class="mui-table-view-cell">
								<a>接收新消息通知<span class="mui-pull-right">已开启</span></a>
							</li>
						</ul>
						<ul class="mui-table-view">
							<li class="mui-table-view-cell">
								通知显示消息详情
								<div class="mui-switch mui-active mui-switch-mini">
									<div class="mui-switch-handle"></div>
								</div>
							</li>
						</ul>
						<div class="mui-content-padded">
							<p>若关闭，当收到新消息时，通知提示将不显示发信人和内容摘要</p>
						</div>

						<ul class="mui-table-view mui-table-view-chevron">
							<li class="mui-table-view-cell">
								<a href="#notifications_disturb" class="mui-navigate-right">功能消息免打扰</a>
							</li>
						</ul>
						<div class="mui-content-padded">
							<p>设置系统功能消息提示声音和震动的时段</p>
						</div>
						<ul class="mui-table-view">
							<li class="mui-table-view-cell">
								<a>接收新消息通知<span class="mui-pull-right">已开启</span></a>
							</li>
						</ul>
						<ul class="mui-table-view">
							<li class="mui-table-view-cell">
								声音
								<div class="mui-switch mui-active mui-switch-mini">
									<div class="mui-switch-handle"></div>
								</div>
							</li>
							<li class="mui-table-view-cell">
								震动
								<div class="mui-switch mui-active mui-switch-mini">
									<div class="mui-switch-handle"></div>
								</div>
							</li>
						</ul>
						<div class="mui-content-padded">
							<p>当HelloMUI在运行时，你可以设置是否需要声音或者震动</p>
						</div>
						<div></div>
					</div>
				</div>
			</div>
		</div>
		<!--<div id="notifications_disturb" class="mui-page">
			<div class="mui-navbar-inner mui-bar mui-bar-nav">
				<button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
					<span class="mui-icon mui-icon-left-nav"></span>新消息通知
				</button>
				<h1 class="mui-center mui-title">功能消息免打扰</h1>
			</div>
			<div class="mui-page-content">
				<div class="mui-scroll-wrapper">
					<div class="mui-scroll">
						<ul class="mui-table-view mui-table-view-radio">
							<li class="mui-table-view-cell">
								<a class="mui-navigate-right">开启</a>
							</li>
							<li class="mui-table-view-cell">
								<a class="mui-navigate-right">只在夜间开启</a>
							</li>
							<li class="mui-table-view-cell">
								<a class="mui-navigate-right">关闭</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>-->
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
