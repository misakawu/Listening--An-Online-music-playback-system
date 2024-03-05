import axios from 'axios';

export function addLike(userid, musicid) {
    return axios.post('http://localhost:8888/listening/list/', {
        params: {
            userid: userid,
            musicid: musicid
        }
    });
}

// 获取所有音乐列表
export function getAllMusic() {
    return axios.get('http://localhost:8888/listening/list/');
}
