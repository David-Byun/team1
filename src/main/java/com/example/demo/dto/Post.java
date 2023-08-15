package com.example.demo.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;

@Data
public class Post {
    private int postId;
    private String title;
    private String memberId;
    private int marketing;
    private int plan;
    private int design;
    private int front;
    private int server;
    private String img;
    private String refLink;
    private int process;
    private String content;
    private LocalDate rdate;

    private MultipartFile imgName;
}
