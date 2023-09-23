package com.example.demo.controller;

import com.example.demo.dto.Post;
import com.example.demo.dto.PostDetail;
import com.example.demo.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;

    @GetMapping("/")
    public String index(Model model) {
        List<Post> posts = postService.getAllPosts();
        log.info("posts : {}", posts);
        model.addAttribute("posts", posts);
        return "index";
    }

    @GetMapping("/post/{projectId}")
    public String postDetail(Model model, @PathVariable("projectId") int projectId) {
        Post post = postService.getPost(projectId);
        PostDetail postDetail = postService.getPostDetail(projectId);
        model.addAttribute("post", post);
        model.addAttribute("postDetail", postDetail);
        return "page";
    }

    @PostMapping("/post")
    public String registerPost(Model model, Post post) {
        try {
            postService.savePost(post);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/";
    }
}
