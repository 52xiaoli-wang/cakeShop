<template>
<div>
    <mt-header fixed id="header" title="个性定制"></mt-header>
    <div class="dz dz-first"><img src="../assets/img/1.jpg"></div>
    <div class="dz"><img src="../assets/img/2.jpg"></div>
    <div class="dz"><img src="../assets/img/3.jpg"></div>
    <div class="dz"><img src="../assets/img/4.jpg"></div>
    <div class="daohang">
        <ul id="nav" class="naver">
            <li class="co1"><a href="#"><img src="../assets/img/6.png" alt=""></a></li>
        </ul>
    </div>
    <Footer></Footer>
</div>
</template>
<script>
import Footer from '../components/Footer'
export default {
  components:{
      Footer
  },
   updated(){
    window.scroll(0,0)
  },
}
</script>
<style scoped>
#header {
  background-color: #401f00;
  font-size: 16px;
}
.dz-first{
    margin-top: 40px;
}
.daohang li{
   position: fixed;
    right: 0;
    top: 50%;
    margin-top: -80px;
    width: 71px;
    background: rgba(0,0,0,0.3);
    padding: 2px 0 0 0;
    border-radius: 21px 0 0 21px;
    z-index: 999999;
}
.dz{
    height: 400px;
    width: 375px;
}
.dz img{
    width: 100%;
    height: 100%;
}
</style>
