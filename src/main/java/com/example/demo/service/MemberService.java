package com.example.demo.service;

import com.example.demo.dto.Member;
import com.example.demo.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberService {

    private final MemberMapper memberMapper;
    public Member findUserById(String memberId) {
        return memberMapper.findMemberById(memberId);
    }

}
