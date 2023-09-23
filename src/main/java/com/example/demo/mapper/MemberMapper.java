package com.example.demo.mapper;

import com.example.demo.dto.Member;
import com.example.demo.dto.Post;
import com.example.demo.frame.DemoMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper extends DemoMapper<Integer, Member> {
    Member findMemberById(String memberId);
}
