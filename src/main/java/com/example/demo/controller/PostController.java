package com.example.demo.controller;

import com.example.demo.dto.Applicant;
import com.example.demo.dto.Post;
import com.example.demo.dto.PostDetail;
import com.example.demo.service.ApplicantService;
import com.example.demo.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;
    private final ApplicantService applicantService;

    @GetMapping("/")
    public String index(Model model) {
        List<Post> posts = postService.getAllPosts();
        log.info("posts : {}", posts);
        log.info("posts 상세 : {}", posts.toString());
        model.addAttribute("posts", posts);
        return "index";
    }

    @GetMapping("/post/{projectId}")
    public String postDetail(Model model, @PathVariable("projectId") int projectId) {
        Post post = postService.getPost(projectId);
        PostDetail postDetail = postService.getPostDetail(projectId);
        List<Applicant> applicantList = applicantService.getApplicantList(projectId);
        model.addAttribute("post", post);
        model.addAttribute("postDetail", postDetail);
        model.addAttribute("applicantList", applicantList);
        model.addAttribute("center", "page");
        return "index";
    }

    @RequestMapping("/post/edit")
    public String postEdit(Model model, int projectId) throws Exception {
        Post post = postService.getPost(projectId);
        PostDetail postDetail = postService.getPostDetail(projectId);
        model.addAttribute("post",post);
        model.addAttribute("postDetail",postDetail);
        model.addAttribute("center", "edit");
        return "index";
    }

}
