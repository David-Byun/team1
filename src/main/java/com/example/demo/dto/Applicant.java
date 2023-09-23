package com.example.demo.dto;

import lombok.Data;

@Data
public class Applicant {
   private String memberId;
   private int projectId;
   private String applyPart;
   private int success;
   private String rdate;
   private int progress;
   private int score;
   private int upvote;
   private String name;
   private String img;
   private String company;
}
