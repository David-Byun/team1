package com.example.demo.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;

@Data
public class Post {
    private int projectId;
    private String title;
    private String content;
    private String memberId;
    private int marketing;
    private int plan;
    private int design;
    private int front;
    private int server;
    private String refLink;
    private int process;
    private LocalDate rdate;
    private String img;

    private MultipartFile imgName;
}
