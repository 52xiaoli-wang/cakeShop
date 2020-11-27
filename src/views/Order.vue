<template>
  <div class="me">
    <mt-header fixed id="header" title="确认订单">
      <div slot="left">
        <mt-button icon="back" @click="goBack"></mt-button>
      </div>
    </mt-header>
    <div class="order">
      <div class="content_2">
        <ul class="content_1">
          <li>
            <img src="../assets/common/ndzz.jpg" />
            <a href="javascript:;">请添加收货地址</a>
          </li>
          <li>
            <router-link to="/address">
              <img src="../assets/me/page_next.png" />
            </router-link>
          </li>
        </ul>
      </div>
      <div class="content_2">
        <ul class="content_1">
          <li>
            <img src="../assets/common/nps.jpg" />
            <a href="javascript:;">请点击选择配送信息</a>
          </li>
          <li>
            <img src="../assets/me/page_next.png" />
          </li>
        </ul>
      </div>
      <div class="content_2">
        <ul>
          <li>
            <img src="../assets/common/nyhq.jpg" />
            <a href="javascript:;">请选择优惠券</a>
          </li>
          <li>
            <img src="../assets/me/page_next.png" />
          </li>
        </ul>
      </div>
      <div class="content_2">
        <ul>
          <li>
            <img src="../assets/common/nhk.jpg" />
            <a href="javascript:;">贺卡留言</a>
          </li>
          <li>
            <img src="../assets/me/page_next.png" />
          </li>
        </ul>
      </div>
      <div class="content_2">
        <ul>
          <li>
            <img src="../assets/common/nbz.jpg" />
            <a href="javascript:;">备注</a>
          </li>
          <li>
            <img src="../assets/me/page_next.png" />
          </li>
        </ul>
      </div>
      <div class="content_2">
        <ul>
          <li>
            <img src="../assets/common/nkf.jpg" />
            <a href="javascript:;">客服工号</a>
          </li>
          <li>
            <img src="../assets/me/page_next.png" />
          </li>
        </ul>
      </div>

      <div class="cart1">
        <ul v-for="(item, index) of cartList" :key="index">
          <li>
            <img src="../assets/cake_good/19-30-55.jpg" alt="" />
          </li>
          <li>
            <div class="d1">{{ item.cake_name }}</div>
            <div class="d1 d11">
              <button class="b" style="border:none;background-color:#fff">尺寸:{{ item.cake_size }}</button>
            </div>
            <div class="d1 d11">
              <span style="font-size:16px">×{{item.n}}</span>
              <span style="color:red ;margin-left:10px">￥{{ item.cake_newPrice.toFixed(2) }}</span>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <footer>
      <div class="footer-left">
        应付总额:
        <span>￥{{ totalMoney.toFixed(2) }}</span>
      </div>
      <div class="footer-right">
        <router-link to="/orderpay" style="color: #fff">提交订单</router-link>
      </div>
    </footer>
  </div>
</template>
<script>
import Footer from "../components/Footer";
import { mapState } from "vuex";
export default {
  components: {
    Footer,
  },
  data() {
    return {
      totalMoney:0
    };
  },
  mounted() {
    this.totalPrice();
  },
  computed: {
    ...mapState(["cartList"]),
  },
  methods: {
    goBack() {
      history.go(-1);
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
};
</script>
<style scoped>
#header {
  background-color: #401f00;
  font-size: 16px;
}
/* 我的订单 */
.me > .order {
  background: #e8e8e8;
  font-size: 14px;
  border: 1px solid transparent;
  margin-bottom: 55px;
  margin-top: 40px;
}
.me > .order > .content_2,
.cart1 {
  background: #fff;
  border-radius: 10px;
  padding: 7px;
  clear: both;
  margin-top: 10px;
  margin-bottom: 10px;
}
.cart1 img{
  width: 70px;
  height: 70px;
}
.d1 {
  height: 20px;
  font-size: 14px;
  margin-left: 10px;
}
.d11 {
  margin-top: 5px;
}
.content_2 a {
  margin-left: 10px;
  color: #bbb;
}
.content_2 img {
  width: 15px;
  height: 15px;
}
.cart1>ul{
  padding: 8px 0;
   display: flex;
   flex-direction: row;
  justify-content: left;
}
.content_2 > ul {
  padding: 8px 0;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.content_2 > ul li:hover,
.cart1 > ul li:hover {
  background: #eee;
}
.content_2 > ul li ~ li {
  border-top: 1px solid #eee;
}
.content_1{
  height: 60px;
}
.content_1 li{
  line-height: 60px;
}
.content_3 {
  margin-bottom: 10px;
}

a {
  text-decoration: none;
  color: #fff;
}
footer {
  width: 100%;
  height: 50px;
  position: fixed;
  bottom: 0;
  left: 0;
  z-index: 998;
  background: #fff;
  border-top: 1px solid #ccc;
  display: flex;
  justify-content: space-between;
}
.footer-left {
  flex: 1;
  text-align: right;
  line-height: 50px;
  font-size: 16px;
  padding-right: 25px;
  margin-left: 20px;
  text-align: left;
}

.footer-left span {
  color: red;
  text-align: center;
}
.footer-right {
  background: red;
  color: #fff;
  width: 150px;
  height: 50px;
  line-height: 50px;
  text-align: center;
}
</style>