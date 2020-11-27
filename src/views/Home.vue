<template>
  <div>
    <!-- 头部start -->
    <mt-header fixed id="header">
      <div slot="left" class="left">
        <router-link :to="`ms`">
          <img src="../assets/header/details_logo.png" alt="" />
        </router-link>
        <router-link :to="`search`">
          <input type="text" placeholder=" | 水果蛋糕" />
        </router-link>
      </div>
      <div slot="right">
        <router-link to="/sys">
          <img src="../assets/common/sys.png" id="sys">
        </router-link>
      </div>
    </mt-header>
    <!-- 头部end -->
    <!-- 轮播图 start-->
    <div class="swipe">
      <router-link :to="`details/4`">
        <mt-swipe>
          <mt-swipe-item
            ><img src="../assets/images/1.jpg" id="1"
          /></mt-swipe-item>
          <mt-swipe-item
            ><img src="../assets/images/2.jpg" id="2"
          /></mt-swipe-item>
          <mt-swipe-item
            ><img src="../assets/images/3.jpg" id="3"
          /></mt-swipe-item>
          <mt-swipe-item
            ><img src="../assets/images/4.jpg" id="4"
          /></mt-swipe-item>
        </mt-swipe>
      </router-link>
    </div>
    <!-- 轮播图 end -->
    <!-- 小图排列start -->
    <div>
      <div id="box">
        <div v-for="(nav, index) of navs" :key="index" :id="nav.id">
          <router-link :to="`/lists/${nav.id}`">
            <img :src="nav.image" />
            <p>{{ nav.type_name }}</p>
          </router-link>
        </div>
      </div>
    </div>
    <!-- 小图排列end -->
    <!-- 产品列表1start -->
    <div class="tuijian">
      <div class="tbox">
        <h1>店长推荐</h1>
        <p>Today's specials</p>
      </div>
    </div>
    <!-- 列表部分 -->
    <div class="fbox">
      <div
        class="tab"
        v-for="(product, index) of goods"
        :key="index"
        :id="product.id.toString()"
      >
        <div>
          <router-link :to="`details/${product.id}`">
            <img v-lazy="product.cake_thumbnail" />
            <div class="tab-bottom">
              <div class="tab-b-l">
                <h3>{{ product.cake_name }}</h3>
                <p>¥{{ product.cake_newPrice }}</p>
              </div>
              <div class="smcar">
                <img src="../assets/common/smcar.png" alt="" />
              </div>
            </div>
          </router-link>
        </div>
      </div>
    </div>
    <!-- 产品列表1end -->
    <!-- 产品列表2start -->
    <div class="tuijian">
      <div class="tbox">
        <h1>特价优惠</h1>
        <p>Special offers</p>
      </div>
    </div>
    <div id="time">特价时间仅剩{{ d }}天{{ h }}时{{ m }}分{{ s }}秒</div>
    <!-- 列表部分 -->
    <div class="fbox">
      <div
        class="tab"
        v-for="(product, index) of good2"
        :key="index"
        :id="product.id.toString()"
      >
        <div>
          <router-link :to="`details/${product.id}`">
            <img v-lazy="product.cake_thumbnail" />
            <div class="tab-bottom">
              <div class="tab-b-l">
                <h3>{{ product.cake_name }}</h3>
                <div id="pri">
                  ¥{{ product.cake_newPrice }}
                  <s>¥{{ product.cake_oldPrice }}</s>
                </div>
              </div>
              <div class="smcar">
                <img src="../assets/common/smcar.png" alt="" />
              </div>
            </div>
          </router-link>
        </div>
      </div>
    </div>
    <!-- 产品列表2end -->
    <!-- 产品列表3start -->
    <div class="tuijian">
      <div class="tbox">
        <h1>精品抢购</h1>
        <p>Quality products</p>
      </div>
    </div>
    <!-- 列表部分 -->
    <div
      class="fbox"
      infinite-scroll-distance="25"
      v-infinite-scroll="more"
      infinite-scroll-disable="busy"
      infinite-scroll-immediate-check="true"
    >
      <div
        class="tab"
        v-for="(product, index) of products"
        :key="index"
        :id="product.id.toString()"
      >
        <div>
          <router-link :to="`details/${product.id}`">
            <img v-lazy="product.cake_thumbnail" />
          </router-link>
          <div class="tab-bottom">
            <div class="tab-b-l">
              <h3>{{ product.cake_name }}</h3>
              <p>¥{{ product.cake_newPrice }}</p>
            </div>
            <div class="smcar">
              <img src="../assets/common/smcar.png" alt="" />
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 产品列表3end -->
    <Footer></Footer>
  </div>
</template>
<script>
import Footer from "../components/Footer";
export default {
  components: {
    Footer,
  },
  data() {
    return {
      d: " ",
      h: " ",
      m: " ",
      s: " ",
      goods: [],
      good2: [],
      products: [],
      navs: [],
      busy: false,
    };
  },
  methods: {
    //  封装倒计时
    times() {
      let outTime = new Date("2020/12/01 10:00:00");
      let newTime = new Date();
      let ms = parseInt((outTime.getTime() - newTime.getTime()) / 1000);
      this.d = parseInt(ms / 3600 / 24); //
      this.h = parseInt((ms / 3600) % 24);
      this.m = parseInt((ms / 60) % 60);
      this.s = parseInt(ms % 60);
      this.d > 9 ? (this.d = this.d) : (this.d = "0" + this.d);
      this.h > 9 ? (this.h = this.h) : (this.h = "0" + this.h);
      this.m > 9 ? (this.m = this.m) : (this.m = "0" + this.m);
      this.s > 9 ? (this.s = this.s) : (this.s = "0" + this.s);
    },
    // 封装axios函数
    getProducts() {
      // 显示加载提示框
      this.$indicator.open({
        text: "正在加载中...",
        spinnerType: "fading-circle",
      });
      // 没加载出来不再触发滚动函数
      this.busy = true;
      //通过axios工具向web服务器发送请求以获取数据
      this.axios.get("/products").then((res) => {
        //获取服务器返回的数据 
        let arr = res.data.results;
        arr.forEach((item) => {
          //属性重新赋值
          item.cake_thumbnail = require("../assets/images/" +
            item.cake_thumbnail);
          this.products.push(item);
        });
        // 关闭修改提示框
        this.$indicator.close();
        // 修改变量buzy
        this.busy = false;
      });
    },
    //  无线滚动加载页面
    more() {
      this.getProducts();
    },
  },
  created(){
     this.axios.get("/lists").then((res) => {
      //获取服务器返回的数据
      let arr = res.data.results;
      arr.forEach((e) => {
        //图片重新赋值
        e.image = require("../assets/image/" + e.type_avatar);
        this.navs.push(e);
      });
    });

this.axios.get("/goods").then((res) => {
      //获取服务器返回的数据
      let arr = res.data.results;
      arr.forEach((item) => {
        //图片重新赋值
        item.cake_thumbnail = require("../assets/images/" +
          item.cake_thumbnail);
        this.goods.push(item);
      });
    });
     setInterval(this.times, 1000);
  },

  mounted() {
    //商品分类
    // this.axios.get("/lists").then((res) => {
    //   //获取服务器返回的数据
    //   let arr = res.data.results;
    //   arr.forEach((e) => {
    //     //图片重新赋值
    //     e.image = require("../assets/image/" + e.type_avatar);
    //     this.navs.push(e);
    //   });
    // });
    //店长推荐
    // this.axios.get("/goods").then((res) => {
    //   //获取服务器返回的数据
    //   let arr = res.data.results;
    //   arr.forEach((item) => {
    //     //图片重新赋值
    //     item.cake_thumbnail = require("../assets/images/" +
    //       item.cake_thumbnail);
    //     this.goods.push(item);
    //   });
    // });
    //倒计时模块
    // setInterval(this.times, 1000);
    //特价优惠
    this.axios.get("/good2").then((res) => {
      //获取服务器返回的数据 -- 数组
      let arr = res.data.results;
      arr.forEach((item) => {
        //图片重新赋值
        item.cake_thumbnail = require("../assets/images/" +
          item.cake_thumbnail);
        this.good2.push(item);
      });
    });
    // 精品抢购
    //   this.axios.get("/products").then((res) => {
    //   //获取服务器返回的数据 -- 数组
    //   let arr = res.data.results;
    //   arr.forEach((item) => {
    //     //图片重新赋值
    //     item.cake_thumbnail = require("../assets/images/" +
    //         item.cake_thumbnail);
    //       this.products.push(item);
    //   });
    // });
  },
};
</script>>
<style scoped>
#header {
  background-color: #401f00;
}

#login {
  color: #fff;
}
.left input {
  padding: 6px;
  outline: none;
  border: none;
  width: 200px;
  height: 16px;
  margin-left: 20%;
  border-radius: 20px;
}
.left img {
  width: 25px;
  height: 25px;
  margin-left: 5px;
}
.swipe {
  margin-top: 40px;
  height: 230px;
  width: 100%;
}
.swipe img {
  width: 100%;
  height: 100%;
}
.bottom {
  background-color: #eee;
}
#box {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
#box p {
  font-size: 12px;
  color: #401f00;
  text-align: center;
}
#ultop p,
#ulbottom p {
  color: #401f00;
}
/* 商品列表start */
.tuijian {
  position: relative;
  margin-top: 10px;
  height: 60px;
}
.tuijian h1 {
  font-size: 24px;
  position: relative;
}
.tuijian p {
  height: 20px;
  width: 100px;
  margin-top: 5px;
  text-align: center;
  font-size: 10px;
}
.tbox {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 100px;
  height: 25px;
  margin-top: -12px;
  margin-left: -50px;
  font-weight: 600;
}

#time {
  font-size: 18px;
  text-align: center;
  margin-top: 6px;
  font-weight: bold;
  color: red;
}

.fbox {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
.tab{
  border-radius: 0.5rem;
}
.tab > div {
  width: 178px;
  height: 230px;
  box-shadow: -2px 2px 13px #aaa;
  margin-bottom: 12px;
  margin-top: 5px;
  border-radius: 0.5rem;
}
.tab img {
  width: 100%;
  border-radius: 0.5rem;
}
.tab .smcar {
  width: 40px;
  height: 40px;
  margin-top: 2px;
}
.tab .tab-bottom {
  margin-top: 5px;
  display: flex;
  justify-content: space-around;
  flex-wrap: nowrap;
  font-size: 14px;
  color: #401f00;
}
.tab-b-l {
  padding: 5px;
}
.tab-b-l p ,#pri{
  padding-top: 9px;
  font-weight: 600;
  font-size: 15px;

}
.tab-b-l h3 {
  width: 130px;
  font-weight: 600;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

#pri s {
  font-size: 12px;
  margin-left: 3px;
}
#sys{
  width: 23px;
  height: 23px;
  margin-right: 5px;
}
</style>