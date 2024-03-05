import axios from 'axios';

// 注册接口
export async function signup(username, password) {
    try {
        const response = await axios.get('http://localhost:8888/listening/user/signup', {
            params: {
                username: username,
                pwd: password
            }
        });
        return response.data;
    } catch (error) {
        // 处理错误
        console.error(error);
        throw new Error('注册请求失败');
    }
}
