package com.example.demo.service;


import com.example.demo.dto.PostDetail;
import com.example.demo.mapper.PostDetailMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class PostDetailService {
    //sunmi
    private final PostDetailMapper postDetailMapper;
    //sunmi
    public int regPostDetail(PostDetail postDetail) throws Exception {
        int result = postDetailMapper.insert(postDetail);
        if (result == 0) {
            throw new Exception("실패");
        }
        return result;
    }
    //sunmi
    public int editPostDetail(PostDetail postDetail) throws Exception {
        int result = postDetailMapper.update(postDetail);
        if(result==0) {
            throw new Exception("실패");
        }
        return result;
    }
}
