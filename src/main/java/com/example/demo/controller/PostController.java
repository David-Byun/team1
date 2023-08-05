package com.example.demo.controller;

import com.example.demo.dto.Post;
import com.example.demo.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;
    @RequestMapping("/")
    public String index(Model model) {
//        List<Post> posts = postService.selectAllPost();
//        model.addAttribute("posts", posts);
        return "index";
    }
}
