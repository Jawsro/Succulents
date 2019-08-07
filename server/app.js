//1:引入第三方模块
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");
//2:配置第三方模块
 //2.1:配置连接池
 var pool = mysql.createPool({
   host:"127.0.0.1",
   user:"root",
   password:"",
   port:3306,
   database:"succulents",
   connectionLimit:15
 })
 //2.2:跨域
 var server = express();
 server.use(cors({
   origin:["http://127.0.0.1:8080",
   "http://localhost:8080"],
   credentials:true
 }))
 //2.3:session
 server.use(session({
   secret:"128位字符串",
   resave:true,
   saveUninitialized:true
 }))

//  2.9 指定静态目录
  server.use(express.static('public'))

 server.listen(3000);

// // 4 功能二  商品得分页显示
// server.get("/product",(req,res)=>{
//   // 1 参数
//   console.log(req.query);
//   var pno=req.query.pno;
//   var ps=req.query.pageSize;
//   // 2 设置默认值
//   if(!pno){pno=1}
//   if(!ps){ps=4}

//   $("input[type=button]")
//   // 3 创建二条sql语句执行
//   var obj={code:1,msg:'查询成功'};
//   var sql="select lid,title,img_url,price from xz_laptop limit ?,?";
//   var offset=(pno-1)*ps;
//   ps=parseInt(ps)
//   pool.query(sql,[offset,ps],(err,result)=>{
//     if(err) throw err;
//     console.log(obj);
//     obj.data=result;
//     var sql="select count(*) as c from xz_laptop";
//     pool.query(sql,(err,result)=>{
//       if(err) throw err;
//       var pc=Math.ceil(result[0].c/ps);
//       console.log(obj);
//       obj.pc=pc;
//       res.send(obj);
//     })
//   })

  // 4 返回值
// })

// 5:完成第三个功能
// 查询指定用户购物车列表
// server.get("/cart",(req,res)=>{
//   var uid=req.session.uid;
//   if(!uid){
//     res.send({code:-1,msg:"请登录"});
//     return;
//   }
//   var sql="select id,img_url,title,price,count from xz_cart where uid=?";
//   pool.query(sql,[uid],(err,result)=>{
//     if(err) throw err;
//     // console.log(result);
//     res.send({code:1,data:result});
//   })
// })

// server.get("/delItem",(req,res)=>{
//   var id=req.query.id;
//   var sql="delete from xz_cart where id=?";
//   pool.query(sql,[id],(err,result)=>{
//     if(err) throw err;
//     console.log(result);
//     if(result.affectedRows>0){
//       res.send({code:1,msg:"删除成功"})
//     }else{
//       res.send({code:-1,msg:"删除失败"})
//     }
//   })
// })
// 6.删除选中的多个商品
// server.get("/delAll",(req,res)=>{
//   console.log(req.query);  
//   console.log(req.query.ids);
//   var ids=req.query.ids;
//   var sql=`delete from xz_cart where id in (${ids})`;
//   pool.query(sql,(err,result)=>{
//     if(err) throw err;
//     if(result.affectedRows>0){
//       res.send({code:1,msg:'删除成功'});
//     }else{
//       res.send({code:-1,msg:'删除失败'})
//     }
//   })
// })
//1.多肉植物方法列表导入
server.get("/selList",(req,res)=>{
  var sql=`select * from list`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
     
      res.send(result);
      
    }else{
      res.send({code:-1,msg:'失败'})
    }
  })
})
//2. 查询多肉养护方法的内容
server.get("/selListItem",(req,res)=>{
  var l_id=req.query.id;console.log(l_id)
  var sql=`select * from list_item where l_id=?`;
  pool.query(sql,[l_id],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      console.log(111)
      
      res.send(result);
      
    }else{
      res.send("0")
    }
  })
})
//3.多肉植物方法列表导入
server.get("/selSucculent",(req,res)=>{
  var sql=`select * from succulent`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
     res.send(result);
     }else{
      res.send("0")
    }
  })
})
//4. 查询产品详情
server.get("/selProductList",(req,res)=>{
  var fid=req.query.id;console.log(fid)
  var sql=`select * from  succulent where fid=?`;
  pool.query(sql,[fid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      console.log(111)
      
      res.send(result);
      
    }else{
      res.send("0")
    }
  })
})
//4. 查询产品大 中 小 图片
server.get("/selProductListImg",(req,res)=>{
  var p_id=req.query.id;console.log(p_id)
  var sql=`select * from  succulent_img where p_id=?`;
  pool.query(sql,[p_id],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      console.log(111)
      
      res.send(result);
      
    }else{
      res.send("0")
    }
  })
})
//5. 用户注册功能
server.get("/logon",(req,res)=>{
  //1:参数
  var uphone = req.query.uphone;
  var upwd = req.query.upwd;
  
  //2.先查询该用户手机号是否已经注册
var sql1="select * from user where  uphone=?"
  pool.query(sql1,[uphone],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send("-1")//已经注册了，不能再注册
    }
    else{
     //可以注册，添加用户信息到数据库
     var sql2="insert into user values(?,?,?)";
     pool.query(sql2,[null,uphone,upwd],(err,result)=>{
       if(err)throw err;
       console.log(result)
       if(result.affectedRows=1){
         res.send("1")//注册成功
       }else{
         res.send("0")//注册失败
       }
     })
    }
  })
})
//6.用户登录功能
server.get("/login",(req,res)=>{
  //1:参数
  var uphone = req.query.uphone;
  var upwd = req.query.upwd; 
  var sql="select * from user where uphone=? and upwd=?";
  pool.query(sql,[uphone,upwd],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      req.session.uid=result[0].id;
     
      res.send(result)//登录成功
      
    }else{
      res.send("0")//登录失败
    }
  })
})
