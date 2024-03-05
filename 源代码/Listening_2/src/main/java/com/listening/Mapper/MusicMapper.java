package com.listening.Mapper;

import com.listening.Bean.music;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MusicMapper {
    @Select("select * from music where MusicID = #{id}")
    music selectbyid(int id);

    @Select("select * from music where MusicName = #{musicname}")
    music selectbyname(@Param("musicname") String musicname);

    @Select("select * from music where Musician = #{name}")
    music selectbymusician(String name);

    @Select("select * from music")
    List<music> selectall();

    @Select("select * from music where MusicName like ConCAT ('%',#{key},'%')")
    List<music> fuzzysearchmusic(@Param("key") String key);

    @Select("select * from music where MusicianName like ConCAT ('%',#{key},'%')")
    List<music> fuzzysearchmusician(@Param("key") String key);

    @Insert("insert into music values(#{musicID},#{musicName},#{musicianName},#{musicBackground},#{musicData},#{Like})")
    int insertmusic(music a);

    @Delete("delete from music where MusicID=#{id}")
    int deletebyid(@Param("id") int id);

    @Update("update music set Like=#{like} where MusicID=#{id}")
    int updatelikebyid(int id, int like);
}
