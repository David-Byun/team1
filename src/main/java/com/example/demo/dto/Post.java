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
    private LocalDate rdate;
    private String img;
    private String content;
    private List<String> hashtag;

    private MultipartFile imgFile;
}
