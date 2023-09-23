package com.example.demo.mapper;

import com.example.demo.dto.PostDetail;
import com.example.demo.frame.DemoMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostDetailMapper extends DemoMapper<Integer, PostDetail> {
}
