package com.example.demo.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class Applicant {
   private String memberId;
   private int projectId;
   //sunmi String => int Type 수정(erd와 oracleDB에 맞춤)
   private int applyPart;
   private int success;
   //sunmi String => LocalDate Type 수정 (erd와 oracle DB에 맞춤)
   private LocalDate rdate;
   private int progress;
   private int score;
   private int upvote;
   //For join
   private String name;
   private String img;
   private String company;
}
