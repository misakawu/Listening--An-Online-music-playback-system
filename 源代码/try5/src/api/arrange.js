// 使用 JavaScript 的 fetch API 发送 GET 请求
fetch('http://localhost:8888/listening/list')
    .then(response => {
        if (response.ok) {
            console.log('连接成功');
            return response.json();
        } else {
            console.log('连接失败');
            throw new Error('连接失败');
        }
    })
    .then(data => {
        // 在这里处理返回的歌曲列表数据
        // 可以对返回的 data 进行排序操作
        // 假设 data 是一个包含歌曲信息的数组，每个对象具有 'name' 和 'likeCount' 属性
        const sortedSongs = data.sort((a, b) => b.like - a.like);

        // 现在 sortedSongs 是按照收藏数降序排序的歌曲列表
        // 可以将它们展示在页面上或进行其他操作
        console.log(sortedSongs);
    })
    .catch(error => {
        // 处理错误情况
        console.error('Error:', error);
    });
