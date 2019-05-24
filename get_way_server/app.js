//1:复制服务器端模块
//2:引入第三方模块
//  mysql/express/
const express = require("express");
const session=require("express-session");
const cors=require("cors");
// 2.1 引express-session组件
// 引入路由模块
const mysql=require("mysql");
const pool = mysql.createPool({
  host:"127.0.0.1",
  user:"root",
  password:"",
  database:"play"
});
//4:创建express对象
var server = express(); 
server.use(cors({
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true
}))
//5:绑定监听端口 3000
server.listen(3000);
// 项目中所有的图片都是放在服务器端
server.use(express.static("public"));
// 4.1 配置
server.use(session({
  secret:"128位字符串",   //配置加密的秘钥
  resave:true,          //每次请求是否更新数据
  saveUninitialized:true //保存初始化数据
}))
//6:处理用户登录请求
  //login GET
  server.get("/login",(req,res)=>{
    //6.1:获取参数
    var phone = req.query.phone;
    var pwd = req.query.pwd;
    //6.2:创sql
    var sql = "SELECT id,photo,uname,phone FROM play_user";
    sql+=" WHERE phone = ? AND pwd=md5(?)";
    //6.3:执行sql
    pool.query(sql,[phone,pwd],(err,result)=>{
       if(err)throw err;
       //6.4:获取返回结果
       //6.5:判断结果返回 登录成功或者失败
       if(result.length==0){
         res.send({code:-1,msg:"用户名或密码有误"});
       }else{
        //  将用户登录成功的凭据保存到session对象中
        // 获取uid
        var uid=result[0].id;
        var phone=result[0].phone;
        var uname=result[0].uname;
        var photo=result[0].photo;
        req.session.uid=uid;
        req.session.phone=phone;
        req.session.uname=uname;
        req.session.photo=photo;
        // 保存session对象中
         res.send({code:1,msg:"登录成功"})
       }
    })
  });
  // 获取登录后的用户名
  server.get("/getInfo",(req,res)=>{
    var uname=req.session.uname;
    var photo=req.session.photo;
    var arr={uname:uname,photo:photo}
    // console.log(photo);
    // console.log(uname);
    // console.log(arr);
    res.send(arr);
  })
  // 退出登录后清空session中的用户名
  server.get("/writeOff",(req,res)=>{
    req.session.uname="";
    req.session.photo="";
    var uname=req.session.uname;
    // console.log(uname);
    var photo=req.session.photo;
    // console.log(photo);
    var arr={uname:uname,photo:photo};
    res.send(arr);
  })
  // 用户注册
  server.get("/register",(req,res)=>{
    var phone=req.query.phone;
    var pwd=req.query.pwd;
    var uname="user_";
    var photo=[
      "http://127.0.0.1:3000/img/user/user_pic1.png",
      "http://127.0.0.1:3000/img/user/user_pic2.png",
      "http://127.0.0.1:3000/img/user/user_pic3.png",
      "http://127.0.0.1:3000/img/user/user_pic4.png",
      "http://127.0.0.1:3000/img/user/user_pic5.png",
      "http://127.0.0.1:3000/img/user/user_pic6.png",
      "http://127.0.0.1:3000/img/user/user_pic7.png",
      "http://127.0.0.1:3000/img/user/user_pic8.png",
      "http://127.0.0.1:3000/img/user/user_pic9.png",
    ];
    var pic=Math.floor(Math.random()*photo.length);
    pool.query("select id from play_user",(err,result)=>{
      if(err) throw err;
      var id=result.length;
      function randomString(len) {
        len = len || 32;
        var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
        var maxPos = $chars.length;
        var ss = '';
        for (i = 0; i < len; i++) {
        　ss += $chars.charAt(Math.floor(Math.random() * maxPos));
        }
        return ss;
      }
      var str= randomString(6);
      uname+=str;
      uname+=id;
      // console.log(uname);
      var sql="INSERT INTO play_user SET phone=?,pwd=md5(?),photo=?,uname=?";
      pool.query(sql,[phone,pwd,photo[pic],uname],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows==1){
          res.send({code:1,msg:"注册成功"});
        }else{
          res.send({code:-1,msg:"注册失败"});
        }
      });
    });
    })
  // 轮播图
  server.use("/getCarousel",(req,res)=>{
    var imgs=[
      {id:1,img:"http://127.0.0.1:3000/img/index/banner1.png"},
      {id:2,img:"http://127.0.0.1:3000/img/index/banner2.png"},
      {id:3,img:"http://127.0.0.1:3000/img/index/banner3.png"},
      {id:4,img:"http://127.0.0.1:3000/img/index/banner4.png"},
    ];
    res.send({code:1,data:imgs});
  });
  // 图标
    server.get("/iconList",(req,res)=>{
      var sql="SELECT id,title,img_url,src";
      sql+=" FROM play_icon";
      pool.query(sql,(err,result)=>{
        if(err) throw err
        res.send({code:1,data:result});
      })
    });
    // 每日更新
  server.use("/indexNewList",(req,res)=>{
    var sql="SELECT id,title,pic,price,src";
    sql+=" FROM index_new_update";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({code:1,data:result});
    })
  })
  // 游记心得
  server.get("/travelsList",(req,res)=>{
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    if(!pno){pno=1;}
    if(!pageSize){pageSize=6;}
    var sql="SELECT id,title,pic,user_pic,userName,praiseNum";
    sql+=" FROM index_travels_card LIMIT ?,?";
    var offset =(pno-1)*pageSize;
    paggeSize=parseInt(pageSize);
    pool.query(sql,[offset,pageSize],(err,result)=>{
      if(err) throw err
      res.send({code:1,data:result});
    })
  });
   // 搜索查询
   server.get("/searchList",(req,res)=>{
     // 1.参数
     // var pno=req.query.pno;
     // var pageSize=req.query.pageSize;
     var title=req.query.title;  //搜索关键字
    //  console.log(title);
     // if(!pno){pno=0}
     // if(!pageSize){pageSize=7}
     // 2.sql
     var sql=`SELECT sid,title,Etitle,subtitle FROM play_search WHERE title LIKE '%${title}%'`;
     // sql+=" LIMIT ?,?";
     // var offset=pno*pageSize;
     // pageSize=parseInt(pageSize);
     // 3.发送sql
     pool.query(sql,(err,result)=>{
       // ,offset,pageSize
       if(err) throw err;
        if(result.length>0){
          res.send({code:1,data:result})
          // console.log(result)
        }
         else{
           res.send({code:0,msg:"wu"})
          //  console.log(result)
        }
     });
     // 4.返回值
   })

  // video 轮播
  server.use("/videoCarousel",(req,res)=>{
    var imgs=[
      {id:1,img:"http://127.0.0.1:3000/img/video/01.jpg"},
      {id:2,img:"http://127.0.0.1:3000/img/video/02.jpg"},
      {id:3,img:"http://127.0.0.1:3000/img/video/03.jpg"},
      {id:4,img:"http://127.0.0.1:3000/img/video/04.jpg"},
    ];
    res.send({code:1,data:imgs});
  });
  // 分页
  server.get("/hotList",(req,res)=>{
		var output={
			count:0,
			pageSize:5,
			pageCount:0,
			pno:req.query.pno,
			data:[]
		};
    // pageSize 页大小
    // 为参数设置默认值
    if(!output.pno){
      var month=new Date().getMonth()+1;
      output.pno=month;
    }
    if(!output.pageSize){
      output.pageSize=5;
    }
  //1.1:创建变量保存发送给客户端数据
  // var obj={code:1};
  // 创建变量保存进度
  // var progress=0;
	// 2.创建一条SQL语句
	var ss="select id from play_pic";
	pool.query(ss,(err,result)=>{
		if(err) throw err;
		output.count=result.length;
		output.pageCount=
		Math.ceil(output.count/output.pageSize);
    // console.log(output.pageCount);
    // console.log(output.pno);
		var sql="select id,title,img_url";
		sql+=" from play_pic";
    sql+=" limit ?,?"
    var offset=output.pageSize*(output.pno-1);
		pool.query(sql,[offset,output.pageSize],(err,result)=>{
			if(err) throw err;
			output.data=result;
			res.send(output)
		});
	})
})

server.get("/getTheme",(req,res)=>{
  var sql="select id,title,img_url";
  sql+=" from play_theme";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
})

// 视频列表
server.get("/videoList",(req,res)=>{
    var option={
      food:[],
      travel:[],
      // world:[],
      qiyu:[]
    }
  var sql="select id,video_img,video_title,video_len,video_classify";
  sql+=" from play_video where video_classify='美食'";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      option.food=result;
  })
  var sql1="select id,video_img,video_title,video_len,video_classify";
  sql1+=" from play_video where video_classify='旅行'";
    pool.query(sql1,(err,result)=>{
      if(err) throw err;
      option.travel=result;
    })
  var sql2="select id,video_img,video_title,video_len,video_classify";
  sql2+=" from play_video where video_classify='世界'";
  pool.query(sql2,(err,result)=>{
    if(err) throw err;
      option.world=result;
      // res.send(option);
    })
  var sql3="select id,video_img,video_title,video_len,video_classify";
  sql3+=" from play_video where video_classify='奇遇'";
  pool.query(sql3,(err,result)=>{
    if (err) throw err;
      option.qiyu=result;
      res.send(option);
    })
    
  })
// 视频详情列表
server.get("/videoDetails",(req,res)=>{
  var id=req.query.id;
  var option={
    title:{},
    data:{}
  }
  if(id!==undefined){
    var sql1="select id,video_title from play_video where id=?";
    pool.query(sql1,[id],(err,result)=>{
      if(err) throw err;
      option.title=result;
      var sql2="select vid,video,video_subtitle,video_bg,video_icon,video_icon_title,video_icon_subtitle,video_id";
      sql2+=" from play_video_details where video_id=?"
      pool.query(sql2,[id],(err,result)=>{
        if(err) throw err;
        option.data=result;
        // console.log(result);
        var vid=result[0].vid;
        req.session.vid=vid;
        // console.log("aa:"+req.session.vid);
        res.send(option);
      })
    })
  }
})
// 评论区
server.get("/comments",(req,res)=>{
  var uname=req.session.uname;
  var photo=req.session.photo;
  var ctime=new Date();
  var year=ctime.getFullYear();
  var month=ctime.getMonth()+1;
  var date=ctime.getDate();
  var commentTime=`${year}-${month}-${date}`;
  var videoDetail_id=req.session.vid;
  // console.log("bb:"+videoDetail_id);
  var comment=req.query.comment;
  var sql="insert into play_comment set userName=?,usePhotos=?,commentTime=?,comment=?,videoDetail_id=?";
  pool.query(sql,[uname,photo,commentTime,comment,videoDetail_id],(err,result)=>{
    if(err) throw err
    if(result.affectedRows>0){
      res.send({code:1,msg:"插入成功"});
    }else{
      res.send({code:-1,msg:"失败"});
    }
  });
})
// 查询评论表
server.get("/getcomments",(req,res)=>{
  var videoDetail_id=req.session.vid;
  var sql="SELECT did,userName,usePhotos,commentTime,comment,videoDetail_id FROM play_comment WHERE videoDetail_id=? ORDER BY did DESC";
  pool.query(sql,[videoDetail_id],(err,result)=>{
    if(err) throw err
    res.send(result);
  });
});
server.get("/gettogether",(req,res)=>{
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  if(!pno){pno=1;}
  if(!pageSize){pageSize=6;}
  var sql="select id,img_url,title,userPic,lookcount,commentcount";
  sql+=" FROM play_together LIMIT ?,?";
  var offset =(pno-1)*pageSize;
  paggeSize=parseInt(pageSize);
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err) throw err
    res.send({code:1,data:result});
  })
});