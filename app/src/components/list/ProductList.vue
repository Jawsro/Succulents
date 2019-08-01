<template>
  <div class="ProductList-container">
      <!--产品轮播图-->
      <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    这是一个最简单的卡片视图控件；卡片视图常用来显示完整独立的一段信息，比如一篇文章的预览图、作者信息、点赞数量等
                </div>
            </div>
        </div>
    <!--产品购买-->
    <div class="mui-card">
        <div class="mui-card-header">页眉</div>
        <div class="mui-card-content">
            <div class="mui-card-content-inner">
                包含页眉页脚的卡片，页眉常用来显示面板标题，页脚用来显示额外信息或支持的操作（比如点赞、评论等）
            </div>
        </div>
        
    </div>
    <!--产品介绍-->
  </div>
</template>
<script>
export default {
  data(){
      return{
        id:this.$route.params.id,//将URL地址中传递过来的ID值，直接挂载在data上，方便以后调用
        ProductList:{}//产品的详情 的对象
      }
  },
  created(){
      this.getProductList()
  },
  methods:{
    getProductList(){
        var url="selProductList";
        var obj={id:this.id};
        this.axios.get(url,{params:obj}).then(result=>{
            console.log(result.data)
        })
    }
  },
}
</script>
<style scoped>
    .ProductList-container{
        background-color: #eee;
        overflow: hidden;
    }
</style>

