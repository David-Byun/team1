package com.example.demo.mapper;

import com.example.demo.dto.Applicant;
import com.example.demo.dto.Post;
import com.example.demo.frame.DemoMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ApplicantMapper extends DemoMapper<Integer, Applicant> {
    List<Applicant> findApplicantByProjectId(int projectId);
    int apply(String id);
    //naeun
    List<Post> getJoinedPosts(String memberId);
}
