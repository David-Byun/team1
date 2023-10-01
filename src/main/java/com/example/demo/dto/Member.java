package com.example.demo.dto;

import lombok.Data;

import java.time.LocalDate;

import java.util.Date;
import java.util.List;

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
    //sunmi rdate 없어서 추가
    private LocalDate rdate;
    //sunmi position 없어서 추가
    private String position;
    private Date rdate;
    private String member_id;
    private List<String> hashtagList;
}
