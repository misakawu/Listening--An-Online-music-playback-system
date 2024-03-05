package com.listening.Service;

import com.listening.Bean.like;
import com.listening.Bean.music;
import com.listening.Mapper.LikeMapper;
import com.listening.Mapper.MusicMapper;
import com.listening.util.Code;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LikeServer {
    @Autowired
    LikeMapper lm;
    @Autowired
    MusicMapper mm;

    public List<music> findbyuserid(int id) {
        List<like> x = lm.findbyuserid(id);
        List<music> want = mm.fuzzysearchmusic("qwe");
        for (like i : x) {
            int qwe = i.getMusicID();
            want.add(mm.selectbyid(qwe));
            System.out.println(qwe);
        }
        return want;
    }

    public like findbymusicid(int id) {
        return lm.findbymusicid(id);
    }

    public Code insertlike(int userid, int musicid) {
        like a = new like();
        a.setUserID(userid);
        a.setMusicID(musicid);
        Code x = new Code(11, "添加收藏失败", "failed");
        try {
            if (lm.insertlike(a) == 1) {
                x.setDescription("添加收藏成功");
                x.setData("success");
                x.setType(10);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public Code deletelike(int userid, String musicname) {
        Code x = new Code(12, "删除收藏失败", "failed");
        try {
            System.out.println(musicname);
            music a = mm.selectbyname(musicname);
            System.out.println(a.toString());
            int id = a.getMusicID();
            if (lm.deletelike(userid, id) == 1) {
                x.setData("success");
                x.setType(13);
                x.setDescription("删除收藏成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public int checkifin(int userid, String musicname) {
        int ret = 0;
        try {
            music x = mm.selectbyname(musicname);
            System.out.println(userid);
            int musicid = x.getMusicID();
            System.out.println(musicid);
            List<like> a = lm.selectbyboth(userid, musicid);
            System.out.println(a.toString());
            if (!a.isEmpty()) {
                ret = 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ret;
    }

}