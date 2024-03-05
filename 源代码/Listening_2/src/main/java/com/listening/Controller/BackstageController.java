package com.listening.Controller;

import com.listening.Bean.music;
import com.listening.Service.MusicServer;
import com.listening.util.Code;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Misaka
 */

@RestController
@RequestMapping("/backstage")
public class BackstageController {
    @Autowired
    MusicServer ms;

    @GetMapping("/")
    public List<music> backstagelist(){
        return ms.selectall();
    }

    @GetMapping("/delete")
    public Code deletebyid(int id){
        System.out.println(id+" delectbyid was called");
        return ms.deletebyid(id);
    }

    @PostMapping("/insert")
    public Code insertmusic(String musicname,String musicianname,String musicdata,String musicbackground){
        music a=new music();
        a.setLike(0);
        a.setMusicBackground(musicbackground);
        a.setMusicData(musicdata);
        a.setMusicianName(musicianname);
        a.setMusicName(musicname);

        System.out.println("insertmusic was called");
        Code x= new Code();
        if (ms.insertmusic(a)==1){
            x.setType(8);
            x.setData("success");
            x.setDescription("增加"+musicname+"成功");
        }else{
            x.setType(9);
            x.setData("failed");
            x.setDescription("增加"+musicname+"失败");
        }
        return x;
    }
}
