package com.example.demo.controller;

import com.example.demo.service.ApplicantService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequiredArgsConstructor
public class ApplyController {

    private final ApplicantService applicantService;

    @PostMapping("/apply")
    public String Apply(String id) {
        return "index";
    }
}
