import axios from 'axios';

// 模糊搜索音乐
export function searchMusic(key) {
    return axios.get('http://localhost:8888/listening/search', {
        params: {
            key: key
        }
    });
}