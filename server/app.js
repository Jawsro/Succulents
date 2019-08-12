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
  var l_id=req.query.id;//console.log(l_id)
  var sql=`select * from list_item where l_id=?`;
  pool.query(sql,[l_id],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      //console.log(111)
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
  var fid=req.query.id;//console.log(fid)
  var sql=`select * from  succulent where fid=?`;
  pool.query(sql,[fid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      //console.log(111)
      res.send(result);
    }else{
      res.send("0")
    }
  })
})
//4. 查询产品大 中 小 图片
server.get("/selProductListImg",(req,res)=>{
  var p_id=req.query.id;//console.log(p_id)
  var sql=`select * from  succulent_img where p_id=?`;
  pool.query(sql,[p_id],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      //console.log(111)
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
//7.产品加入购物车
server.get("/insertShopcar",(req,res)=>{
  //1:参数
  var s_uid = req.query.s_uid;console.log(s_uid);
  var s_pid = req.query.s_pid; 
  var s_img = req.query.s_img;
  var s_title = req.query.s_title;
  var s_price = req.query.s_price;
  var s_count = req.query.s_count;
  //先判断该用户下的购物车是否已经有该产品
  var sql1="select * from shopping_car where s_uid=? and s_pid=?";
  pool.query(sql1,[s_uid,s_pid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){//如果有，修改该产品的件数
        // console.log(result,$s_count);   
        var n=parseInt(result[0].s_count)+parseInt(s_count);
        var sql2=`update shopping_car set s_count=? where s_pid=?`
        pool.query(sql2,[n,s_pid],function(err,result){
          if(err) throw err;
          res.send('1')
        })
      }else{//如果没有，添加至购物车
         var sql="insert into shopping_car values(?,?,?,?,?,?,?)";
          pool.query(sql,[null,s_uid,s_pid,s_img,s_title,s_price,s_count],(err,result)=>{
          if(err) throw err;
          if(result.length>0){
            console.log(result)
            res.send("1")//添加成功
          }else{
            res.send("0")//添加失败
          }
        })
      }
  })
})
//8.查询用户购物车导入购物车页面
server.get("/selShopCar",(req,res)=>{
  var s_uid=req.query.s_uid;
  var sql="select * from shopping_car where s_uid=?";
  pool.query(sql,[s_uid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      console.log(result)
      res.send(result);
    }else{
      res.send("0")
    }
  })
})
// 9.删除选中的商品
server.get("/deleteCar",(req,res)=>{
  var s_pid=req.query.s_pid;
  var s_uid=req.query.s_uid;
  var sql=`delete from shopping_car where s_pid=? and s_uid=?`;
  pool.query(sql,[s_pid,s_uid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send("1");//删除成功
    }else{
      res.send("0");//删除失败
    }
  })
})
//10.修改已存在的商品的数据
server.get("/updateCarCount",(req,res)=>{
  var s_pid=req.query.s_pid;
  var s_uid=req.query.s_uid;
  var s_count=req.query.s_count;
  var sql=`update shopping_car set s_count=? where s_pid=? and s_uid=?`;
  pool.query(sql,[s_count,s_pid,s_uid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      console.log(result)
      res.send("1");//修改成功
    }else{
      res.send("0");//修改失败
    }
  })
})