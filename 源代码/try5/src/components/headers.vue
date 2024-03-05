<template>
  <!-- 页面头部部分 -->
  <div class="header">
    <div class="shrink">
      <i v-if="this.$store.state.isCollapse" class="el-icon-s-unfold" @click="isCollapses"></i>
      <i v-else class="el-icon-s-fold" @click="isCollapses"></i>
    </div>
    <div class="header-right">
      <div class="header-user-con">
        <!-- 用户头像 -->
        <div class="user-avator">
          <img src="../assets/head.jpg" />
        </div>
        <!-- 用户下拉菜单 -->
        <el-dropdown class="user-name" trigger="click" @command="handleCommand">
          <span class="el-dropdown-link"> {{ username }} <i class="el-icon-caret-bottom"></i></span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item command="loginout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      oldPassword: '',
      newPassword: '',
      confirmPassword: ''
    }
  },
  computed: {
    username() {
      return localStorage.getItem('ms_username') || '用户'
    }
  },
  created() {

  },
  methods: {
    // 菜单是否收缩
    isCollapses() {
      this.$store.commit('collapse')
    },
    handleCommand(command) { // 用户下拉菜单选择事件
      if (command == 'loginout') {
        // localStorage.removeItem('ms_username');
        this.$router.push({ path: '/login' })
      }
    },
    showChangePasswordDialog() {

    }
  }
}
</script>

<style scoped>
.header {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  width: 100%;
  height: 60px;
  font-size: 22px;
  background: url('../assets/header1.jpg') no-repeat;
  background-size: cover;
}

.shrink {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  cursor: pointer;
}

.shrink i {
  padding: 0 15px;
}

/* --------------- 用户头像区域的样式 ---------------- */
.header-right {
  display: flex;
  padding-right: 30px;
}

.header-user-con {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 60px;
}

.user-avator {
  margin-left: 20px;
}

.user-avator img {
  display: block;
  width: 40px;
  height: 40px;
  border-radius: 50%;
}

.user-name {
  margin-left: 10px;
}

.el-dropdown-link {
  cursor: pointer;
}

.el-dropdown-menu__item {
  text-align: center;
}
</style>
