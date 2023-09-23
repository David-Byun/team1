package com.example.demo.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;

@Data
public class Post {
    private int projectId;
    private String title;
    private String memberId;
    private int marketing;
    private int plan;
    private int design;
    private int front;
    private int server;
    private int process;
    private LocalDate rdate;
    private String content;
    private String img;
    private List<String> hashtag;

    private MultipartFile imgName;
}
