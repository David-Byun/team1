package com.example.demo.dto;

import lombok.Data;

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
    private String refLink;
    private int process;
}
