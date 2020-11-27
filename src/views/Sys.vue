<template>
  <div id="body">
    <!-- 头部start -->
    <mt-header fixed id="header" title="扫二维码">
      <div slot="left">
        <router-link to="/" id="back">
          <mt-button icon="back"></mt-button>
        </router-link>
      </div>
      <div slot="right" class="right">
        <router-link to="Sys"
          ><img src="../assets/common/xc.png" alt=""
        /></router-link>
      </div>
    </mt-header>
    <!-- 头部end -->
    <div id="kuang"></div>
    <div id="ccc">
      <p id="p">将二维码放到框内,即可自动扫描</p>
    </div>
  </div>
</template>



<style scoped>
#body {
  height: 667px;
  background-color: #555;
}
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
  margin-right: 5px;
}
#kuang {
  width: 200px;
  height: 200px;
  position: absolute;
  left: 50%;
  top: 50%;
  margin-left: -100px;
  margin-top: -100px;
  border: 1px solid #0f0;
  background-color: #fff;
}
#p {
  color: #fff;
}
#ccc {
  position: absolute;
  left: 70%;
  top: 68%;
  margin-left: -186px;
  height: 30px;
}
</style>