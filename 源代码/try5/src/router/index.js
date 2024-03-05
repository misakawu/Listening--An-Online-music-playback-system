/*路由配置*/
import Vue from 'vue';
import Router from 'vue-router';
import favorites from '@/views/file/favorites';

Vue.use(Router);

const routes = [
  {
    path: '/',
    redirect: '/login' /*重定向页面*/
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('@/views/login.vue'),
    meta: { title: '登录' }
  },
  {
    path: '/', //跳转后路径显示
    name: 'home',
    component: () => import('@/views/home.vue'),
    meta: { title: '主页' },
    children: [
      {
        path: '/index',
        name: 'index',
        component: () => import('@/views/public/index.vue'),
        meta: { keepAlive: true, title: '首页' }
      },
      {
        path: '/Chinese',
        name: 'Chinese',
        component: () => import('@/views/power/Chinese.vue'),
        meta: { keepAlive: true, title: '华语榜单' }
      },
      {
        path: '/foreign',
        name: 'foreign',
        component: () => import('@/views/power/foreign.vue'),
        meta: { keepAlive: true, title: '欧美榜单' }
      },
      {
        path: '/hot',
        name: 'hot',
        component: () => import('@/views/power/hot.vue'),
        meta: { keepAlive: true, title: '热门榜单' }
      },
      {
        path: '/record',
        name: 'record',
        component: () => import('@/views/file/record.vue'),
        meta: { keepAlive: true, title: '播放记录' }
      },
      {
        path: '/arrange',
        name: 'arrange',
        component: () => import('@/views/file/arrange.vue'),
        meta: { keepAlive: true, title: '歌曲排行' }
      },
      {
        path: '/play',
        name: 'PlayPage',
        component: () => import('@/views/public/play.vue'),
        meta: { keepAlive: false, title: '播放页面' }
      },
      {
        path: '/favorites',
        name: 'favorites',
        component: () => import('@/views/file/favorites.vue'),
        meta: { keepAlive: true, title: '我的收藏' }
      },
      {
        path: '/search',
        name: 'search',
        component: () => import('@/views/public/search.vue'),
        meta: { keepAlive: true, title: '搜索页面' }
      },
    ]
  },
];

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
});

export default router;