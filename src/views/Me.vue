<template>
  <div class="me">
    <div class="person">
      <h3>个人中心</h3>
       <!-- 如果登录状态为1就执行v-if -->
      <div class="log" v-if="this.$store.state.isLogined == 1">
        <div>
          <router-link to="/avatar">
            <img :src="this.$store.state.userInfo.avatar" v-if="this.$store.state.userInfo.avatar!==null">
            <img src="../assets/me/fsper.png" v-else>
          </router-link>
          <div v-text="`${this.$store.state.userInfo.username}`" style="color:#fff;padding:10px 0;"></div>
          <div class="setting_right" @click.stop="uploadHeadImg">
            <div class="caption">更改头像</div>
          </div>
          <input type="file" accept="image/*" @change="handleFile" class="hiddenInput"/>
        </div>
        <div>
          <router-link to="/me">注册会员</router-link>
        </div>
      </div>
       <!-- 如果登录状态为0就执行v-else -->      
      <div class="log" v-else>
        <div><img src="../assets/me/fsper.png"></div>
        <div>
          <router-link to="/login">点击登录&gt;</router-link>
        </div>
        <router-link to="/register"><p>新用户注册立享150元现金优惠</p></router-link>
      </div>
      
      <ul>
        <li>
          <div>
            <img src="../assets/me/yhqnew.png" alt="">
            <span>我的优惠券</span>
          </div>
        </li>
        <li>
          <div>
            <img src="../assets/me/vipnew.png" alt="">
            <span>我的特权</span>
          </div>
        </li>
        <li>
          <div>
            <img src="../assets/me/srnew.png" alt="">
            <span>纪念日助手</span>
          </div>
        </li>
      </ul>
    </div>
    <div class="order">
      <div class="content_1">
          <p>我的订单</p>
          <ul>
            <li>
              <router-link to="/myorder">
                <img src="../assets/me/dfk.png" >
              </router-link>
              <span>待付款</span>
            </li>
            <li>
              <router-link to="/myorder">
                <img src="../assets/me/dsh.png" >
              </router-link>
              <span>待收货</span>
            </li>
            <li>
              <router-link to="/myorder">
                <img src="../assets/me/dpj.png" >
              </router-link>
              <span>待评价</span>
            </li>
            <li>
              <router-link to="/myorder">
                <img src="../assets/me/allnew.png" >
              </router-link>
              <span>全部订单</span>
            </li>
          </ul>
        </div> 
        <div class="content_2">
          <ul>
            <router-link to="/ordercheck">
              <li>
                <a href="javascript:;">订单查询</a>
                <img src="../assets/me/page_next.png">
              </li>
            </router-link>
            <router-link to="/collect">
              <li>
                <a href="javascript:;">我的收藏</a>
                <img src="../assets/me/page_next.png">
              </li>
            </router-link>

            <li>
              <a href="javascript:;">我在线咨询</a>
              <div>
                <span>8:00-21:00</span>
                <img src="../assets/me/page_next.png">
              </div>
            </li>
            <li>
              <a href="javascript:;">电话咨询</a>
              <div>
                <span>400-608-0980</span>
                <img src="../assets/me/page_next.png">
              </div>
            </li>
          </ul>
        </div>
        <div class="content_3">
          <ul>
            <router-link to="/recent">
              <li>
                <a href="javascript:;">最近浏览</a>
                <img src="../assets/me/page_next.png">
              </li>
            </router-link>
            <router-link to="/feedback">
              <li>
                <a href="javascript:;">意见反馈</a>
                <img src="../assets/me/page_next.png">
              </li>
            </router-link>
            <router-link to="/set">
              <li>
                <a href="javascript:;">设置</a>
                <img src="../assets/me/page_next.png">
              </li>
            </router-link>
          </ul>
        </div>
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
  data(){
    return {
      
    }
  },
  methods:{
    // 打开图片上传
    uploadHeadImg(){
      this.$el.querySelector('.hiddenInput').click();
      // this.$router.push('/avatar');
    },
    // 将头像显示
    handleFile(e){
      let $target = e.target;
      let file = $target.files[0];
      var reader = new FileReader();
      reader.onload = (data) => {
        //获取本地图片当做头像
        let avatar= data.target.result;
        this.$store.state.userInfo.avatar = avatar;
        // console.log(this.$store.state.userInfo.avatar);
        // console.log(avatar);
        //在登录成功状态下获取保存在session Storage中的username
        let username=this.$store.state.userInfo.username;
        // console.log(username);
        this.axios.post('/avatar',`avatar=${avatar}&username=${username}`).then(res=>{
          if(res.data.code == 1){
            this.$toast('头像上传成功');
          }
        });
      }
      reader.readAsDataURL(file);
    },
  }
}
</script>
<style scoped>
  .me>.person{
    text-align: center;
    background:#401f00;
    font-size: 14px;
    color:#fff;
  }
  .me>.person>h3{
    font-size: 16px;
    padding: 20px;
  }
  .me>.person>.log img{
     width: 80px;
     height: 80px;
     border-radius: 50%;
     border: 1px solid rgb(170, 80, 7);
     margin-bottom: 10px;
  }
  .me>.person>.log>div:first-child>div{
    color: rgb(212, 101, 9);
  }
  .hiddenInput{
    display: none;
  }
  .me>.person>.log>div:last-child{
    padding: 10px 0 20px 0;
  }
  .me>.person p{
    margin: 10px 0 20px 0;
  }
  .person>ul{
    margin: 0 auto;
    width: 95%;
    border-top: 2px solid #ddd;
    list-style: none;
    display: flex;
    justify-content: space-between;
    padding: 40px 0 30px 0;
  }
  .person>ul li{
    width: 33.333%;
  }
  .person>ul li>div{
    display: flex;
    flex-flow: column wrap;
  }
  .person>ul li img{
    margin: 0 auto;
    width: 30px;
    height: 30px;
  }
  
  /* 我的订单 */
  .me>.order{
    background: #e8e8e8;
    font-size: 14px;
    border: 1px solid transparent;
    margin-bottom: 55px;
  }
  .me>.order>.content_1,
  .me>.order>.content_2,
  .me>.order>.content_3{
    background: #fff;
    border-radius: 10px;
    padding: 7px;
    clear: both;
    margin-top: 10px;
  }
  .me>.order>.content_1>p{
    padding: 5px;
    padding-left: 20px;
    color: #aaa;
  }
  .me>.order>.content_1>ul{
    margin: 0 auto;
    text-align: center;
    display: flex;
    justify-content: space-between;
    border-top: 1px solid #eee;
    list-style: none;
    color: #aaa;
    padding: 10px 0;
  }
  .me>.order>.content_1>ul li{
    width: 25%;
    display: flex;
    flex-flow: column wrap;
  }
  .me>.order>.content_1>ul li img{
    width: 40px;
    height: 40px;
    margin: 0 auto;
  }
  .content_2 a,
  .content_3 a{
    color: #000;
  }
  .content_2 img,
  .content_3 img{
    width: 15px;
    height: 15px;
  }
  .content_2>ul li,
  .content_3>ul li{
    padding: 8px 0;
    display: flex;
    justify-content: space-between;
  }
  .content_2>ul li:hover,
  .content_3>ul li:hover{
    background: #eee;
  }
  .content_2>ul li~li,
  .content_3>ul li~li{
    border-top: 1px solid #eee;
  }
  .content_3{
    margin-bottom: 10px;
  }
  .person>ul li img,
  .order>.content_1>ul li img{
    padding-bottom: 5px;
  }
  a {
    text-decoration: none;
    color: #fff;
  }
</style>