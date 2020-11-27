<template>
  <div class="parent">
    <mt-header title="新用户注册" class="title">
      <router-link to="/me" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <!-- <router-link slot="right" to="/login">
        <mt-button>登录</mt-button>
      </router-link> -->
    </mt-header>
    <!-- 顶部导航结束 -->
    <!-- 表单区域开始 -->
    <div>
      <mt-field
        label="用 户 名："
        placeholder="请输入用户名"
        type="text"
        v-model="username"
        :state="usernameState"
        @blur.native.capture="checkUsername"
      >
      </mt-field>
      <mt-field
        label="密     码："
        placeholder="请输入密码"
        type="password"
        v-model="password"
        :state="passwordState"
        @blur.native.capture="checkPassword"
      >
      </mt-field>
      <mt-field
        label="确认密码："
        placeholder="请再次输入密码"
        type="password"
        v-model="conpassword"
        :state="conpasswordState"
        @blur.native.capture="checkConpassword"
      >
      </mt-field>
      <!-- 随机验证码开始 -->
       <div>
          <mt-field
              id="inputCode"
              label="验 证 码："
              placeholder="请输入验证码"
              type="text"
              v-model="verify"
              :state="verifyState"
              @blur.native.capture="checkVerify"
            >
          </mt-field>
      </div>
        <div onload="createCode()">	
            <div class="global">
              <div>
							  <div class="code" id="checkCode" ref="code" @click="createCode"></div>
						  </div>
              <div class="verify">
                <mt-button class="btns" type="primary" size="small" @click="createCode" style="background-color:#401f00;">看不清换一张</mt-button>
              </div>
		     	  </div>
        </div>
      <!-- 随机验证码结束 -->    
      <!-- *************** -->
      <div class="zhuce">
        <mt-button class="login" type="primary" size="large" @click="handle">
          免费注册
        </mt-button>
      </div>
    </div>
    <!-- 表单区域结束 -->
    <div style="font-size:12px;margin-top:20px;float:right;margin-right:20px" >
      已有账号？<router-link to="/login"><span style="color:bule;">请登录>></span></router-link>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      n:"",
      username: "",
      password: "",
      conpassword: "",
      code:"",
      verify:"",//动态验证码
      usernameState: "",
      passwordState: "",
      conpasswordState: "",
      verifyState:"",
    };
  },
  
  methods: {
    
    /*修改随机验证码样式*/ 
    createCode(){
				let code = "";
				let codeLength = 4; //验证码的长度
				let codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
					'x', 'y', 'z',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
					'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
				for (let i = 0; i < codeLength; i++) {
					let charNum = Math.floor(Math.random() * 52);
					code += codeChars[charNum];
				}
				if (checkCode) {
					checkCode.className = "code";
          this.$refs.code.innerHTML=code;
				}
    },
      // 随机验证码样式修改
      checkVerify(){
        if(this.verify.toUpperCase() == this.$refs.code.innerHTML.toUpperCase()){
          this.verifyState="success";
          return true;
        }else{
          this.verifyState="error";
          return false;
        }
      },
    //单击免费注册按钮时校验表单
    handle() {
      //会引发短路现象
      if ( this.checkUsername() 
        && this.checkPassword() 
        && this.checkConpassword() 
        && this.checkVerify()){
        //现在要发送相关的用户名、密码到WEB服务器
        let object = {
          username: this.username,
          password: this.password,
        };
        this.axios.post("/register", this.qs.stringify(object)).then((res) => {
          if (res.data.code == 1) {
            // 代表用户注册成功
            this.$router.push("/login");
          } else {
            // 弹出提示框
            this.$messagebox("提示信息", "用户名已经存在");
          }
        });
      }
    },
    //检测用户名
    checkUsername() {
      let username = this.username;
      let usernameReg = /^[0-9a-zA-Z]{6,10}$/;
      if (usernameReg.test(username)) {
        this.usernameState = "success";
        return true;
      } else {
        this.$toast({
          message: "用户名格式或内容错误",
          position: "top",
          duration: 5000,
        });
        this.usernameState = "error";
        //终止函数的执行
        return false;
      }
    },
    //检测密码
    checkPassword() {
      let password = this.password;
      let passwordReg = /^[0-9A-Za-z\.\-_]{6,12}$/;
      this.passwordState = "success";
      if (passwordReg.test(password)) {
        return true;
      } else {
        this.$toast({
          message: "密码错误",
          position: "middle",
          duration: 5000,
        });
        this.passwordState = "error";
        return false;
      }
    },
    //检测两次密码是否一致
    checkConpassword() {
      //校验两次密码是否一致
      let password = this.password;
      let conpassword = this.conpassword;
      if (password == conpassword) {
        this.conpasswordState = "success";
        return true;
      } else {
        this.$toast({
          message: "两次密码不一致",
          position: "middle",
          duration: 4000,
        });
        this.conpasswordState = "error";
        return false;
      }
    },
  },
  mounted(){
    this.createCode();
  }
};
</script>

<style scoped>
/* 随机验证码样式开始 */
 .code {

				/* background: url(code_bg.jpg); */
				font-family: Arial;
				font-style: italic;
				color: blue;
				font-size: 16px; 
				border: 0;
				padding: 2px 3px;
				letter-spacing: 3px;
				font-weight: bolder;
				float: left;
				cursor: pointer;
				width: 150px;
				text-align: center;
				vertical-align: middle;
			}

			a {
				text-decoration: none;
				font-size: 12px;
				/* color: #288bc4; */
			}
      div>#checkCode{
        border:1px solid #ccc; 
        height:30px;
        line-height:30px;
        margin-left: 50px;
        margin-bottom: 5px;
      }
			.verify>a:hover {
				text-decoration: underline;
			}
      .verify>.btns{
        width:100px;
        height:35px;
        font-size:12px;
        text-align: center;
        line-height: 32px;
        display: inline-block;
        
      }
      .global{
        margin-left:3.5rem;
      }
/* 随机验证码样式结束 */
.zhuce{
  margin-top: 30px;
}
div > .title {
  background-color: #401F00;
}
div > .login {
  background-color: #401F00;
}
</style>