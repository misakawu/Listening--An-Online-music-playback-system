package com.listening.Mapper;

import com.listening.Bean.user;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {
    @Select("select * from user where UserID = #{id}")
    user selectbyid(int id);

    @Select("select * from user where UserName = #{name}")
    user selectbyname(String name);

    @Insert("insert into user values(#{UserID}, #{UserName}, #{UserPassword}, #{UserOffline}, #{Manager})")
    int insertuser(user a);

    @Update("update user set UserPassword=#{pwd} where UserID = #{id}")
    int updatapsw(int id, String pwd);

    @Delete("delete from user where UserID = #{id}")
    int deleteuserbyid(int id);

    @Select("select * from user where UserName = #{name} and UserPassword = #{pwd}")
    List<user> login(@Param("name") String name, @Param("pwd") String pwd);

    @Update("update user set UserOffline=#{to} where UserName = #{name} and UserPassword = #{pwd}")
    int updateoffline(@Param("name") String name, @Param("to") int to, @Param("pwd") String pwd);

    @Update("update user set UserOffline=1 where UserName = #{name}")
    int logout(@Param("name") String name);

    @Delete("delete from user where UserName=#{name}")
    int deletebyname(@Param("name") String name);

    @Update("update user set UserPassword=#{pwd} where Username=#{name}")
    int pwdupdate(@Param("name") String name, @Param("pwd") String pwd);

}