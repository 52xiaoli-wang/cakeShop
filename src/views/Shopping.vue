<template>
  <div>
    <div class="cart1" v-if="cartList.length >= 1">
      <mt-header fixed id="header" title="购物车">
        <div slot="left">
        <mt-button icon="back" @click="goBack"></mt-button>
      </div>
      </mt-header>
      <ul v-for="(item, index) of cartList" :key="index">
        <li></li>
        <li>
          <img
            :src="require(`../assets/cake_good/` + item.cake_thumbnail)"
            alt=""
          />
        </li>
        <li>
          <div class="d1">{{ item.cake_name }}</div>
          <div class="d1 d11">￥{{ item.cake_newPrice.toFixed(2) }}</div>
          <div class="d1 d11">
            <button class="b">尺寸:{{ item.cake_size }}</button>
          </div>
        </li>
        <li>
          <div class="d2">
            <button @click="changeMoney(item, -1)">-</button>
            <input type="text" :value="item.n" />
            <button @click="changeMoney(item, 1)">+</button>
          </div>
        </li>
        <li>
          <a href="javascript:;" @click="del(index)">
            <img src="../assets/cartList/delect.png" alt="" />
          </a>
        </li>
      </ul>
      <footer>
        <div class="footer-left">
          实际付款:
          <span>￥{{ totalMoney.toFixed(2) }}</span>
        </div>
        <div class="footer-right">
          <router-link to="/order" style="color: #fff">立即付款</router-link>
        </div>
      </footer>
      <Footer></Footer>
    </div>
    <div v-else>
      <mt-header fixed id="header" title="购物车"></mt-header>
      <div class="img">
        <img src="../assets/spimg/gw.png" alt="" />
      </div>
      <div class="p">
        <p>购物车空空哒</p>
      </div>
      <router-link to="/">
        <div class="but">
          <mt-button type="danger" size="small" style="border-radius: 10px;background-color:#401f00"
            >随便逛逛</mt-button
          >
        </div>
      </router-link>
      <Footer></Footer>
    </div>
  </div>
</template>
<script>
import { mapState } from "vuex";
import Footer from "../components/Footer";
export default {
  components: {
    Footer,
  },
  data() {
    return {
      totalMoney: 0,
      // cartShopping: [],
    };
  },
  mounted() {
    this.totalPrice();
  },
  computed: {
    checkAllFlag() {
      return this.selectedCount === this.cartList.length;
    },
    selectedCount() {
      var count = 0;
      this.cartList.forEach((item, index) => {
        if (item.checked == "1") {
          count++;
        }
      });
      return count;
    },
    ...mapState(["cartList"]),
  },
  methods: {
    goBack() {
      history.go(-1);
    },
    del(index) {
      this.cartList.splice(index, 1);
      this.totalPrice();
    },
    changeMoney(product, flag) {
      if (flag === 1) {
        product.n++;
      } else if (flag === -1) {
        if (product.n > 1) {
          product.n--;
        } else {
          product.n = 1;
        }
      } else {
        product.checked = product.checked == "1" ? "0" : "1";
      }
      var param = {
        productId: product.id,
        productNum: product.n,
        checked: product.checked,
      };

      this.axios
        .get("/ProductNum", {
          params: param,
        })
        .then((res) => {
          res = res.data;
          if (res.status === "1") {
            console.log(res.msg);
          }
        });
      this.totalPrice();
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
.cart1 {
  margin-top: 60px;
}
.img,
.p,
.but {
  text-align: center;
  padding: 8px;
}
.p {
  font-size: 14px;
}
.img {
  padding-top: 150px;
  color: #d6d6;
}
ul > li input {
  width: 20px;
  height: 20px;
  padding-left: 8px;
  background-color: #fff;
  border: 1px solid #ddd;
}
.b {
  height: 24px;
  width: 30px;
  text-align: center;
}
ul {
  margin-top: 20px;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  height: 80px;
  border-bottom: 2px solid #eee;
  padding-bottom: 20px;
}
ul > li {
  text-align: center;
}
ul > li:first-child {
  width: 20px;
  line-height: 80px;
}
ul > li:first-child > input {
  width: 16px;
  height: 16px;
}
ul > li:last-child {
  line-height: 80px;
  width: 50px;
}
ul > li:last-child > a > img {
  width: 24px;
  height: 24px;
}
ul > li:nth-child(3) {
  text-align: left;
  width: 200px;
}
ul > li > img {
  width: 80px;
  height: 80px;
}
.d1 {
  height: 20px;
  font-size: 14px;
  margin-left: 10px;
}
.d11 {
  margin-top: 8px;
}
.d1 button {
  width: 75px;
  border: none;
}
.d2 {
  width: 80px;
  text-align: center;
  margin-top: 37%;
  /* position: absolute;
  top: 13%;
  right: 15%; */
}
.d2 button {
  height: 22px;
  width: 24px;
  font-size: 16px;
  background-color: #eee;
  border: 1px solid #eee;
}
.foot {
  line-height: 50px;
  margin-left: 10px;
}
.foot > input {
  width: 16px;
  height: 16px;
}
footer {
  width: 100%;
  height: 50px;
  position: fixed;
  bottom: 65px;
  left: 0;
  z-index: 998;
  background: #fff;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
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
