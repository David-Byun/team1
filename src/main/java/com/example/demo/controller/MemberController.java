package com.example.demo.controller;

import com.example.demo.dto.Member;
import com.example.demo.dto.MemberLoginDto;
import com.example.demo.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/login")
    public String login(MemberLoginDto memberLoginDto, HttpSession session) {
        log.info("===== memberLoginDto : {} =====", memberLoginDto);
        Member foundMember = memberService.findUserById(memberLoginDto.getMemberId());
        log.info("===== foundMember : {} =====", foundMember);
        if (foundMember.getPassword().equals(memberLoginDto.getPassword())) {
            return "redirect:/";
        }
        return "/login";
    }
}
