package com.example.demo.controller;

import com.example.demo.dto.*;
import com.example.demo.service.MemberService;
import com.example.demo.service.PostService;
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
    private final PostService postService;

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
    public String kbmae(Model model, HttpSession session,SearchKbmae searchKbmae) throws Exception {
        log.info("searchKbmae={}",searchKbmae.toString());
        List<Member> mlist = null;
        if(searchKbmae.equals("") || searchKbmae == null){
        mlist = memberService.getMemberList();
        }else{
        mlist = memberService.getFindKbmae(searchKbmae);
        }
        log.info("mlist={}", mlist);

        Member member = (Member) session.getAttribute("loginmember"); //세션에 담긴 로그인 정보

        List<Post> myPosts = null; //내가 PM인 프로젝트 리스트

        //로그인 했을 경우에만 내 프로젝트가 띄워지도록
        if(member != null) {
            myPosts = memberService.getMyPostList(member.getMemberId()); //로그인한 내 아이디를 파라미터로 던짐
        }else {
            myPosts = memberService.getMyPostList("");
        }
        log.info("HASH={}",myPosts.toString());

        model.addAttribute("kbmaelist", mlist);
        model.addAttribute("myPosts", myPosts);
        model.addAttribute("center","kbmae");
        return "index";
    };

   @RequestMapping("/kbmae/findimpl")
    public String findimpl(Model model, SearchKbmae searchKbmae, HttpSession session) throws Exception {

        List<Member> findmlist = null;
        findmlist = memberService.getFindKbmae(searchKbmae);
        log.info("mlist={}", findmlist);

        Member member = (Member) session.getAttribute("loginmember"); //세션에 담긴 로그인 정보

        List<Post> myPosts = null; //내가 PM인 프로젝트 리스트

       //로그인 했을 경우에만 내 프로젝트가 띄워지도록
       if(member != null) {
           myPosts = memberService.getMyPostList(member.getMemberId()); //로그인한 내 아이디를 파라미터로 던짐
       }else {
           myPosts = memberService.getMyPostList("");
       }
       log.info("HASH={}",myPosts.toString());

        model.addAttribute("kbmaelist", findmlist);
        model.addAttribute("myPosts", myPosts);
        model.addAttribute("center","kbmae");
        return "index";
    };

    @GetMapping("/myPage")
    public String myPage(Model model, HttpSession session) throws Exception {
        Member member =(Member) session.getAttribute("loginmember");
        if (member == null) {
            model.addAttribute("center", "login");
            return "index";
        }
        model.addAttribute("center", "myPage");
        return "index";
    }
    @GetMapping("/projectHistory")
    public String projectHistory(Model model, HttpSession session) throws Exception {
        Member member =(Member) session.getAttribute("loginmember");
        if (member == null) {
            model.addAttribute("center", "login");
            return "index";
        }
        String memberId = member.getMemberId();
        List<Post> uploadedPosts = postService.getUploadedPosts(memberId);
        List<Post> joinedPosts = postService.getJoinedPosts(memberId);
        model.addAttribute("uploadedPosts", uploadedPosts);
        model.addAttribute("joinedPosts", joinedPosts);
        model.addAttribute("center", "projectHistory");
        return "index";
    }


    @RequestMapping("/memberUpdateImpl")
    public void memberUpdateImpl(MemberUpdateDTO memberUdto) throws Exception {
        Member member= new Member(memberUdto.getMemberId(),memberUdto.getGitaddress(),memberUdto.getMemo());
        try {
            memberService.update(member);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
