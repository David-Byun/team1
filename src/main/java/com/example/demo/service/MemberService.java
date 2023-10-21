package com.example.demo.service;

import com.example.demo.dto.Member;
import com.example.demo.dto.SearchKbmae;
import com.example.demo.mapper.MemberMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberService {

    private final MemberMapper memberMapper;
    public Member findUserById(String memberId) {
        return memberMapper.findMemberById(memberId);
    }

    public List<Member> getMemberList() throws Exception {
        return memberMapper.getMemberList();
    }
    public List<Member> getSkillList() throws Exception {
        return memberMapper.getSkillList();
    }

    public Page<Member> getFindKbmae(int pageNo, SearchKbmae searchKbmae) throws Exception {
        PageHelper.startPage(pageNo, 3);
        return memberMapper.getFindKbmae(searchKbmae);
    }
}
