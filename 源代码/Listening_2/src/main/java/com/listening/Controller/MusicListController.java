package com.listening.Controller;

import com.listening.Bean.music;
import com.listening.Service.LikeServer;
import com.listening.Service.MusicServer;
import com.listening.util.Code;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * @author Misaka
 */
@RestController
@RequestMapping("/listening")
@CrossOrigin(origins = "*")
public class MusicListController {
    @Autowired
    MusicServer ms;

    @Autowired
    LikeServer ls;

    @PostMapping("/list")
    public Code listaddlike(int userid, int musicid) {
        System.out.println("listaddlike " + musicid + ' ' + userid + " was called");
        return ls.insertlike(userid, musicid);
    }

    @CrossOrigin(origins = "*")
    @GetMapping("/list")
    public List<music> allmusic() {
        System.out.println("allmusc was called");
        return ms.selectall();
    }

    @CrossOrigin(origins = "*")
    @GetMapping("/random")
    public List<music> randommusic() {
        System.out.println("randommusic was called");
        List<music> all = ms.selectall();
        Random random = new Random();
        List<music> ran = new ArrayList<music>();
        int listSize = all.size();
        int numRandomItems = 10;
        for (int i = 0; i < numRandomItems; i++) {
            int ra = random.nextInt(listSize);
            ran.add(all.get(ra));
        }
        System.out.println(ran.toString());
        return ran;
    }

}
