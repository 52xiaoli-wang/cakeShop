<template>
  <div>
    <mt-header title="本地图片">
      <div slot="left">
        <router-link to="/me">
          <mt-button icon="back"></mt-button>
        </router-link>
      </div>
    </mt-header>
    <div>
      <ul class="avatar">
        <li v-for="(elem,i) of imgs" :key="i">
          <img :src="require(`../assets/local_img/${imgs[i]}`)">
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      imgs:["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg","11.jpg"],
    }
  },
  methods:{
  }
}
</script>
<style scoped>
.mint-header{
  background:#8b4a0d;
  font-size: 18px;
}
.avatar{
  display: flex;
  flex-flow: row wrap;
}
.avatar>li{
  flex: 0 0 50%;
  padding: 5px;
  box-sizing: border-box;
}
.avatar>li>img{
  width: 100%;
  height: 180px;
  box-shadow: -2px 3px 10px #aaa;
}
</style>