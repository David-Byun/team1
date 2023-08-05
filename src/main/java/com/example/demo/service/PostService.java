package com.example.demo.service;

import com.example.demo.dto.Post;
import com.example.demo.mapper.PostMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class PostService {

    private final PostMapper postMapper;

    public List<Post> selectAllPost() {
        return postMapper.selectAll();
    }
}
