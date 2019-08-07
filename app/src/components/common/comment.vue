<template>
  <!-- 评论组件-->
  <div class="cmt-contaniner">
      <h3>发表评论</h3>
      <hr>
      <textarea placeholder="请输入要评论的内容(200字以内)" maxlength="200"></textarea>
      <mt-button size="large" class="color">发表评论</mt-button>
      <!--评论区域-->
      <div class="cmt-list">
          <div class="cmt-item">
              <div class="cmt-title"> 
                  第1楼:&nbsp;&nbsp;用户:匿名用户&nbsp;&nbsp;
              </div>
              <div class="cmt-body">
                 122122     
             </div>
          </div>
      </div>
  </div>
</template>
<style scoped>
.cmt-list{
    margin: 5px 0; 
}
.cmt-list .cmt-item{
    font-size: 13px;
    color:#000
}
.cmt-list .cmt-item .cmt-title{
    background-color: #e5e4e4;
    
    line-height: 30px;
    
}
.cmt-list .cmt-item .cmt-body{
    line-height: 35px;
    text-indent: 2em;
}
.cmt-contaniner h3{
    font-size: 16px;
}
.cmt-contaniner textarea{
    font-size: 14px;
    height: 85px;
    margin: 0
}
.mint-button.color{
    background-color: #e89abe;
    color:#fff;
    font-weight: 600;
    font-size: 20px;

}
</style>
