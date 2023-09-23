package com.example.demo.service;

import com.example.demo.dto.Post;
import com.example.demo.dto.PostDetail;
import com.example.demo.mapper.PostDetailMapper;
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
    private final PostDetailMapper postDetailMapper;

    public PostDetail getPostDetail(int projectId){
        return postDetailMapper.select(projectId);
    }

    public List<Post> getAllPosts() {
        return postMapper.selectAll();
    }

    public Post getPost(int projectId) {
        return postMapper.select(projectId);
    }

    public int savePost(Post post) throws Exception {
        int result = postMapper.insert(post);
        if (result == 0) {
            throw new Exception("실패");
        }
        return result;
    }

    public int updatePost(Post post) {
        return postMapper.update(post);
    }
}
