package com.example.demo.service;

import com.example.demo.dto.Applicant;
import com.example.demo.dto.Member;
import com.example.demo.mapper.ApplicantMapper;
import com.example.demo.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ApplicantService {

    private final ApplicantMapper applicantMapper;

    public List<Applicant> getApplicantList(int projectId){
        return applicantMapper.findApplicantByProjectId(projectId);
    }

}
