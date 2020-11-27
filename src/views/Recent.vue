<template>
  <div>
    <mt-header id="header" title="我的浏览">
      <div slot="left">
        <router-link to="/me">
          <mt-button icon="back"></mt-button>
        </router-link>
      </div>
    </mt-header>
    <div class="empty">
      <div>
        <img src="../assets/me/nodata_02.png" alt="">
      </div>
      <div>
        <p>您还没有浏览历史</p>
      </div>
    </div>
  </div>
</template>
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
.empty>div:last-child>p{
  margin-top: 20px;
  font-size: 18px;
  color: #aaa;
}
</style>