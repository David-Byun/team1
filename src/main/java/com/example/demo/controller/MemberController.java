package com.example.demo.controller;

import com.example.demo.dto.Member;
import com.example.demo.dto.MemberLoginDto;
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
    public String login(Model model,MemberLoginDto memberLoginDto, HttpSession session) {
        try{
            Member foundMember = memberService.findUserById(memberLoginDto.getMemberId());
            if (foundMember.getPassword().equals(memberLoginDto.getPassword())) {
                session.setAttribute("loginmember", foundMember);
                model.addAttribute("center", "center");
            }else {
                model.addAttribute("center", "login");
            }
        }catch (Exception e){ //존재하지 않는 id 입력 시 white label 발생하여 try catch 사용
            model.addAttribute("center", "login");
        };
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session) throws Exception {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @GetMapping("/kbmae")
    public String kbmae(Model model) throws Exception {
        List<Member> mlist = null;
        mlist = memberService.getMemberList();
        log.info("mlist={}", mlist);
        model.addAttribute("kbmaelist", mlist);

//        List<Member> slist = null;
/*      slist = memberService.getSkillList();
        model.addAttribute("skilllist", slist);
        log.info("slist={}", slist);*/
        model.addAttribute("center","kbmae");
        return "index";
    };

    @GetMapping("/mypage")
    public String mypage(Model model) throws Exception {
        model.addAttribute("center", "myPage");
        return "index";
    }
    @GetMapping("/projectHistory")
    public String projectHistory(Model model) throws Exception {
        model.addAttribute("center", "projectHistory");
        return "index";
    }
}
