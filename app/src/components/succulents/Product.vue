<template>
  <div>
    <ul class="mui-table-view mui-grid-view">
      <li class="mui-table-view-cell mui-media mui-col-xs-6" v-for="item in productList" :key="item.fid">
          <router-link :to="'/Product/ProductList/'+item.fid">
              <img class="mui-media-object" :src="'http://127.0.0.1:3000/'+item.img">
              <div class="mui-media-body s_title">{{item.s_title}}</div>
              <div class="mui-media-body price">{{item.price.toFixed(2)}}</div>
          </router-link>
        </li> 
      
		  </ul>    
  </div>
</template>
<script>
export default {
  data(){
    return{ 
      productList:[]
    }
  },
  created(){
    this.axios.get("/selSucculent").then(result=>{
        console.log(result.data)
        this. productList=result.data
      })
  },
}
</script>
<style>
  .mui-table-view.mui-grid-view .mui-table-view-cell img.mui-media-object{
     width:160px;
     height: 160px;
    }
   .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body.s_title{
     color: #0d0d0d;
     font-size: 16px;
   }
   .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body.price{
      font-style: italic;
      color: #e89abe
    }
</style>

