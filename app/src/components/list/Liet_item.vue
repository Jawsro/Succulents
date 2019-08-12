<template>
  <div class="mui-content">
    <div class="mui-content-padded">
        <h1>{{ LietItem[0].title}}</h1>
        <p>{{ LietItem[0].content1}}</p>
        <p>
            <img :src="'http://127.0.0.1:3000/'+LietItem[0].img1" data-preview-src="" data-preview-group="1" />
        </p>
        <p>{{ LietItem[0].content2}}</p>
        <p>
            <img :src="'http://127.0.0.1:3000/'+LietItem[0].img2" data-preview-src="" data-preview-group="1" />
        </p>
        <p>{{ LietItem[0].content3}}</p>
        <p>
            <img :src="'http://127.0.0.1:3000/'+LietItem[0].img3" data-preview-src="" data-preview-group="1" />
        </p>
        <p>{{ LietItem[0].content4}}</p>
        <p>
            <img :src="'http://127.0.0.1:3000/'+LietItem[0].img4" data-preview-src="" data-preview-group="1" />
        </p>
    </div>
  </div>
</template>
<script>
export default {
  data(){
      return {
          id: this.$route.params.id,//将URL地址中传递过来的ID值，直接挂载在data上，方便以后调用
          LietItem:{}//多肉养护的详情 的对象
    }
  },
  created(){
    this.getLietItem()
  },
  methods:{
      getLietItem(){//获取 多肉养护的详情
          var url="selListItem";
          var obj={id:this.id}
        this.axios.get(url,{params:obj}).then(result=>{
            console.log(result.data)
            this.LietItem=result.data
        })
      }
  },
}
</script>
<style scoped>
    h1{
        
        text-align: center;
        font-size: 20px;
        
    }
    img{
        width:100%;
        height: 300px;
    }
    .mui-content{
        overflow:auto;
        background-color: #fff;
    }
</style>
