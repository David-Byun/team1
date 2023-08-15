package com.example.demo.controller;

import com.example.demo.dto.Member;
import com.example.demo.dto.MemberLoginDto;
import com.example.demo.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/login")
    public String login(MemberLoginDto memberLoginDto, HttpSession session) {

        Member foundMember = memberService.findUserById(memberLoginDto.getMemberId());
        if (foundMember.getPassword().equals(memberLoginDto.getPassword())) {
            session.setAttribute("loginmember", foundMember);
            return "redirect:/";
        }
        return "/login";
    }

}
