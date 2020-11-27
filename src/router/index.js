import Vue from 'vue'
import VueRouter from 'vue-router'
//导入首页
import Home from '../views/Home.vue'
//导入详情页
import Details from '../views/Details.vue'
import Details1 from '../views/Details1.vue'
//导入注册页面
import Register from '../views/Register.vue'
//导入登录页面
import Login from '../views/Login.vue'
//导入商品列表
import Lists from '../views/Lists.vue'
//导入客服
import Ms from '../views/Ms.vue'
//导入购物车
import Shopping from '../views/Shopping.vue'
//导入头像
import Avatar from '../views/Avatar.vue'
//导入收藏列表页
import Collect from '../views/Collect.vue'
//导入反馈表页
import Feedback from '../views/Feedback.vue'
//导入设置页
import Set from '../views/Set.vue'
//导入浏览页
import Recent from '../views/Recent.vue'
//导入订单页
import Order from '../views/Order.vue'
//导入订单查询页
import OrderCheck from '../views/OrderCheck.vue'
//导入我的订单页
import MyOrder from '../views/MyOrder.vue'
import Search from '../views/Search.vue'
//导入地址选择
import Address from '../views/Adress.vue'
//导入订单支付
import OrderPay from '../views/OrderPay.vue'
//导入扫一扫
import Sys from '../views/Sys.vue'
//导入订单成功页面
import OrderSuccess from '../views/OrderSuccess.vue'
//导入底部tab
// import footer from '../components/footer.vue'


//我的页面
import Me from '../views/Me.vue'
Vue.use(VueRouter)

const routes = [
  {
    path:'/ordersuccess',
    component:OrderSuccess
  },
  {
    path:'/sys',
    component:Sys
  },
  {
    path:'/orderpay',
    component:OrderPay
  },
  {
    path:'/address',
    component:Address
  },
  {
    path:'/order',
    component:Order
  },
  {
    path:'/register',
    component:Register
  },
  {
    path:'/search',
    component:Search
  },
  {
    path:'/lists/:id',
    component:Lists
  },
  {
    path:'/ms',
    component:Ms
  },
  {
    path:'/login',
    component:Login
  },
  {
    path: '/me',
    component: Me
  },
  {
    path:'/details/:id',
    component:Details
  },
  {
    path:'/lists/details/:id',
    component:Details1
  },
  {
    path:'/shopping',
    component:Shopping
  },
  {
    path:'/avatar',
    component:Avatar
  },
  {
    path:'/collect',
    component:Collect
  },
  {
    path:'/feedback',
    component:Feedback
  },
  {
    path:'/set',
    component:Set
  },
  {
    path:'/recent',
    component:Recent
  },
  {
    path:'/ordercheck',
    component:OrderCheck
  },
  {
    path:'/myorder',
    component:MyOrder
  },
  {
    path: '/',
    component: Home
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
