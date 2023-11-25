package com.example.demo.dto;

import lombok.Data;
import lombok.Getter;

import java.util.Date;
import java.util.List;

@Data
@Getter
public class Member {
    private String member_id;
    private String memberId;
    private String password;
    private String name;
    private String gitaddress;
    private int point;
    private String company;
    private String memo;
    private String img;
    private Date rdate;
    //내 프로젝트에 필요한 담당자 추출을 위해 추가함
    private String PROJECT_ID;
    private String Title;
    private String hashtag;
    //sunmi position 없어서 추가
    private String position;
    private List<String> hashtagList;
    private List<String> kbmae;


    public Member(String memberId, String gitaddress, String memo) {
        this.memberId = memberId;
        this.gitaddress = gitaddress;
        this.memo = memo;
    }
}
