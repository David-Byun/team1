package com.example.demo.mapper;

import com.example.demo.dto.Post;
import com.example.demo.frame.DemoMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostMapper extends DemoMapper<Integer, Post> {
}
