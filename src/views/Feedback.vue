<template>
  <div>
    <mt-header id="header" title="意见反馈">
      <div slot="left">
        <router-link to="/me">
          <mt-button icon="back"></mt-button>
        </router-link>
      </div>
    </mt-header>
    <div class="fb">
      <div>
        <p>反馈类型:</p>
        <ul>
          <li :class="i==num?active:''" v-for="(elem,i) of types" @click="btn(i)" :key="i">{{elem}}</li>
        </ul>
      </div>
      <mt-field label="邮箱："
      placeholder="选填，以便反馈结果告知您"
      @blur.native.capture="e"
      :state="eState"
      v-model="email">
      </mt-field>
      <mt-field label="手机："
      placeholder="选填，以便反馈结果告知您"
      @blur.native.capture="p"
      :state="pState"
      v-model="phone">
      </mt-field>
      <mt-field label="描述："
      placeholder="必填，请填写反馈内容"
      @blur.native.capture="c"
      :state="cState"
      v-model="content">
      </mt-field>
      <mt-button type="danger" size="large" @click="ok">确定</mt-button>
    </div>
  </div>
</template>
<style scoped>
#header {
  background-color: #401f00;
  font-size: 16px;
}
/* .mint-header{
  background: #fff;
  color: #888;
  font-size: 17px;
} */
.fb>div:first-child>p{
  padding: 20px 0;
}
.fb>div:first-child>ul{
  display: flex;
  flex-flow: row wrap;
  margin-bottom: 20px;
}
.fb>div:first-child>ul>li{
  flex: 1 0 33.33%;
  border-radius: 20px;
  background: #ddd;
  text-align: center;
  line-height: 30px;
  margin: 5px;
}
.fb>div:first-child>ul>li.active{
  background: #401f00;
  color: #fff;
}
.fb>.mint-button{
  height: 30px;
  background: rgb(173, 7, 7);
  width: 80%;
  border-radius: 10px;
  margin: 10px auto;
}
</style>
<script>
export default {
  data(){
    return{
      i:0,
      num:0,
      email:"",
      eState:"",
      phone:"",
      pState:"",
      content:"",
      cState:"",
      types:["产品","投诉","询问","售后","求购","其他"],
      active:{active:true}
    }
  },
  methods:{
    btn(num){
      this.num=num;
    },
    e(){
      let checkEmail=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})/;
      if(checkEmail.test(this.email)){
        this.eState="success"
      }else{
        this.eState="error"
        this.$toast("邮箱格式错误");
      }
    },
    p(){
      let checkPhone=/^1[3-9][0-9]{9}$/;
      if(checkPhone.test(this.phone)){
        this.pState="success"
      }else{
        this.pState="error"
        this.$toast("手机号格式错误");
      }
    },
    c(){
      if(this.content!==""){
        this.cState="success"
      }else{
        this.cState="error"
        this.$toast("内容不能为空");
      }
    },
    ok(){
      this.axios.post("/feedback",`type=${this.types[this.num]}&email=${this.email}&phone=${this.phone}&content=${this.content}`).then(res=>{
        //如果用户反馈成功
        if(res.data.code == 1){
          this.email="",
          this.phone="",
          this.content="",
          this.$messagebox("提示信息","感谢您的反馈,我们会努力改进。");
        }
      });
    }
  }
}
</script>