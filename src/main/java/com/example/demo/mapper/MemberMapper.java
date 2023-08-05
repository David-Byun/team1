package com.example.demo.mapper;

import com.example.demo.dto.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    Member findMemberById(String memberId);
}
