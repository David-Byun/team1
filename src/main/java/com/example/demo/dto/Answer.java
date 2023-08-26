package com.example.demo.dto;

import lombok.Data;

@Data
public class Answer {
    private int answerId;
    private String content;
    private int postId;
    private int memberId;
}
