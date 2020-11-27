<template>
  <div>
    <!-- 导航顶部开始 -->
    <mt-header title="详情页" id="header" class="mind" fixed>
      <div slot="left">
        <mt-button icon="back" @click="goBack"></mt-button>
      </div>
      <div slot="right" class="details_img">
        <img :src="require(`../assets/header/`+image)" @click="test">
        <!-- 分享提示框:当点击分享时弹出分享提示框 -->
        <img @click="showShare = true" 
        src="../assets/header/details_busy.png" alt="">
        <van-share-sheet
         v-model="showShare"
         title="立即分享给好友"
         :options="options"
         />
        <img src="../assets/header/details_logo.png" alt="">
      </div>
    </mt-header>
    <!-- 导航顶部结束 -->
    <!-- 图片区域开始 -->
    <div class="index" @click="close">
      <div class="details_logo">
        <mt-swipe :auto="3000">
          <mt-swipe-item v-for="(item,index) of lun" :key="index">
            <img :src="lun[index]"/>
          </mt-swipe-item>
        </mt-swipe>
      </div>
      <!-- 图片区域结束 -->
      <!-- 详情信息开始 -->
      <div>
        <div class="bear">
          {{articleInfo.cake_name}}
        </div>
        <div class="bear1">
          ￥{{articleInfo.cake_newPrice}}.00
          <s style="font-size: 10px">￥{{articleInfo.cake_oldPrice}}.00</s>
        </div>
      </div>
      <!-- 详情信息结束 -->
      <!-- ----- -->
      <div id="app"></div>
      <!-- 底部信息详情开始 -->
      <div class="details_page">
        <span><img src="../assets/sign/details.png" />市区免配送</span>
        <span><img src="../assets/sign/details.png" />100%售后保证</span>
        <span><img src="../assets/sign/details.png" />13年蛋糕品牌</span>
      </div>
      <!-- 底部信息详情结束 -->
      <div id="app"></div>
      <!-- ----- -->
      <!-- 底部信息开始 -->
      <div class="details_font">
        <table>
          <tr>
            <td>货号</td>
            <td>{{articleInfo.cake_number}}</td>
          </tr>
          <tr>
            <td>材料</td>
            <td>{{articleInfo.cake_materials}}</td>
          </tr>
          <tr>
            <td>附送</td>
            <td>免费送一次性刀、叉、盘、蜡烛一套级精美贺卡,代写您的祝福。(您下单时可填写留言栏)</td>
          </tr>
          <tr>
            <td>说明</td>
            <td>
              蛋糕乃手工制作产品，不同的糕点师对图片上的花型的理解不同以及手工不同，另外收当地原料因素等原因影响，当某材料和颜色缺乏时我们会以相近的替代，收货人实际收到的产品可能与网页上看到的图片存在一些差异
            </td>
          </tr>
          <tr>
            <td>配送</td>
            <td>全国(可配送至全国1000多城市，市区免配送费)</td>
          </tr>
        </table>
      </div>
      <!-- 底部详情图片开始 -->
		<div class="img-cake" v-for="(item,index) of arr" :key="index">
			<img class="cake_img" :src="arr[index]" alt="">
		</div>
		<!-- 底部详情图片结束 -->
    </div>
    <!-- 底部信息结束 -->
    <!-- ----------------- -->
    <!-- 购物车功能的实现：当点击加入购物车弹出商品提示框 -->
    <van-popup v-model="reveal"  
    closeable close-icon="close"
    round
    position="bottom" :style="{ height: '60%' }">
      <div class="shopping">
      <!-- 购物提示框头像 -->
      <div v-for="(item,index) of shop" 
        :key="index" class="shopping_details">
        <img :src="shop[index]" alt="">
        <span class="prices">￥{{num.toFixed(2)}}</span>
        <span class="prices">已选：{{spanbtn}}{{n}}件</span>
      </div>
      <div id="count">数量
          <span id="add" @click="minish">－</span>
          <span class="span" style="background-color:#fff">{{n}}</span>
          <span id="add" @click="add">＋</span>
      </div>
      <hr>
      <div id="sIzes">
        <div id="first">尺寸</div>
        <div class="measure">
          <span @click="ok(0,'6寸')" :class="disbel==0?enbel:''">6寸</span>
          <span @click="ok(1,'8寸')" :class="disbel==1?enbel:''">8寸</span>
          <span @click="ok(2,'10寸')" :class="disbel==2?enbel:''">10寸</span>
          <span @click="ok(3,'12寸')" :class="disbel==3?enbel:''">12寸</span>
          <span @click="ok(4,'14寸')" :class="disbel==4?enbel:''">14寸</span>
        </div>
      </div>
      <mt-button @click="off(articleInfo)" class="buttons" size="large" type="danger">
          确定
      </mt-button>
    </div>
    </van-popup>
    <!-- ----------------- -->
    <!-- 底部选项卡开始 -->
    <mt-tabbar fixed>
      <mt-tab-item>
          <router-link to="/shopping" >购物车</router-link>

        <img src="../assets/footer/details_shopping.png" alt="" slot="icon"/>
        
        <div id="clocks" v-show="clocks">
          <div @click="guan">
            {{n}} 
          </div>
        </div>
      </mt-tab-item>
      <mt-tab-item>
      <div @click="on">
        <mt-button
          type="danger"
          size="normal"
          class="btn1"
          style="background-color: #401F00"
        >
          加入购物车
        </mt-button>
      </div>
      </mt-tab-item>
      <mt-tab-item>
       <div @click="on">
        <mt-button type="danger" size="normal" class="btn2">
          立即购买
        </mt-button>
       </div>
      </mt-tab-item>
    </mt-tabbar>
    <!-- 底部选项卡结束 -->
  </div>
</template>
<script>
export default {
  data(){
    return{
      showShare: false,
      reveal:false,
      clocks:false,
      show:false,
      flag:-1,
      image:'details_index.png',
      articleInfo:{},
      arr:[],
      lun:[],
      shop:[],
      n:1,
      id:'',
      num:'',
      spanbtn:'',
      enbel:{enbel:true},
      disbel:0,
      options: [
        [
          { name: "微信", icon: "wechat" },
          { name: "微博", icon: "weibo" },
          { name: "QQ", icon: "qq" },
        ],
        [
          { name: "复制链接", icon: "link" },
          { name: "分享海报", icon: "poster" },
          { name: "二维码", icon: "qrcode" },
        ],
      ],
    }
  },
  mounted(){
      // 获取URL的参数
      let id=this.$route.params.id;
      // 向服务器发送请求，以获取数据
      this.axios.get('/details?id='+id).then(res=>{
      this.articleInfo=res.data.articleInfo;
      this.arr=this.articleInfo.cake_detailsImage.split('#');
      for(let i=0;i<this.arr.length;i++){
        this.arr[i]=require(`../assets/cake_good/`+this.arr[i]);
      };
      // console.log(tarticleInfo)
      this.num = this.articleInfo.cake_newPrice;
      // 购物车详情缩略图
      this.shop=this.articleInfo.cake_thumbnail.split('#');
      for(let i=0;i<this.shop.length;i++){
        this.shop[i]=require(`../assets/cake_good/`+this.shop[i]);
      };
      this.lun=this.articleInfo.cake_lunImage.split('#');
      //  console.log(this.articleInfo.cake_lunImage);
      for(let i=0;i<this.lun.length;i++){
        this.lun[i]=require(`../assets/cake_good/`+this.lun[i]);
      }
    });
    this.ok(0,'6寸');
  },
  updated(){
    window.scroll(0,0)
  },
  methods:{
    goBack(){
      history.go(-1)
    },
    minish(){
      if(this.n>1){
        this.n--
        this.num = this.articleInfo.cake_newPrice * this.n;
      }
    },
    add(){
      this.n++
      this.num = this.articleInfo.cake_newPrice * this.n;
    },
    open(){
      this.show=true;
    },
    close(){
      this.show=false;
    },
    start(){
      this.reveal=false;
    },
    on(){
      this.reveal=true;
    },
    off(value){
      this.clocks=true;
      this.$toast({
        message: "添加购物车成功",
        position: "middle",
        duration: 5000,
      });
      this.start();
      this.id=value.id;
      var param = {
        id:this.id,
        n:this.n,
        m:this.spanbtn 
      };
      this.axios.get('/addCart',{params:param}).then((res)=>{
        res = res.data;
        console.log(res);
        if(res.status==='1'){
          var setData = {
            id:value.id,
            cake_newPrice:value.cake_newPrice,
            checked:1,
            cake_size:`${this.spanbtn}`,
            cake_name:value.cake_name,
            cake_thumbnail:value.cake_thumbnail,
            n:this.n
          };
          
          this.$store.commit('updateCartList', setData);
        }console.log(setData);
      })
    },
    regin(){
      this.show=true;
    },
    over(){
      this.show=false;
    },
    // off(){
    //   this.clocks=true;
    //   this.$toast({
    //     message: "添加购物车成功",
    //     position: "middle",
    //     duration: 5000,
    //   });
    //   this.start();
    //   // this.$router.push('/shopping');   
    // },
    guan(){
      this.clocks=false;
    },
    test(){
      if(this.flag==-1){
        this.image=`details_index.png`;
        this.flag=0
      }else{
        this.image=`enabled_index.png`;
        this.flag=-1;
      }
    },
    ok(i,cun){
      this.disbel=i;
      this.spanbtn=cun;
    }
  }
}
</script>
<style scoped>
/* 顶部详情页的颜色样式 */
.mind {
  background-color: #401F00;
  font-size: 16px;
}
.details_img > img {
  width: 25px;
  height: 25px;
  padding-left: 15px;
}
.details_logo {
  width: 100%;
  height: 280px;
  margin-top: 40px;
}
.details_logo img {
  width: 100%;
  height: 100%;
}
.mint-button--normal.btn1,
.mint-button--normal.btn2 {
  width: 125px;
  height: 40px;
  margin-left: 10px;
  border-radius: 40px;
}
div .bear {
  margin-top: 20px;
  margin-left: 15px;
}
div .bear1 {
  margin-top: 15px;
  margin-left: 15px;
}
.details_page {
  border: 1px solid #a5a5a5;
  border-radius: 5px;
  display: flex;
  justify-content: space-around;
  margin: 0;
}
.details_page img {
  margin-top: -3px;
}
.details_page span {
  height: 30px;
  line-height: 30px;
  font-size: 12px;
  display: inline-block;
  padding-left: 20px;
}
#app {
  height: 10px;
  background: #EAEAEA;
}
tr > td:first-child {
  width: 15%;
}
table {
  font-size: 14px;
  line-height: 1.5rem;
  color: gray;
}
.mint-tabbar.is-fixed{
  z-index: 0;
}

/* 给整体加下外边距让页面能够滑动 */
.index {
  margin-bottom: 55px;
  margin-top: 40px;
}
/* 分享提示框的样式开始 */

/* 购物车提示框 */
.shopping{
  width:375px;
  height:400px;
  background-color:#fff;
  position: fixed;
  top:310px;
}
#wechat{
  float: left;
  margin-top: 1rem;
  margin-left: 2rem;
  padding-left: 2.2rem;
}
#wechat>p{
  margin-left: 0.1rem;
  margin-top:0.5rem;
}
/* 分享提示框样式结束 */
.cake_img{
	width: 375px;
  /* margin:0; */
}
.off>img{
  float: right;
}
.shopping_details>img{
  width:90px;
  height: 90px;
  position: absolute;
  box-shadow: -2px -2px 10px #aaa;
  top:-30px;
  left:50px
}
.prices{
  display:block;
  margin-left:160px;
  margin-top: 10px;
}
.shopping #count{
  margin-top: 30px;
  margin-left: 30px;
}
#count>span{
  width:40px;
  height: 20px;
  border: 1px solid #fff;
  display: inline-block;
  line-height: 20px;
  text-align: center;
}
#count>#add{
  background-color:lightgray
}
#sIzes{
  margin-left: 15px;
  margin-top: 10px;
}
#sIzes>#first{
  margin-left: 15px;
}
.measure>.enbel{
  color:#fff;
  background-color:#401F00;
}
.measure>span{
  display: inline-block;
  width: 75px;
  height: 25px;
  text-align: center;
  line-height: 25px;
  border: 1px solid;
  margin-top:0.5rem;
  margin-left:10px;
  border-radius: 10px;
}
.buttons{
  margin-top:30px;
  margin-left: 25px;
  border-radius: 10px;
  width: 330px;
}
#clocks div{
 width: 15px;
 height: 15px;
 background:#D81E06 ;
 color:#fff;
 line-height: 15px;
 border-radius:50%;
 position: absolute;
 top: 2px;
 left: 60px;
}
</style>