package com.listening.Controller;

import com.listening.Bean.music;
import com.listening.Service.LikeServer;
import com.listening.util.Code;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author hahahai
 *
 * @函数1 public List<like> selectbyuid(@PathVariable int id)
 */
@RestController
@RequestMapping("/listening/like")
public class UserLikeController {
    @Autowired
    LikeServer ls;

    @CrossOrigin(origins = "*")
    @GetMapping("/{userid}")
    public List<music> selectbyuid(@PathVariable int userid) {
        System.out.println("selectbyuid was called");
        return ls.findbyuserid(userid);
    }

    @CrossOrigin(origins = "*")
    @GetMapping("/delete")
    public Code deletelike(int userid, String musicname) {
        System.out.println("deletelike was called");
        return ls.deletelike(userid, musicname);
    }

    @CrossOrigin(origins = "*")
    @GetMapping("/")
    public Code insertlike(int userid, int musicid) {
        System.out.println("insertlike was called");
        return ls.insertlike(userid, musicid);
    }

    @CrossOrigin(origins = "*")
    @GetMapping("/check")
    public int checkifin(int userid, String musicname) {
        System.out.println("checkifin was called");
        return ls.checkifin(userid, musicname);
    }
}
