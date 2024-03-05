<template>
  <el-container>
    <div class="pages">
      <div v-if="!showPlayPage">
        <el-input class="search" v-model="input" placeholder="搜索歌曲名/歌手名" @keyup.enter.native="redirectToSearch"
          @input="setsearch"></el-input>
      </div>
      <div v-if="!showPlayPage">
        <el-carousel :interval="4000" type="card" height="240px">
          <el-carousel-item v-for="(item, index) in images" :key="index + 'a'">
            <img :src="item.url" />
          </el-carousel-item>
        </el-carousel>
      </div>
      <div v-if="!showPlayPage">
        <el-row class="cards-row" :gutter="0" style="margin: 25px 10px; padding-left: 60px;">
          <el-col :span="8">
            <el-card :body-style="{ padding: '0px' }" class="custom-card">
              <img
                src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F93f99c44-7898-4cd2-8998-570921397791%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1690616014&t=82d18ec094bda65c8921198a88fbc594"
                class="image" />
              <div style="padding: 7px; display: flex; align-items: center;" class="word1">
                <span style="flex: 1;">天外来物</span>
              </div>
              <audio ref="audioPlayer" :src="musicUrl"></audio>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card :body-style="{ padding: '0px' }" class="custom-card">
              <img src="https://hbimg.b0.upaiyun.com/2991ccfa64e2a87f7f98c5a04aea253e18ee08b44e70d-tNjn57_fw658"
                class="image" />
              <div style="padding: 4px; display: flex; align-items: center; margin: 0px 60px">
                <span style="flex: 1;">光年之外</span>
              </div>
              <audio ref="audioPlayer" :src="musicUrl"></audio>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card :body-style="{ padding: '0px' }" class="custom-card">
              <img src="https://img1.baidu.com/it/u=2885176988,3863934919&fm=253&fmt=auto&app=138&f=JPEG?w=509&h=500"
                class="image" />
              <div style="padding: 1px; display: flex; align-items: center; margin: 0px 60px">
                <span style="flex: 1;">雅俗共赏</span>
                <div>
                </div>
              </div>
              <audio ref="audioPlayer" :src="musicUrl"></audio>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card :body-style="{ padding: '0px' }" class="custom-card">
              <img
                src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fb118de33-3151-4234-aeac-7a633bfbbb56%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1690701256&t=263af38336e37477769bcdc99562d7a9"
                class="image" />
              <div style="padding: 3px; display: flex; align-items: center; margin: 0px 60px">
                <span style="flex: 1;">演员</span>
                <div>
                </div>
              </div>
              <audio ref="audioPlayer" :src="musicUrl"></audio>
            </el-card>
          </el-col>
        </el-row>
      </div>
      <div v-if="showPlayPage">
        <router-view></router-view>
        <el-button class="button" @click="goBack">
          返回
        </el-button>
      </div>
    </div>
  </el-container>
</template>

<script>
import Headnav from '@/components/headers' // 头部组件
import Leftnav from '@/components/leftmenu' // 左侧菜单组件
import Tags from '@/components/tags' // 左侧菜单组件
import { insertLike } from '../../api/like'
export default {
  name: 'home',
  data() {
    return {
      input: '',
      showPlayPage: false,
      musicUrl: '',
      isFavorite: false,
      tableData: [], // 存储收藏的歌曲列表
      images: [
        { url: require('../../assets/1.jpg'), isFavorite: false },
        { url: require('../../assets/2.jpg'), isFavorite: false },
        { url: require('../../assets/3.jpg'), isFavorite: false },
        { url: require('../../assets/4.jpg'), isFavorite: false }
      ]
    }
  },
  computed: {
    currentDate() {
      const date = new Date()
      return `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`
    }
  },
  created() {
    this.$router = router
  },
  watch: {},
  methods: {
    toggleFavorite(tableData) {
      // 在本地切换收藏状态
      console.log(tableData);
      tableData.isFavorite = !tableData.isFavorite;
      console.log(tableData.isFavorite)

      insertLike(1, tableData.musicID);
    },
    playMusic() {
      this.$refs.audioPlayer.play()
    },
    goBack() {
      this.showPlayPage = false
      this.$router.back()
    },
    redirectToPlay(musicUrl) {
      this.showPlayPage = true
      this.$router.push({ path: '/play', query: { musicUrl } })
      this.playMusic()
    },
    redirectToSearch() {
      // 跳转到搜索页面，并将搜索关键字作为参数传递
      this.$router.push({ path: '/search', query: { keyword: this.input } })
      console.log(this.input)
    },
    setsearch(value) {
      this.input = value
      console.log(value)
    }
  },
  components: {
    Leftnav,
    Headnav,
    Tags
  },
  created() { },

  mounted() { }
}
</script>

<style scoped>
.el-header,
.el-main {
  padding: 0px;
}

.el-header {
  background-color: #f5f5f5;
}

.el-aside {
  height: 100vh;
}

.el-main {
  height: 100vh;
  background-color: rgb(239, 246, 215);
}

.pages {
  height: calc(100% - 130px);
  margin: 5px;
  padding: 10px;
  background: url("/assets/header.jpg") no-repeat;
}

.search {
  width: 50%;
  display: flex;
  margin: 12px 315px 30px 315px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.button {
  padding: 0;
  float: right;
}

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}

.cards-row {
  display: flex;
}

.custom-card {
  width: 70%;
  height: 240px;
  padding: 0px;
  box-sizing: border-box;
  transition: box-shadow 0.3s ease;
}

.icon-large {
  font-size: 24px;
}

.custom-card:hover {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

.favorite {
  font-size: 20px;
}

.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

img {
  /*设置图片宽度和浏览器宽度一致*/
  width: 100%;
  height: inherit;
}

.word1 {
  margin: 0px 60px;
}
</style>
