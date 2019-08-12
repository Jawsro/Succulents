<template>
  <div>
      <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media" v-for="item in list" :key="item.lid">
            <router-link :to="'/Home/List/Liet_item/'+item.lid">
                <img class="mui-media-object mui-pull-left" :src="'http://127.0.0.1:3000/'+item.img">
                <div class="mui-media-body">
                    <h1>{{item.title}}</h1>
                    <p class='mui-ellipsis'>{{item.synopsis}}</p>
                </div>
            </router-link>
        </li>
      </ul> 
  </div>
</template>
<script>
export default {
  data(){
      return{
        list:[]//多肉养护方法列表
      }
  },
  created(){
      this.getData()
  },
  methods:{
      getData(){console.log(111)
          this.axios.get("/selList").then(result=>{
            // console.log(result.data)
           this.list=result.data
          })
      }
  }
}
</script>  
<style scoped>
    h1{
        font-size: 16px;
    }
    .mui-table-view{
        overflow: auto;
        padding-bottom: 40px;
    }
</style>


