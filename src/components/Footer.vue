<template>
  <div>
    <!-- 底部start -->
    <div fixed  class="bottom-tab">
      <!-- 首页 -->
      <div class="tab-item"  @click="switchTo('/')">
        <img
          :src="'/'==$route.path ? tabBarImgArr[0].selected : tabBarImgArr[0].normal"
          slot="icon"
        />
        <span :class="{on:'/'===$route.path}">首页</span>
      </div>
      <!-- 鲜花 -->
      <!-- <mt-tab-item id="flower">
        <img
          src="../assets/common/fl1.png"
          slot="icon"
          v-if="selected == 'flower'"
        />
        <img src="../assets/common/fl.png" slot="icon" v-else />
        鲜花
      </mt-tab-item> -->
      <!-- 定制 -->
      <div class="tab-item"  @click="switchTo('/ms')">
        <img
          :src="'/ms'==$route.path ? tabBarImgArr[1].selected : tabBarImgArr[1].normal"
          slot="icon"
          
        />
       
        <span :class="{on:'/ms'===$route.path}">定制</span>
      </div>
      <!-- 购物车 -->
      <div class="tab-item"  @click="switchTo('/shopping')">
        <img
          :src="'/shopping'==$route.path ? tabBarImgArr[2].selected : tabBarImgArr[2].normal"
          slot="icon"
          
        />
       
        <span :class="{on:'/shopping'===$route.path}">购物车</span>
      </div>
      <!-- 我的 -->
      <div class="tab-item"  @click="switchTo('/me')">
        
        <img
          :src="'/me'==$route.path ? tabBarImgArr[3].selected : tabBarImgArr[3].normal"
          slot="icon"
        />
        <span :class="{on:'/me'===$route.path}">我的</span>
      </div>
    </div>
    <!-- 底部end -->
  </div>
</template>

<script>
export default {
  data(){
    return {
      tabBarImgArr:[   //图片切换
        {normal: require('../assets/common/sy.png'), selected: require('../assets/common/sy1.png')},
        {normal: require('../assets/common/kf.png'), selected: require('../assets/common/kf1.png')},
        {normal: require('../assets/common/gwc.png'), selected: require('../assets/common/gwc1.png')},
        {normal: require('../assets/common/wd.png'), selected: require('../assets/common/wd1.png')}
      ]
    }
  },
  methods:{
    switchTo(path){
      this.$router.replace(path)
    }
  }
}
</script>

<style scoped>
  .bottom-tab{
    width:100%;
    height:55px;
    background-color:#fff;
    position:fixed;
    left:0px;
    bottom:0px;
    display:flex;
    z-index:999;
    padding: 5px 0;
  }
  .tab-item{
    display: flex;
    flex: 1;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    font-size: 14px;
    color: #666;
  }
  img{
  width :40%;
  /* margin-bottom :1px; */
  }
  .on{
    color: #401f00;
  }
</style>