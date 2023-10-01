package com.example.demo.dto;

import lombok.Data;

@Data
public class PostDetail {
    private int detailId;
    private int projectId;
    private int marketing;
    private int plan;
    private int design;
    private int front;
    private int server;
    //sunmi refLink type 및 CamelCase 수정
    private String refLink;
    private int process;
    private int viewCnt;
    private String pdate;
    private String subject;
    //sunmi subtitle123, content123, applicant_id 삭제 후 content 추가 (oracle수정 완)
    private String content;
}
