package com.example.demo.controller;

import com.example.demo.dto.Member;
import com.example.demo.dto.MemberLoginDto;
import com.example.demo.dto.Post;
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
    public String kbmae(Model model, HttpSession session) throws Exception {

        List<Member> mlist = null;
        mlist = memberService.getMemberList();
        log.info("mlist={}", mlist);

        Member member = (Member) session.getAttribute("loginmember"); //세션에 담긴 로그인 정보
/*        List<Member> rlist = null; //추천 멤버 리스트
        rlist = memberService.getRecoemendMemberList(member.getMemberId()); //로그인한 내 아이디를 파라미터로 던짐*/

        List<Post> myPosts = null; //내가 PM인 프로젝트 리스트

        //로그인 했을 경우에만 내 프로젝트가 띄워지도록
        if(member != null) {
            myPosts = memberService.getMyPostList(member.getMemberId()); //로그인한 내 아이디를 파라미터로 던짐
        }else {
            myPosts = memberService.getMyPostList("");
        }
        log.info("HASH={}",myPosts.toString());

        model.addAttribute("kbmaelist", mlist);
/*        model.addAttribute("recomendkbmaelist", rlist);*/
        model.addAttribute("myPosts", myPosts);
        model.addAttribute("center","kbmae");
        return "index";
    };

   @GetMapping("/kbmae/findimpl")
    public String findimpl(Model model, SearchKbmae searchKbmae) throws Exception {
        List<Member> findmlist = null;
       findmlist = memberService.getFindKbmae(searchKbmae);
        log.info("mlist={}", findmlist);

        model.addAttribute("kbmaelist", findmlist);
        model.addAttribute("center","kbmae");
        return "index";
    };

}
