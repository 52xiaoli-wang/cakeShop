//加载express模块
const express=require('express');
//加载cors模块
const cors=require('cors');
//加载MD5模块
const md5 = require('md5');
//加载body-parser模块
const bodyParser=require('body-parser');
//加载MySQL模块
const mysql=require('mysql');
//创建MySQL的连接池
const pool=mysql.createPool({
  //数据库服务器的地址
  host:'127.0.0.1',
  //数据库服务器的端口号
  port:3306,
  //数据库用户的用户名
  user:'root',
  //数据库用户的密码
  password:'',
  //数据库名称
  database:'CakeShop',
  //编码方式
  charset:'utf8',
  //最大连接数
  connectionLimit:20
})
//创建web服务器实例
const server=express();
//将cors作为server的中间件
server.use(cors({
  origin:['http://localhost:8080','http://127.0.0.1:8080']
}));
//将body-parser作为server的中间件
server.use(bodyParser.urlencoded({
  extended:false
}));

// 用户注册
server.post('/register',(req,res)=>{
  // 获取用户名和密码
  let username=req.body.username;
  let password=req.body.password;
  // console.log(userName,password);
  //查找用户是否存在  
  let sql='SELECT COUNT(id) AS count FROM user WHERE username=?';
  pool.query(sql,[username],(error,results)=>{
    if(error) throw error;
    // 如果用户不存才，则插入记录
    if(results[0].count==0){
      // console.log('用户注册成功');
      sql='INSERT INTO user(username,password) VALUES(?,MD5(?))';
      pool.query(sql,[username,password],(error,results)=>{
        if(error) throw error;
        res.send({message:'注册成功',code:1});
      })
    }else{//否则产生和里的错误提示
       res.send({message:'用户已经存在，注册失败',code:0});
    }
  })
});

//修改头像
server.post('/avatar',(req,res)=>{
  let avatar=req.body.avatar;
  let username=req.body.username;
  let sql='update user set avatar=? where username=?';
  pool.query(sql,[avatar,username],(error,results)=>{
    if(error) throw error;
    if(results.affectedRows===0){
			res.send({code:0,message:'修改失败'})
		}else{
			res.send({code:1,message:'修改成功'})
		}
  });
});

// 用户反馈的接口
server.post('/feedback',(req,res)=>{
  //获取反馈类型，邮箱，手机号和内容
  let type=req.body.type;
  let email=req.body.email;
  let phone=req.body.phone;
  let content=req.body.content;
  let sql='insert into feedback(feedback_type,email,phone,content) value(?,?,?,?)';
  pool.query(sql,[type,email,phone,content],(error,results)=>{
    if(error) throw error;
    console.log(results);
    if(results.affectedRows===0){
			res.send({code:0})
		}else{
			res.send({code:1})
		}
  })
});

//用户登录接口
server.post("/login",(req,res)=>{
  let username=req.body.username;
  let password=req.body.password;
  let sql = 'SELECT id,username,avatar,name FROM user WHERE username=? AND password=MD5(?)';
  pool.query(sql,[username,password],(error,results)=>{
    if(error) throw error;
    // console.log(results);
    if(results.length==0){
      res.send({message:'登录失败',code:0});
    }else{
      res.send({message:'登录成功',code:1,userInfo:results[0]});
    }
  })
});

//获取详情页的信息(包括头像，价格，详情信息)
server.get('/details',(req,res)=>{
  //获取URL地址栏的参数
let id=req.query.id;
// console.log(id);
//SQL语句查询
let sql='SELECT r.id,cake_name,cake_newPrice,cake_oldPrice,cake_number,cake_materials,cake_thumbnail,cake_lunImage,cake_detailsImage FROM cake_goods  AS r INNER JOIN cake_type AS u ON type_id = u.id WHERE r.id=?';
// let sql='SELECT cakename FROM cake_goods';
// 执行SQL语句
pool.query(sql,[id],(error,results)=>{
  if(error) throw error;
  res.send({message:'查询成功',code:1,articleInfo:results[0]});
});
});

server.get('/products', (req, res) => {

  let sql = "SELECT id,cake_thumbnail,cake_name,cake_newPrice  FROM cake_goods ";
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: '查询成功', code: 1, results: results })
  })
});

server.get('/lists', (req, res) => {
  let sql = "SELECT id,type_name,type_avatar FROM cake_type ";
  pool.query(sql, (error, results) => {
  if (error) throw error;
  res.send({ message: '查询成功', code: 1, results: results })
  })
});

server.get("/number", (req, res) => {
  let obj = req.query;
  let num = obj.id;
  if ((num == 10)) {
    let sql =
    "SELECT id,cake_thumbnail,cake_name,cake_newPrice  FROM cake_goods  ";
    pool.query(sql, [num], (error, results) => {
      if (error) throw error;
      res.send({ message: "查询成功", code: 1, results: results });
    });
  } else {
    let sql =
      "select id,cake_name,cake_oldPrice,cake_thumbnail,cake_newPrice FROM cake_goods where type_id=?";
    pool.query(sql, [num], (error, results) => {
      if (error) throw error;
      res.send({ message: "查询成功", code: 1, results: results });
    });
  }
});
//添加到购物车
server.get('/addCart',(req,res)=>{
  var id = parseInt(req.param('id'));
  var n = parseInt(req.param('n'));
  var m = req.param('m');
  console.log(m);
  if(pool){
    var sql = `select * from cake_goods where id=${id}`;
    pool.query(sql,(error,results)=>{
      if(error){
        throw error
      }else{
        // let userId= req.cookies.
        let proId = results[0].id;
        console.log(proId);
        let proName = results[0].cake_name;
        let proPrice = results[0].cake_newPrice;
        let checked = '1';
        let proSize = m;
        console.log(proSize);
        let proImg = results[0].cake_thumbnail;
        let totalMoney = proPrice*n;
        let sql = `select * from shoppingCart where cake_goods_id=${proId}`;
        pool.query(sql,(error,results)=>{
          if(error){
            throw error
          }else{
            if(results.length===0){
              let sql = `insert into shoppingCart(id,cake_goods_id,cake_name,cake_newPrice,checked,cake_num,cake_size,cake_thumbnail,totalPrice) values(NULL,'${proId}','${proName}','${proPrice}','${checked}','${n}','${proSize}','${proImg}','${totalMoney}')`;
              pool.query(sql,(error,results)=>{
                if (error) throw error;
                res.send({ message: '添加购物车成功', status: '1', results: results })
              })
            }
          }
        })
      }
    })
  }
});
//请求购物车列表
server.get('/shopping', (req, res) => {
  let sql = "SELECT * FROM shoppingcart ";
  pool.query(sql, (error, results) => {
  if (error) throw error;
  res.send({ message: '查询成功', code: 1, results: results })
  })
});
//
server.get('/ProductNum',(req,res)=>{
  let sql = "SELECT * FROM shoppingcart ";
  pool.query(sql, (error, results) => {
  if (error) throw error;
  res.send({ message: '查询成功', code: 1, results: results })
  })
})

server.get('/goods', (req, res) => {
  let sql = "SELECT id,cake_thumbnail,cake_name,cake_newPrice  FROM cake_goods where id<=6 ";
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: '查询成功', code: 1, results: results })
  })
  });  
  server.get('/good2', (req, res) => {
    let sql = "SELECT id,cake_thumbnail,cake_name,cake_newPrice,cake_oldPrice  FROM cake_goods where id>18 ";
    pool.query(sql, (error, results) => {
      if (error) throw error;
      res.send({ message: '查询成功', code: 1, results: results })
    })
    }); 





//来指定web服务器监听的端口
server.listen(3000);