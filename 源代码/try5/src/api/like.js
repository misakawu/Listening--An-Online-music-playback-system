import axios from 'axios';

// 调用后端的selectbyuid接口
export async function getMusicListByUserId(userid) {
    const url = `http://localhost:8888/listening/like/${userid}`;

    return axios.get(url)
        .then(response => {
            console.log(response.data);
            // 处理成功响应
            return response.data;
        })
        .catch(error => {
            console.error(error);
            // 处理错误响应
            throw error;
        });
}

// 调用后端的deletelike接口
export async function deleteLike(userid, musicname) {
    const url = `http://localhost:8888/listening/like/delete`;

    return axios.get(url, {
        params: {
            userid: userid,
            musicname: musicname
        }
    })
        .then(response => {
            console.log(response.data);
            // 处理成功响应
            return response.data;
        })
        .catch(error => {
            console.error(error);
            // 处理错误响应
            throw error;
        });
}

// 调用后端的insertlike接口
export async function insertLike(userid, musicid) {
    const url = `http://localhost:8888/listening/like/`;

    return axios.get(url, {
        params: {
            userid: userid,
            musicid: musicid
        }
    })
        .then(response => {
            console.log(response.data);
            // 处理成功响应
            return response.data;
        })
        .catch(error => {
            console.error(error);
            // 处理错误响应
            throw error;
        });
}

export async function checkifin(userid, musicname) {
    const url = `http://localhost:8888/listening/like/check`;

    try {
        const response = await axios.get(url, {
            params: {
                userid: userid,
                musicname: musicname
            }
        });

        console.log(response.data);
        // 处理成功响应
        return response.data;
    } catch (error) {
        console.error(error);
        // 处理错误响应
        throw error;
    }
}
