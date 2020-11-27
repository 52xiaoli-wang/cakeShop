<template>
  <div>
    <mt-header id="header" title="我的订单">
      <div slot="left">
        <router-link to="/me">
          <mt-button icon="back"></mt-button>
        </router-link>
      </div>
    </mt-header>
    <!-- 顶部选项卡开始 -->
    <mt-navbar v-model="active">
      <mt-tab-item v-for="(elem,i) of category" :id="(i+1).toString()" :key="i">{{elem}}</mt-tab-item>
    </mt-navbar>
    <!-- 顶部选项卡结束 -->
    <!-- 面板开始 -->
    <mt-tab-container v-model="active">
      <mt-tab-container-item id="1"></mt-tab-container-item>
      <mt-tab-container-item id="2"></mt-tab-container-item>
      <mt-tab-container-item id="3"></mt-tab-container-item>
      <mt-tab-container-item id="4">
        <ul class="eval">
          <li>
            <span>物流评价:</span>
            <div @click="btn1">
              <van-rate v-model="value1"  
              :size="25"
              color="#ffd21e"
              void-icon="star"
              void-color="#eee"
              />
            </div>
            <p v-text="value1==5?'非常满意':value1==4?'满意':value1==3?'一般'
            :value1==2?'差':'非常差'" v-show="show1"></p>
          </li>
          <li>
            <span>商品评价:</span>
            <div @click="btn2">
              <van-rate v-model="value2"  
              :size="25"
              color="#ffd21e"
              void-icon="star"
              void-color="#eee"
              />
            </div>
            <p v-text="value2==5?'非常满意':value2==4?'满意':value2==3?'一般'
            :value2==2?'差':'非常差'" v-show="show2"></p>
          </li>
          <li>
            <span>商品评价:</span>
            <div @click="btn3">
              <van-rate v-model="value3"  
              :size="25"
              color="#ffd21e"
              void-icon="star"
              void-color="#eee"
              />
            </div>
            <p v-text="value3==5?'非常满意':value3==4?'满意':value3==3?'一般'
            :value3==2?'差':'非常差'" v-show="show3"></p>
          </li>
        </ul>
        <!-- 评价 -->
        <van-field
          v-model="message"
          rows="2"
          autosize
          label="留言:"
          type="textarea"
          maxlength="50"
          placeholder="请输入留言"
          show-word-limit
        />
        <!-- 提交 -->
        <div>
          <mt-button type="danger" size="large" @click="btn">评价提交</mt-button>
        </div>
      </mt-tab-container-item>
    </mt-tab-container>
    <!-- 面板结束 -->
  </div>
</template>
<script>
export default {
  data(){
    return {
      value1: 0,
      value2: 0,
      value3: 0,
      active:'1',
      show1:false,
      show2:false,
      show3:false,
      message:"",
      category:["全部","待付款","待收货","待评价"],
    }
  },
  methods:{
   btn1(){
     if(this.value1!=0){
       this.show1=true;
     }
   },
   btn2(){
     if(this.value2!=0){
       this.show2=true;
     }
   },
   btn3(){
     if(this.value3!=0){
       this.show3=true;
     }
   },
   btn(){
     this.$toast("感谢您的评价");
     this.value1=3;
     this.value2=3;
     this.value3=3;
     this.show1=false;
     this.show2=false;
     this.show3=false;
     this.message="";
   }
  },
}
</script>
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

</style>
<style>
.mint-tab-item-label{
  font-size: 14px !important;
}
.eval>li{
  display: flex;
  flex-flow: row nowrap;
  align-items: center;
}
.eval>li>span{
  color: #555;
  padding: 10px 10px 10px 20px;
  font-weight: bold;
}
.eval>li>p{
  padding: 10px 20px;
  color: #f00;
  font-size: 1.025rem;
}
.van-field__label{
  width: 4rem !important;
  color: #aaa !important;
  font-size: 1.025rem;
  font-weight: bold;
  text-align: center !important;
}
/* .mint-button{
  margin-top: 10px;
} */
</style>