/*左侧菜单页面*/
<template>
  <div class="leftmenu">
    <el-menu class="el-menu-vertical" :collapse="this.$store.state.isCollapse" :default-active="$route.name" unique-opened
      router>
      <div class="logo">
        <span v-if="this.$store.state.isCollapse">菜单</span>
        <span v-else>菜单</span>
      </div>
      <template v-for="item in navlist">
        <template v-if="item.children.length > 0">
          <el-submenu :index="item.name">
            <template slot="title">
              <i class="el-icon-trophy"></i>
              <span>{{ item.lable }}</span>
            </template>
            <el-menu-item :index="itemchilder.name" v-for="itemchilder in item.children" :key="itemchilder.menuid"
              @click=clickMenu(itemchilder)>
              <i :class="itemchilder.icon"></i>
              <span slot="title">{{ itemchilder.lable }}</span>
            </el-menu-item>
          </el-submenu>
        </template>
        <template v-else>
          <el-menu-item :index="item.name" @click=clickMenu(item)>
            <i :class="item.icon"></i>
            <span slot="title">{{ item.lable }}</span>
          </el-menu-item>
        </template>
      </template>
    </el-menu>
  </div>
</template>

<script>
export default {
  data() {
    return {
      navlist: [
        {
          'menuid': 1,
          'path': '',
          'name': 'index',
          'lable': '首页',
          'icon': 'el-icon-house',
          'children': []
        },
        {
          'menuid': 5,
          'path': '',
          'name': 'power',
          'lable': '歌曲榜单',
          'icon': 'el-icon-trophy',
          'children': [
            {
              'menuid': 6,
              'path': '/Chinese',
              'name': 'Chinese',
              'lable': '华语榜单',
              'icon': 'el-icon-trophy'
            },
            {
              'menuid': 7,
              'path': '/foreign',
              'name': 'foreign',
              'lable': '欧美榜单',
              'icon': 'el-icon-trophy'
            },
            {
              'menuid': 8,
              'path': '/hot',
              'name': 'hot',
              'lable': '热门榜单',
              'icon': 'el-icon-trophy'
            }
          ]
        },
        {
          'menuid': 2,
          'path': '/arrange',
          'name': 'arrange',
          'lable': '歌曲排行',
          'icon': 'el-icon-medal',
          'children': []
        },
        {
          'menuid': 3,
          'path': '/favorites',
          'name': 'favorites',
          'lable': '我的收藏',
          'icon': 'el-icon-star-off',
          'children': []
        },
      ]
    }
  },
  computed: {
  },
  methods: {
    clickMenu(item) {
      // 将数据存入全局变量中
      if (item.lable !== '首页') {
        this.$store.commit('selectMenu', item)
      }
      // 根据菜单项的路径进行页面导航
      if (this.$route.name !== item.name) {
        this.$router.push({ name: item.name })
      }
    }
  }
}
</script>
<style scoped>
.leftmenu {
  width: auto;
  height: 100%;
  overflow-x: hidden;
}

.leftmenu::-webkit-scrollbar {
  width: 0;
}

.el-menu-vertical:not(.el-menu--collapse) {
  width: 200px;
}

.logo {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 60px;
  width: auto;
  font-size: 24px;
}
</style>
