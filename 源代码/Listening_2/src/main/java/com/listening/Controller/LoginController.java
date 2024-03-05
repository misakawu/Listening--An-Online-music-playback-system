package com.listening.Controller;

import com.listening.Bean.user;
import com.listening.Service.UserServer;
import com.listening.util.Code;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author Misaka
 */
@RestController
@RequestMapping("/listening/user")
@CrossOrigin(origins = "*", allowedHeaders = { "Content-Type", "Authorization" })

public class LoginController {
    @Autowired
    private UserServer us;

    /**
     * @param name
     * @param pwd
     * @return user对象
     */
    @GetMapping("/login")
    public Code login(String name, String pwd) {
        System.out.println(name + " " + pwd);
        System.out.println("login was called");
        try {
            int x = us.updateoffline(name, 0, pwd);
            if (x != 1)
                System.out.println("update offline failled");
            else
                System.out.println("update offline success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us.login(name, pwd);
    }

    /**
     * @param name
     * @return 受影响行数（为1则下线成功）
     */
    @CrossOrigin(origins = "*")
    @PostMapping("/logout")
    public Code logout(String name) {
        System.out.println(name + " logout was called");

        user u = us.selectbyname(name);
        Code x = new Code();

        if (u.getUserOffline() == 1) {
            x.setType(5);
            x.setData("failed");
            x.setDescription("用户不在线");
            return x;
        } else {
            return us.logout(name);
        }
    }

    @GetMapping("/pwdupdate")
    public Code pwdupdate(String name, String oldpwd, String newpwd) {
        System.out.println("name: " + name + " oldpwd: " + oldpwd + " newpwd: " + newpwd);
        System.out.println("pwdupdate was called");
        return us.pwdupdate(name, oldpwd, newpwd);
    }

    @GetMapping("/cancel")
    public Code cancel(String name) {
        return us.deletebyname(name);
    }

    @GetMapping("/signup")
    public Code signup(String username, String pwd) {
        return us.insertuser(username, pwd);
    }
}
