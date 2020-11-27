<template>
  <div>
    <mt-header id="header" title="订单查询">
      <div slot="left">
        <router-link to="/me">
          <mt-button icon="back"></mt-button>
        </router-link>
      </div>
    </mt-header>
    <div class="order">
      <div>
        <div>
          <p>亲爱的用户:</p>
          <p>请输入订单号或手机号其任何一种查询条件即可查询到您购买过的订单。</p>
        </div>
        <div>
          <mt-field type="text" label="订单号:"
          placeholder="选填,请输入您的订单号"></mt-field>
          <mt-field type="text" label="手机号:"
          placeholder="选填,请输入订花手机号"></mt-field>
        </div>
        <div>
          <mt-button type="danger"  size="large">查询</mt-button>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
/* body{
  background:#eee !important;
} */
#header {
  background-color: #401f00;
  font-size: 16px;
}
/* .mint-header{
  background: #fff;
  font-size: 18px;
  font-weight: 800;
  color: #999;
} */
.order{
  border-top:1px solid transparent;
  /* height: 1000px; */
  background: #eee;
  opacity: 0.9;
}
.order>div{
  border-radius: 5px;
  margin-top: 20px;
  background: #fff;
}

.order>div>div:first-child{
  width: 82%;
  color: #aaa;
  line-height: 1.5rem;
  padding: 10px 10px;
}
.order>div>div:last-child{
  padding: 20px 0;
}
.order>div>div:last-child .mint-button{
  height: 30px;
  background: #401f00;
  width: 80%;
  border-radius: 10px;
  margin: 10px auto;
}
</style>
<style>
/* .mint-header-title{
  font-weight: 600 !important;
} */
.mint-button-icon{
  color: #fff !important;
}
.mint-cell-title{
  width: 80px !important;
}
/* .mintui-back:before{
  color: #000;
  font-size: 18px;
} */
</style>