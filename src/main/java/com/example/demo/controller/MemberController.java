package com.example.demo.controller;

import com.example.demo.dto.Member;
import com.example.demo.dto.MemberLoginDto;
import com.example.demo.dto.SearchKbmae;
import com.example.demo.service.MemberService;
import com.sun.mail.imap.protocol.Item;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

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

    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session) throws Exception {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/kbmae")
    public String kbmae(Model model) throws Exception {

        List<Member> mlist = null;
        mlist = memberService.getMemberList();
        log.info("mlist={}", mlist);

        model.addAttribute("kbmaelist", mlist);
        model.addAttribute("center","kbmae");
        return "index";
    };

   @GetMapping("/kbmae/findimpl")
    public String findimpl(Model model, SearchKbmae searchKbmae) throws Exception {
        List<Member> fingmlist = null;
        fingmlist = memberService.getFindKbmae(searchKbmae);
        log.info("mlist={}", fingmlist);

        model.addAttribute("kbmaelist", fingmlist);
        model.addAttribute("center","kbmae");
        return "index";
    };

}
