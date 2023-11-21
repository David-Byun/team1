package com.example.demo.mapper;

import com.example.demo.dto.Member;
import com.example.demo.dto.Post;
import com.example.demo.dto.SearchKbmae;
import com.example.demo.frame.DemoMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper extends DemoMapper<Integer, Member> {
    Member findMemberById(String memberId);

    List<Member> getMemberList();

    List<Member> getSkillList();
    List<Member> getFindKbmae(SearchKbmae searchKbmae);
    List<Member> getRecoemendMemberList(String memberId);
    List<Post> getMyPostList(String memberId);

}
