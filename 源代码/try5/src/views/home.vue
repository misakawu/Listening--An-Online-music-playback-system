<template>
  <el-container>
    <el-aside width="auto">
      <Leftnav></Leftnav>
    </el-aside>
    <el-container>
      <el-header>
        <Headnav></Headnav>
      </el-header>
      <el-container>
        <el-main>
          <Tags></Tags>
          <router-view v-if="!showPlayPage"></router-view>
        </el-main>
      </el-container>
    </el-container>
  </el-container>
</template>

<script>
import Headnav from "@/components/headers"; //头部组件
import Leftnav from "@/components/leftmenu"; //左侧菜单组件
import Tags from "@/components/tags"; //左侧菜单组件
export default {
  name: "home",
  data() {
    return {
      input: '',
      showPlayPage: false,
      musicUrl: '',
      isFavorite: false,
      favoriteList: [] // 存储收藏的歌曲列表
    }
  },
  computed: {
    currentDate() {
      const date = new Date();
      return `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`;
    }
  },
  created() {
  },
  watch: {
  },
  methods: {
    toggleFavorite() {
      this.isFavorite = !this.isFavorite;
      console.log(`Favorite status of ${songName} changed to ${this.isFavorite}`);

      if (this.isFavorite) {
        // 将当前歌曲信息添加到收藏列表
        this.favoriteList.push({
          name: "天外来物",
          time: this.currentDate,
        });
      } else {
        // 从收藏列表中移除当前歌曲信息
        const index = this.favoriteList.findIndex(item => item.name === "天外来物");
        if (index !== -1) {
          this.favoriteList.splice(index, 1);
        }
      }
    },
    playMusic() {
      this.$refs.audioPlayer.play();
    },
    goBack() {
      this.showPlayPage = false;
      this.$router.back();
    },
    redirectToPlay(musicUrl) {
      this.showPlayPage = true;
      this.$router.push({ path: '/play', query: { musicUrl } });
      this.playMusic();
    },
    playMusic() {
      this.$refs.audioPlayer.play();
    }
  },
  components: {
    Leftnav,
    Headnav,
    Tags
  },
  created() {

  },

  mounted() {
  },

};
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
  background: url('/assets/header.jpg') no-repeat;
}

.search {
  width: 50%;
  display: flex;
  margin: 0 315px;
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
  clear: both
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
</style>