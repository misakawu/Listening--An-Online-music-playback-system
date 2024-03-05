import axios from 'axios'

// 登录接口
export async function login(name, pwd) {
  const response = await axios.get('http://localhost:8888/listening/user/login', {
    params: {
      name: name,
      pwd: pwd
    }

  })
  return response
}

// 退出接口
export async function logout(name) {
  const response = await axios.post('http://localhost:8888/listening/user/logout', {
    name: name
  })
  return response
}
