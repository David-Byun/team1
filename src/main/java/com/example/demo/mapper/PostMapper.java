package com.example.demo.mapper;

import com.example.demo.dto.Post;
import com.example.demo.frame.DemoMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper extends DemoMapper<Integer, Post> {
    List<String> findHashTagList(int projectId);

    //sunmi
    Integer getLastPostId() throws Exception;
    //sunmi
    List<Integer> findTagNoList(int projectId);
}
