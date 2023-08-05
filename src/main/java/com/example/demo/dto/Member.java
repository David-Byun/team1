package com.example.demo.dto;

import lombok.Data;

@Data
public class Member {
    private String memberId;
    private String password;
    private String name;
    private String nickname;
    private int point;
    private String company;
    private String memo;
    private String img;
}
