package com.listening.Service;

import com.listening.Bean.music;
import com.listening.Mapper.MusicMapper;
import com.listening.util.Code;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MusicServer {
    @Autowired
    MusicMapper mm;

    public List<music> selectall() {
        return mm.selectall();
    }

    public music selectbyid(int id) {
        return mm.selectbyid(id);
    }

    public music selectbyname(String name) {
        return mm.selectbyname(name);
    }

    public music selectbymusician(String name) {
        return mm.selectbymusician(name);
    }

    public int insertmusic(music a) {
        int x = 0;
        try {
            x = mm.insertmusic(a);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public Code deletebyid(int id) {
        Code x = new Code();
        x.setType(7);
        x.setData("failed");
        x.setDescription("删除" + id + "号失败，不存在");
        try {
            if (mm.deletebyid(id) == 1) {
                x.setType(6);
                x.setData("success");
                x.setDescription("删除" + id + "号成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return x;
    }

    public int updatelikebyid(int id, int like) {
        return mm.updatelikebyid(id, like);
    }

    public List<music> fuzzysearch(String key) {
        List<music> a = mm.fuzzysearchmusic(key);
        List<music> b = mm.fuzzysearchmusician(key);
        a.addAll(b);
        System.out.println(a.toString());
        return a;
    }
}