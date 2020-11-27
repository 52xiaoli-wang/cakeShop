<template>
  <div class="login">
    <div class="rgba">
      <mt-header title="用户登录">
        <!-- <div slot="left"> -->
          <router-link slot="left" to="/me">
            <mt-button icon="back" id="back"></mt-button>
          </router-link>
        <!-- </div> -->
        <!-- <div slot="right">注册</div> -->
      </mt-header>
      <div class="header_img">
        <img src="../assets/me/fsper.png">
      </div>
      <!-- 用户名输入 -->
      <div class="content">
        <ul>
          <li>
            <img src="../assets/me/用户.png" alt="">
            <input type="text" placeholder="用户名" v-model="username" autofocus>
          </li>
          <li>
            <img src="../assets/me/密码.png" alt="">
            <input type="password" placeholder="密码" v-model="password" >
          </li>
        </ul>
      </div>
      <div class="btn">
        <mt-button type="danger" size="large" @click="btn">登录</mt-button>
      </div>
      <div style="font-size:12px;margin-top:15px;float:right;margin-right:20px;" >
        <router-link to="/register">免费注册>></router-link>
      </div>
      <div class="methods">
        <ul>
          <li>
            <img src="../assets/me/qq.jpg" alt="">
            <p>QQ登录</p>
          </li>
          <li>
            <img src="../assets/me/weixin.jpg" alt="">
            <p>微信登录</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
      username:'',
      password:'',
    }
  },
  methods:{
    uname(){
      let unameReg=/^[0-9a-zA-Z]{6,10}$/;
      if(unameReg.test(this.username)){
        return true;
      }else{
        return false;
      } 
    },
    upwd(){
      let upwdReg = /^\w{6,12}$/;
      if(upwdReg.test(this.password)){
        return true;
      }else{
        return false;
      }
    },
    btn(){
      //会引发短路现象
      if(this.uname() && this.upwd()){
        let str = 'username=' + this.username + '&password=' + this.password;
        this.$store.dispatch("login_actions",str);
        this.username='';
        this.password='';
      }
    }
  },
  mouted:{
  }
}
</script>
<style scoped>
.login{
  background: url('../assets/background/1.jpg') center no-repeat;
  background-size: cover;
  position: relative;
  height: 41.75rem;
}
.rgba{
  background: rgba(0,0,0,0.7);
}
a{
  color: #fff;
}
.mint-header {
 background-color: #401f00;
 font-size: 1rem;
}
/* 登录按钮设置 */
.btn>.mint-button{
  margin: 0.5rem auto;
  width: 80%;
  border-radius: 0.75rem;
  background: #401f00;
}
/* 头像设置 */
.header_img{
  text-align: center;
  padding: 60px 0 30px 0;
}
.header_img>img{
  width: 6rem;
  height: 6rem;
  box-shadow: 0px 0px 10px #aaa;
  border-radius: 50%;
}
.content>ul{
  margin: 0 auto;
  width: 65%;
}
.content>ul>li{
  width: 100%;
  display: flex;
  justify-content: space-between;
  padding: 5px;
}
.content>ul>li>img{
  width: 2.75rem;
  height: 2.75rem;
}
.content>ul>li>input{
  width: 70%;
  height: 2rem;
  line-height: 2rem;
  border: 0;
  background: transparent;
  border-bottom: 2px solid #000;
  font-size: 1rem;
  color: #fff;
  padding: 0 0.5rem;
}

.methods{
  margin-top: 12rem;
  padding-bottom: 2rem;
  color: #eee;
}
.methods>ul{
  display: flex;
  justify-content: space-around;
  margin-top: 40px;
}
.methods>ul>li{
  width: 70px;
  height: 60px;
  text-align: center;
}
.methods>ul>li>img{
  width: 40px;
  height: 40px;
  border-radius: 50%;
}
.methods>ul>li>p{
  font-family:sans-serif;
  padding-top: 0.5rem;
}
</style>