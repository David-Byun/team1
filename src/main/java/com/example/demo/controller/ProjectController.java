package com.example.demo.controller;

import com.example.demo.config.GithubApi;
import com.example.demo.dto.Applicant;
import com.example.demo.dto.Post;
import com.example.demo.dto.PostDetail;
import com.example.demo.service.ApplicantService;
import com.example.demo.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;
@Controller
@Slf4j
@RequiredArgsConstructor
public class ProjectController {

    private final PostService postService;
    private final ApplicantService applicantService;

    @Autowired
    GithubApi githubApi;

    @RequestMapping("/project/progress")
    public String postEdit(Model model, int projectId) throws Exception {
        PostDetail postDetail = postService.getPostDetail(projectId);
        List<Applicant> team = applicantService.getApplicantList(projectId);
        String refLink = postDetail.getRefLink();
        JSONArray github = (JSONArray) githubApi.getOverview(refLink);

        model.addAttribute("postDetail",postDetail);
        model.addAttribute("team",team);
        model.addAttribute("github",github);
        model.addAttribute("center", "progress");
        return "index";
    }

}
