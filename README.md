# Succulents
多肉植物

##制作首页App组件
1.完成header区域，使用的是Mint-UI中的Header组件
2.制作底部的Tabbar区域，使用的是Mint-UI的Tabber组件
3.要在中间区域放置一个 router-view 来展示路由匹配到的组件

##改造 mint-tab-item为 router-link 跳转路由

##点击 tabber中的路由链接，展示对应的路由组件

##制作首页轮播图布局
##加载首页轮播图数据

#改造六宫格的样式

#改造多肉养护 路由链接

#多肉养护 页面制作
1.绘制界面
#实现 多肉养护列表 点击跳转详情

1.把列表的每一项改造为router-link，同时，在跳转的时候应该提供唯一的id标识符
2.创建多肉养护的详情的组件页面 Liet_item.vue
3.在路由模块中， 将 多肉养护的详情 路由地址和组件页面对应起来

#实现 多肉养护的详情 的页面布局 和 数据渲染

#实现评论 的页面布局
1.先创建一个 单独的 comment.veu 组件模版
2.在需要使用 comment 组件的页面中，先手动导入comment 组件

#实现 用户注册功能
1.手机号必须验证格式
2.密码6-12位
3.提示错误信息

#修复bug
1.app.vue 中判断用户是否登录后再发送请求，carList

#添加notifications.vue account.vue 组件