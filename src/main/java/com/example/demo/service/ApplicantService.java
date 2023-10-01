package com.example.demo.service;

import com.example.demo.dto.Applicant;
import com.example.demo.mapper.ApplicantMapper;
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

    public int regApplicant (Applicant applicant) throws Exception {
        int result = applicantMapper.insert(applicant);
        if (result == 0) {
            throw new Exception("실패");
        }
        return result;
    }

}
