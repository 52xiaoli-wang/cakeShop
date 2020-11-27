<template>
  <div>
    <mt-header id="header" title="订单支付">
      <div slot="left">
        <mt-button icon="back" @click="goBack"></mt-button>
      </div>
    </mt-header>
    <div>
      <div class="empty" v-for="(item, index) of cartList" :key="index">
        <div class="empty_1">需支付</div>
        <div>￥<span class="empty_2">{{ totalMoney.toFixed(2) }}</span></div>
      </div>
      <div class="fukuan">选择付款方式：</div>
      <div>
        <ul class="fang">
          <li>
            <img src="../assets/common/zfb.png" alt="">
          </li>
          <li>
            <span>支付宝支付</span><br>
          </li>
          <li style="margin-left:180px"><img src="../assets/common/xzq.png" class="m1"></li>
        </ul>
        <ul class="fang">
          <li>
            <img src="../assets/common/wx.png" alt="">
          </li>
          <li>
            <span>微信支付</span><br>
          </li>
          <li></li>
        </ul>
        <ul class="fang">
          <li>
            <img src="../assets/common/jd.png" alt="">
          </li>
          <li>
            <span>快捷支付</span><br>
          </li>
          <li></li>
        </ul>
      </div>
    </div>
    <div class="zhi">
      <mt-button type="danger"  size="large" @click="pay">支付</mt-button>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      totalMoney:0
    };
  },
   computed: {
    ...mapState(["cartList"]),
  },
  mounted(){
    this.totalPrice();
  },
  methods:{
    goBack() {
      history.go(-1);
    },
    pay(){
      this.$toast({
        message: "支付成功",
        position: "middle",
        duration: 2000,
      });
      this.$router.push({path:'/ordersuccess'})
    },
    totalPrice() {
      this.totalMoney = 0;
      var _this = this;
      this.cartList.forEach((item, index) => {
        if (item.checked == "1") {
          _this.totalMoney += item.cake_newPrice * item.n;
        } else {
          _this.totalMoney += item.cake_newPrice * item.n;
        }
        console.log(_this.totalMoney);
      });
      return _this.totalMoney;
    },
  },
 
}
</script>
<style scoped>
#header {
  background-color: #401f00;
  font-size: 16px;
}
.empty{
  text-align: center;
  width: 100%;
  height: 80px;
  margin-top:20px
}
.empty_1{
  font-size: 16px;
  color: #2c2c2c;
  margin-bottom: 5px;
}
.empty_2{
  font-size: 30px;
  color: #401f00;
}
.fukuan{
  background-color: #f8f8f8;
  height: 30px;
  line-height: 30px;
  color: #676767;
}
.fang{
  display: flex;
  justify-content: left;
  border-bottom: 1px solid #eee;
}
.fang li{
  height: 50px;
  line-height: 50px;
  margin-left: 20px;
}
.zhi{
  padding: 20px 0;
}
.zhi .mint-button{
  height: 50px;
  background: #401f00;
  width: 80%;
  border-radius: 8px;
  margin: 20px auto;
}
.m1{
  width: 16px;
}
</style>