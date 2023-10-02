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
        List<Post> posts = postMapper.selectAll();
        for(Post post : posts) {
            List<String> hashtag = postMapper.findHashTagList(post.getProjectId());
            post.setHashtag(hashtag);
        }
        return posts;
    }

    public Post getPost(int projectId) {
        Post post = postMapper.select(projectId);
        List<String> hashtag = postMapper.findHashTagList(projectId);
        post.setHashtag(hashtag);
        //sunmi
        List<Integer> tagNo = postMapper.findTagNoList(projectId);
        post.setTagNo(tagNo);
        return post;
    }


    public int savePost(Post post) throws Exception {
        int result = postMapper.insert(post);
        if (result == 0) {
            throw new Exception("실패");
        }
        return result;
    }

    public int updatePost(Post post) throws Exception{
        //sunmi
        int result = postMapper.update(post);
        if (result == 0) {
            throw new Exception("실패");
        }
        return result;
    }

    //sunmi
    public Integer getLastPostId() throws Exception {
        return postMapper.getLastPostId();
    }
}
