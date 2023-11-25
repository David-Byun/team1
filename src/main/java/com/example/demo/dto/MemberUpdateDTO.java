package com.example.demo.dto;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class MemberUpdateDTO {
    private String memberId;
    private String gitaddress;
    private String memo;
}
