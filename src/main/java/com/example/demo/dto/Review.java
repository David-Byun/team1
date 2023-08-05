package com.example.demo.dto;

import lombok.Data;

@Data
public class Review {
    private int reviewId;
    private String content;
    private int postId;
    private int memberId;
}
