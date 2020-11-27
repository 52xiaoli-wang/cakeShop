<template>
  <div>
    <mt-header id="header" title="设置">
      <div slot="left">
        <router-link to="/me">
          <mt-button icon="back"></mt-button>
        </router-link>
      </div>
    </mt-header>
    <div class="set">
      <ul>
        <li>
          <div>
            <img src="../assets/me/jcgx.png" alt="">
            <span>检查更新</span>
          </div>
          <span style="margin-right:10px">当前版本5.1.12</span>
        </li>
        <li>
          <div>
            <img src="../assets/me/qchc.png" alt="">
            <span>清除缓存</span>
          </div>
        </li>
        <li>
          <div>
            <img src="../assets/me/fxper.png" alt="">
            <span>分享给好友</span>
          </div>
          <img src="../assets/me/fhy.png" alt="">
        </li>
        <li>
          <div>
            <img src="../assets/me/kfd.png" alt="">
            <span>隐私政策</span>
          </div>
          <img src="../assets/me/fhy.png" alt="">
        </li>
      </ul>
    </div>
    <div class="footer">
      <mt-button type="danger" size="large" @click="logout">退出登录</mt-button>
    </div>
  </div>
</template>
<script>
export default {
  methods:{
    logout(){
      if(this.$store.state.isLogined == 1){
        this.$store.commit("logout_mutations");
        sessionStorage.clear();
        this.$router.push('/me');
      }
    },
  }
}
</script>
<style scoped>
#header {
  background-color: #401f00;
  font-size: 16px;
}
.set>ul>li{
  padding: 8px 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: #aaa;
}
.set>ul>li>div>img{
  width: 30px;
  height: 30px;
  padding: 0 10px;
}
.set>ul>li>img{
  width: 20px;
  height: 20px;
  padding-right: 10px;
}
.set>ul>li~li{
  border-top: 1px solid #eee;
  opacity: 0.9;
}
.footer>.mint-button{
  width: 90%;
  height: 35px;
  background: rgb(173, 7, 7);
  border-radius: 20px;
  position: absolute;
  bottom: 10px;
  left: 20px;
}
</style>