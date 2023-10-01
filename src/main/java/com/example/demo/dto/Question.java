package com.example.demo.dto;

import lombok.Data;

@Data
public class Question {
    //QuestionDTO가 DB와 관계 없이
    // mail발송에 쓰이는 것 같아  수정하지 않음
    private String name;
    private String msg;
}
