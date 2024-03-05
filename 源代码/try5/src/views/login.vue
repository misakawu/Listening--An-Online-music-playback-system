<template>
  <div class="flex-container">
    <div class="header">
      <span id="title">Listening</span>
      <span class="subtitle">在线音乐播放平台</span>
    </div>
    <div class="main">
      <el-form :model="form" :rules="rules" ref="form">
        <el-form-item prop="username">
          <el-input placeholder="请输入账号" @input="setAccount" prefix-icon="el-icon-user" v-model="form.username"
            style="width: 300px;">
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input placeholder="请输入密码" @input="setPassword" prefix-icon="el-icon-lock" v-model="form.password"
            style="width: 300px;" show-password></el-input>
        </el-form-item>
        <el-form-item>
          <sliderverify ref="slider"></sliderverify>
        </el-form-item>
        <el-form-item>
          <el-checkbox v-model="form.checked">记住密码</el-checkbox>
        </el-form-item>
        <div class="form-buttons">
          <el-form-item>
            <el-button type="primary" class="custom-button" style="width: 200%;" :loading="loginbtn"
              @click="submitForm('form')">登录</el-button>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" class="custom-button" style="width: 200%;" :loading="loginbtn"
              @click="gotoRegister('form')">注册</el-button>
          </el-form-item>
        </div>
      </el-form>
    </div>
    <p class="notice">没有账号请先注册</p>
    <div class="footer">
      <p>
        <span><a href="javascript:void(0);">帮助</a></span>
        <span><a href="javascript:void(0);">关于</a></span>
        <span><a href="javascript:void(0);">更多</a></span>
      </p>
    </div>
  </div>
</template>

<script>
import sliderverify from '../components/sliderverify.vue'
import { login } from '../api/login'
import { signup } from '../api/register'
export default {
  name: 'login',
  data() {
    return {
      form: {
        username: '',
        password: '',
        checked: false,
        loginbtn: false,
      },
      loginbtn: false,
      rules: {
        username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
        password: [{ required: true, message: '请输入密码', trigger: 'blur' }]
      }
    }
  },
  components: {
    sliderverify
  },
  methods: {
    // 登录方法
    submitForm() {
      this.loginbtn = true
      if (this.$refs['slider']) {
        // 未通过验证时，提示错误信息并返回
        if (!this.$refs['slider'].confirmSuccess) {
          this.loginbtn = false
          this.$message.error('请拖动滑块验证')
          return false
        } else {
          this.$refs.form.validate((valid) => {
            if (valid) {
              console.log(this.form.username, this.form.password);
              console.log(login(this.form.username, this.form.password))
              login(this.form.username, this.form.password).then(
                res => {
                  // 在控制台查看data
                  console.log(res.data.type);
                  if (res.data.type == 1) {
                    // console.log(data.data)
                    this.$notify({
                      title: '登录成功',
                      message: '您好，欢迎回来',
                      type: 'success',
                      duration: 3000
                    });
                    this.$router.push({ path: '/index' });
                  } else {
                    console.log(res.data.type)
                    // 登录失败的处理逻辑
                    this.$notify({

                      title: '登录失败',
                      message: '请检查用户名和密码',
                      type: 'error',
                      duration: 3000
                    });

                    setTimeout(() => {
                      location.reload(); // Refresh the page
                    }, 1000)
                  }
                }).catch(err => {
                  console.log(err);
                  // 异常处理逻辑
                  this.$notify({
                    title: '登录异常',
                    message: '登录过程出现异常，请稍后再试',
                    type: 'error',
                    duration: 3000
                  });
                });
            }

          })
        }
      }
    },
    setAccount(value) {
      console.log(value)
      this.form.username = value
    },
    setPassword(value) {
      console.log(value)
      this.form.password = value
    },
    gotoRegister() {
      // 表单验证逻辑
      if (!this.$refs['slider'].confirmSuccess) {
        this.loginbtn = false
        this.$message.error('请拖动滑块验证')
        return false
      } else {
        this.$refs.form.validate(valid => {
          if (valid) {
            // 调用注册接口进行注册操作
            signup(this.form.username, this.form.password)
              .then(res => {
                // 注册成功的处理逻辑
                // 调用登录接口进行自动登录
                login(this.form.username, this.form.password)
                  .then(loginRes => {
                    // 获取登录凭证或令牌，并保存到本地
                    const token = loginRes.data.token;
                    // 将token保存到本地，例如使用浏览器的Cookie或LocalStorage

                    // 自动跳转到指定页面
                    this.$router.push({ path: '/index' });
                    this.$notify({
                      title: '注册并登录成功',
                      message: '您好，欢迎使用',
                      type: 'success',
                      duration: 3000
                    });
                  })
                  .catch(loginErr => {
                    // 自动登录失败的处理逻辑
                    console.error('自动登录失败', loginErr);
                  });
              })
              .catch(registerErr => {
                // 注册失败的处理逻辑
                console.error('注册失败', registerErr);
              });
          }
        });
      }
    }
  }
}
</script>
<style scoped>
.flex-container {
  display: flex;
  height: 120vh;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: url('../assets/back7.jpg') no-repeat;
  background-size: cover;
}

.header {
  width: 100%;
  display: flex;
  margin: 100px 0 30px 0;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-size: 25px;
  font-family: "楷体", Kaiti, sans-serif;
}

.subtitle {
  margin-top: 10px;
}

.custom-button {
  font-size: 15px;
}

.form-buttons {
  display: flex;
  justify-content: flex-start;
}

.form-buttons>*:not(:last-child) {
  margin-right: 90px;
}

.header #title {
  font-size: 50px;
  font-family: cursive, sans-serif;
}

.main {
  width: 500px;
  height: 400px;
  display: flex;
  padding-top: 23px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  border-radius: 30px;
  box-shadow: 0 1px 30px rgb(215, 233, 204);
  background-color: rgb(239, 246, 215);
}

.footer {
  width: 100%;
  display: flex;
  margin-top: 300px;
  flex-direction: column;
  align-items: center;
  line-height: 5px;
  color: rgba(0, 0, 0, .5);
}

.footer span {
  padding: 0 15px;
}

.footer a {
  padding: 0 5px;
  color: rgba(0, 0, 0, .5);
  text-decoration: none;
}

.footer a:hover {
  color: rgba(0, 0, 0, 1);
}

.notice {
  font-size: 15px;
  position: absolute;
  top: 77%;
  left: 57%;
}
</style>
