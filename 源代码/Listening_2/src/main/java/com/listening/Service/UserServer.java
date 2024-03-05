package com.listening.Service;

import com.listening.Bean.user;
import com.listening.Mapper.UserMapper;
import com.listening.util.Code;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServer {
    @Autowired
    UserMapper um;

    public user selectbyid(int id) {
        return um.selectbyid(id);
    }

    public user selectbyname(String name) {
        return um.selectbyname(name);
    }

    public Code insertuser(String username, String pwd) {
        user a = new user();
        a.setManager(0);
        a.setUserName(username);
        a.setUserOffline(1);
        a.setUserPassword(pwd);

        Code x = new Code(14, "注册用户失败", "failed");
        try {
            if (um.insertuser(a) == 1) {
                x.setType(15);
                x.setDescription("注册用户成功");
                x.setData("success");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public int updatapsw(int id, String pwd) {
        return um.updatapsw(id, pwd);
    }

    public int deleteuserbyid(int id) {
        return um.deleteuserbyid(id);
    }

    public int updateoffline(String name, int to, String pwd) {
        return um.updateoffline(name, to, pwd);
    }

    public Code login(String name, String pwd) {
        Code x = new Code();
        x.setType(2);
        x.setData("failed");
        x.setDescription("登录失败");
        try {
            if (!um.login(name, pwd).isEmpty()) {
                x.setType(1);
                x.setData("success");
                x.setDescription("登录成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return x;
    }

    public Code logout(String name) {
        Code x = new Code();
        x.setType(4);
        x.setData("dailed");
        x.setDescription("下线失败");
        try {
            if (um.logout(name) == 1) {
                x.setType(3);
                x.setData("success");
                x.setDescription("下线成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return x;
    }

    public Code deletebyname(String name) {
        Code x = new Code(16, "注销失败", "failed");
        try {
            if (um.deletebyname(name) == 1) {
                x.setType(17);
                x.setDescription("注销成功");
                x.setData("success");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public Code pwdupdate(String name, String oldpwd, String newpwd) {
        Code x = new Code();
        if (um.login(name, oldpwd).isEmpty()) {
            x.setType(18);
            x.setData("failed");
            x.setDescription("原密码匹配错误");
        } else {
            x.setType(19);
            x.setData("failed");
            x.setDescription("密码修改错误");
            try {
                if (um.pwdupdate(name, newpwd) == 1) {
                    x.setType(20);
                    x.setData("success");
                    x.setDescription("密码修改成功");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return x;
    }

}