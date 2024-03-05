import Vue from 'vue'  //这里是引入vue文件
import Vuex from 'vuex'
import App from './App'  //这里是引入同目录下的App.vue模块
import store from './store'  //引用store
import router from './router'  //引用路由
import ElementUI from 'element-ui' //引用elementui
import 'element-ui/lib/theme-chalk/index.css' //引用elementui的css样式文件

Vue.use(ElementUI)
Vue.use(Vuex)
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,      //store:将我们创建的Vuex实例挂载到这个vue实例中
  components: { App },
  template: '<App/>'
})

