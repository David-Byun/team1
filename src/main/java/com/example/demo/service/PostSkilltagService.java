package com.example.demo.service;


import com.example.demo.dto.PostSkilltag;
import com.example.demo.mapper.PostSkilltagMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class PostSkilltagService {
    //sunmi
    private final PostSkilltagMapper postSkilltagMapper;

    public int regPostSkilltag(PostSkilltag postSkilltag) throws Exception {
        int result = postSkilltagMapper.insert(postSkilltag);
        if (result == 0) {
            throw new Exception("실패");
        }
        return result;
    }

    public void remove(Integer projectId) throws Exception{
        postSkilltagMapper.delete(projectId);
    }

}
