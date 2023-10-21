package com.example.demo.controller;

import com.example.demo.config.GithubApi;
import com.example.demo.dto.Applicant;
import com.example.demo.dto.PostDetail;
import com.example.demo.service.ApplicantService;
import com.example.demo.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
        Map<String, Object> map = (Map<String, Object>) github.get(0);
        List<Object> branch = (List<Object>) map.get("branch");
        List<Object> recent = (List<Object>) map.get("recent");
        List<Object> lang = (List<Object>) map.get("lang");

        log.info(lang.toString());
        log.info(recent.toString());
        log.info(branch.toString());

        model.addAttribute("branch", branch);
        model.addAttribute("lang", lang);
        model.addAttribute("recent",recent);
        model.addAttribute("postDetail",postDetail);
        model.addAttribute("team",team);
        model.addAttribute("github",github);
        model.addAttribute("center", "progress");
        return "index";
    }

}
