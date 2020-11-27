<template>
  <div>
    <mt-header id="header" title="支付结果">
      <div slot="left">
        <router-link to="/">
          <mt-button icon="back"></mt-button>
        </router-link>
      </div>
    </mt-header>
    <div class="empty">
      <div>
        <img src="../assets/common/zfcg.png" alt="">
      </div>
      <div>
        <p class="gong">支付成功</p>
      </div>
      <div class="zhi">
      <mt-button type="danger"  size="large" @click="pay">确定</mt-button>
    </div>
    </div>
  </div>
</template>
<script>
export default {
  methods:{
    pay(){
      this.$router.push({path:'/'})
    },
  }
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
.empty{
  text-align: center;
}
.empty>div:first-child>img{
  width: 160px;
  height: 160px;
  margin-top: 50px;
}
.gong{
  font-size: 18px;
  margin-top: 10px;
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
</style>