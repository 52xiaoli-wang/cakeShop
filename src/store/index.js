import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import router from '../router'
import { MessageBox } from 'mint-ui'
import { now } from 'core-js'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    cartCount: 0,
    cartList: [],
    haveLen: false,
    totalPrice: 0,
    //1 登录   0 未登录
    isLogined: sessionStorage.getItem('isLogined') || 0,
    //存储登录用户的相关信息
    //sessionStorage.getItem("userInfo")获取的是字符串，需要使用JSON.parse转为对象
    userInfo: JSON.parse(sessionStorage.getItem("userInfo")) || {},
  },
  //修改state中共享状态的操作方法
  mutations: {
    //修改登录状态为1及登录用户的相关信息
    login_mutations(state, payload) {
      //修改登录状态为1
      state.isLogined = 1;
      //修改登录用户的相关信息
      state.userInfo = payload;
    },
    //退出登录
    logout_mutations(state) {
      //修改登录状态为0
      state.isLogined = 0;
      //修改登录用户的相关信息为空对象
      state.userInfo = {};
    },
    // 更新购物车商品数量
    updateCartCount(state, cartNum) {
      var cart = state.cartList;
      state.cartCount = cart.length;
    },
    // 初始化购物车商品数量
    initCartCount(state, cartNum) {
      state.cartCount = cartNum;
    },
    //更新购物车列表
    updateCartList(state, { id, cake_newPrice, checked,cake_size, cake_name, cake_thumbnail, n = 1 }) {
      let cart = state.cartList; // 购物车
      let falg = true;
      let goods = {
        id,
        cake_newPrice,
        cake_name,
        cake_size,
        cake_thumbnail
      };
      if (cart.length) {        // 有内容
        cart.forEach(item => {
          if (item.id === id) {
            if (item.n >= 0) {
              falg = false;
              item.n += n;
            }
          }
        })
      }
      if (!cart.length || falg) {
        goods.n = n;
        goods.checked = '1';
        cart.push(goods);
      }
      state.cartList = cart;
    },
    // 删除购物车商品
    delCartList(state, { productId }) {
      let cart = state.cartList;
      cart.forEach((item, i) => {
        if (item.id === id) {
          cart.splice(i, 1);
        }
      });
      state.cartList = cart;
    },
    // 初始化购物车
    initCartList(state, cartList) {
      state.cartList = cartList;
    },
    updateHaveProduct(state, flag) {
      state.haveLen = flag;
    },
    // 判断购物车是为空
    checkCartLen(state, flag) {
      let len = state.cartCount; // 购物车
      if (len <= 0) {
        state.haveLen = false;
      } else {
        state.haveLen = true;
      }
    },
  },
    actions: {
    login_actions(context, payload) {
      //向服务器发送异步请求
      axios.post('/login', payload).then(res => {
        //登录成功
        if (res.data.code == 1) {
          context.commit("login_mutations", res.data.userInfo);
          //将用户的登录状态保存到webstorage中
          sessionStorage.setItem('isLogined', 1);
          //res.data.userInfo不能被sessionStorage识别{object,object}，需要使用JSON.stringify解析出来
          sessionStorage.setItem('userInfo', JSON.stringify(res.data.userInfo));
          // 页面跳转
          router.push('/me');
          //this.$router.push('/');
        } else {
          MessageBox("登录提示", "用户名或密码错误")
          console.log(res.data.code);
        }
      })
    }
  },
  modules: {
  }
})
