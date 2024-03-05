// 根据ID获取用户
function getUserById(id) {
    return fetch(`/api/user/${id}`)
        .then(response => response.json())
        .then(data => {
            // 处理返回的用户数据
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

// 根据用户名获取用户
function getUserByName(name) {
    return fetch(`/api/user?name=${name}`)
        .then(response => response.json())
        .then(data => {
            // 处理返回的用户数据
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

// 插入用户
function insertUser(user) {
    return fetch('/api/user', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(user)
    })
        .then(response => response.json())
        .then(data => {
            // 处理返回的插入结果
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

// 更新用户密码
function updateUserPassword(id, password) {
    return fetch(`/api/user/${id}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ password })
    })
        .then(response => response.json())
        .then(data => {
            // 处理返回的更新结果
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

// 根据ID删除用户
function deleteUserById(id) {
    return fetch(`/api/user/${id}`, {
        method: 'DELETE'
    })
        .then(response => response.json())
        .then(data => {
            // 处理返回的删除结果
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

// 用户登录
function login(username, password) {
    return fetch(`/api/user/login`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ username, password })
    })
        .then(response => response.json())
        .then(data => {
            // 处理返回的登录结果
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

// 用户登出
function logout(username) {
    return fetch(`/api/user/logout`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ username })
    })
        .then(response => response.json())
        .then(data => {
            // 处理返回的登出结果
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}
