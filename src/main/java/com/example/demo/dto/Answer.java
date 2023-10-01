package com.example.demo.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class Answer {
    private int answerId;
    private String content;
    //sunmi postId => questionId로 수정 (erd, oracle과 맞춤)
    private int memberId;
    private int questionId;
    //sunmi date 없어서 추가
    private LocalDate rdate;
}
