<template>
  <div>
    <!-- 头部start -->
    <mt-header fixed id="header" title="商品列表">
      <div slot="left" >
        <router-link to="/" id="back">
          <mt-button icon="back"></mt-button>
        </router-link>
      </div>
      <div slot="right" class="right">
        <router-link to="/ms"
          ><img src="../assets/header/details_logo.png" alt=""
        /></router-link>
      </div>
    </mt-header>
    <!-- 头部end -->

    <!-- 表头 -->
    <ul id="nav">
      <li>综合排序</li>
      <li>按新品</li>
      <li>按销量</li>
      <li>按价格</li>
    </ul>
    <!-- 表头 -->

    <!-- 产品列表start -->
    <div class="fbox">
      <div
        class="tab"
        v-for="(product, index) of products"
        :key="index"
        :id="product.id.toString()"
      >
        <div>
          <router-link :to="`details/${product.id}`">
            <img v-lazy="product.image" />
            <div class="tab-bottom">
              <div class="tab-b-l">
                <h3>{{ product.cake_name }}</h3>
                <div id="pri">
                  ¥{{ product.cake_newPrice }}
                  <s>¥{{ product.cake_oldPrice }}</s>
                </div>
              </div>
            </div>
          </router-link>

        </div>
      </div>
    </div>
    <!-- 产品列表end -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      products: [],
      busy: false,
    };
  },
  methods:{

  },
  mounted() {
    let id = this.$route.params.id;
    this.axios.get("/number?id=" + id).then((res) => {
      let arr = res.data.results;
      arr.forEach((e) => {
        e.image = require("../assets/images/" + e.cake_thumbnail);
        this.products.push(e);
      });
    });
  },
};
</script>

<style scoped>
#header {
  background-color: #401f00;
  height: 40px;
  font-size: 17px;
  font-weight: 600;

}
#back {
  color: #fff;
}

.right img {
  width: 25px;
  height: 25px;
  margin-left: 5px;
}
#nav {
  padding-top: 10px;
  padding-bottom: 10px;
  margin-top: 40px;
  display: flex;
  justify-content: space-around;
  flex-wrap: nowrap;
}

#nav li{
  font-size: 17px;
  font-weight: 600;
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
}
.tab-b-l h3 {
  width: 165px;
  font-weight: 600;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
#pri  {
  margin-top: 9px;
  font-weight: 600;
  font-size: 15px;

}
#pri s{
  font-size: 12px;
  margin-left: 3px;
}
</style>