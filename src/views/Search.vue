<template>
  <div>
    <div id="search">
      <mt-button icon="back" id="back" @click="goBack()"></mt-button>
      <input type="text" placeholder=" 输入您要购买的蛋糕" 
      @keyup.13="search()"
      v-model="keywords" ref="id" />
      <button @click="search()" id="button">搜索</button>
    </div>
    <div id="ser">
      <h2>大家都在搜</h2>
      <ul>
        <li>缤纷之果</li>
        <li>阳光彩虹小白马</li>
        <li>夏威夷芝士</li>
        <li>浪漫恋人</li>
        <li>Hello Kitty</li>
        <li>小仙女</li>
        <li>浓情私语</li>
      </ul>
    </div>
    <div class="tuijian">
      <div class="tbox">
        <h1>猜您喜欢</h1>
        <p>Dou you like ?</p>
      </div>
    </div>
    <!-- 查找结果列表start -->
    <div class="fbox" 
        v-if="numbercode == 1 "
    >
      <div
        class="tab"
        v-for="(item, index) of newList"
        :key="index"
        :id="item.id.toString()"
      >
        <div>
          <router-link :to="`details/${item.id}`">
            <img v-lazy="item.cake_thumbnail" />
          </router-link>
          <div class="tab-bottom">
            <div class="tab-b-l">
              <h3>{{ item.cake_name }}</h3>
              <p>¥{{ item.cake_newPrice }}</p>
            </div>
            <div class="smcar">
              <img src="../assets/common/smcar.png" alt="" />
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 查找结果列表end-->
    <!-- 未找到界面start -->
    <div v-else-if="numbercode == 2">
      <div class="empty">
      <div>
        <img src="../assets/me/nodata_01.png" alt="">
      </div>
      <div>
        <p>未找到该商品</p>
      </div>
    </div>


    </div>
    <!-- 未找到界面end -->
    <!-- 推荐列表部分 -->
    <div
      class="fbox"
      infinite-scroll-distance="30"
      v-infinite-scroll="more"
      infinite-scroll-disable="busy"
      infinite-scroll-immediate-check="true"
      v-else
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
    <!-- 推荐列表部分end -->
    </div>
</template>

<script>
export default {
  data() {
    return {
      keywords: "",
      products: [],
      newList: [],
      navs: [],
      busy: false,
      numbercode:0,
    };
  },
  methods: {
    goBack(){
      history.back(-1);
    },
    // 封装查找商品函数
    search() {
      this.axios.get("/products").then((res) => {
        let arr = res.data.results;
        arr.forEach((item) => {
            //indexOf()方法可以判断字符串中是否包含写字符串
          if (item.cake_name.indexOf(this.keywords) != -1) {
            item.cake_thumbnail = require("../assets/images/" +item.cake_thumbnail);
            this.newList.push(item);
          }
        });
        if(this.newList.length>0){
            this.numbercode=1;
            }else{
            this.numbercode=2;
          }
      });
      // 查询后清空新数组
      this.newList=[];
    },
    // 自己封装的axios函数
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
  mounted() {
    // 输入框自动获取焦点
    this.$refs.id.focus();
    // 推荐列表
    this.axios.get("/products").then((res) => {
      //获取服务器返回的数据 -- 数组
      let arr = res.data.results;
      arr.forEach((item) => {
        item.cake_thumbnail = require("../assets/images/" +
          item.cake_thumbnail);
        this.products.push(item);
      });
    });
  },
};
</script>

<style scoped>
#search {
  height: 40px;
  font-size: 15px;
  background-color: #401f00;
}
#search input{
  height: 16px;
  width: 260px;
  padding: 6px;
  border: 0;
  outline: 0;
  margin-left: 10px;
}
#button{
  background-color: #401f00;
color: #fff;
border: 0;
margin-left: 10px;
}
#back{
  height: 40px;
  border: none;
  outline: none;
  background-color: #401f00;
}

#ser {
  height: 100px;
}
#ser h2 {
  font-size: 15px;
  font-weight: 600;
  padding: 10px;
}
#ser ul {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
#ser ul li {
  padding: 8px 12px;
  font-size: 12px;
  border: 1px solid #d9d9d9;
  border-radius: 10px;
  background-color: #d9d9d9;
  padding-right: 12px;
  margin-top: 3px;
}
.tuijian {
  position: relative;
  margin-top: 10px;
  height: 60px;
}
.tuijian h1 {
  font-size: 24px;
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
.tbox:hover {
  color: red;
  transform: rotate(360deg);
  transition: all 0.5s ease-in;
  margin-left: -150px;
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
  margin-top: 5px;
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
.tab-b-l p {
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
.empty{
  text-align: center;
}
.empty>div:first-child>img{
  width: 160px;
  height: 160px;
  margin-top: 50px;
}
.empty>div:last-child>p{
  margin-top: 20px;
  font-size: 18px;
  color: #aaa;
}
</style>