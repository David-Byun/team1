package com.example.demo.controller;

import com.example.demo.dto.Applicant;
import com.example.demo.dto.Post;
import com.example.demo.dto.PostDetail;
import com.example.demo.dto.PostSkilltag;
import com.example.demo.service.ApplicantService;
import com.example.demo.service.PostDetailService;
import com.example.demo.service.PostService;
import com.example.demo.service.PostSkilltagService;
import com.example.demo.util.FileUpDownUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@org.springframework.web.bind.annotation.RestController
public class RestController {
    @Value("${upload.path}")
    String uploadPath;

    @Autowired
    PostService postService;

    @Autowired
    PostDetailService postDetailService;

    @Autowired
    PostSkilltagService postSkilltagService;

    @Autowired
    ApplicantService applicantService;

    @RequestMapping("/postaddimpl")
    public String postaddimpl(Post post, String ref_link, String pdate, String subject) throws Exception {

        String re = "";

        try {
            MultipartFile imgfile = post.getImgFile();
            String img = imgfile.getOriginalFilename();
            FileUpDownUtil.uploadFile(imgfile, uploadPath);
            post.setImg(img);
            int result = postService.savePost(post);
            if (result == 1) {
                Integer postId = postService.getLastPostId();
                PostDetail postDetail = new PostDetail();
                postDetail.setProjectId(postId);
                postDetail.setRefLink(ref_link);
                postDetail.setPdate(pdate);
                postDetail.setSubject(subject);
                postDetail.setContent(post.getContent());
                postDetailService.regPostDetail(postDetail);

                List<String> list = post.getHashtag();
                for (String hashtag : list) {
                    int hashtagId = Integer.parseInt(hashtag);
                    PostSkilltag postSkilltag = new PostSkilltag();
                    postSkilltag.setProjectId(postId);
                    postSkilltag.setHashtagId(hashtagId);
                    postSkilltagService.regPostSkilltag(postSkilltag);
                }

                Applicant applicant = new Applicant();
                applicant.setMemberId(post.getMemberId());
                applicant.setProjectId(postId);
                applicant.setApplyPart(0);
                applicant.setSuccess(1);
                applicantService.regApplicant(applicant);

                re = postId + "";
            } else {
                re = "모종의 이유로 인서트되지 아니 아니 아니되오!";
            }
        }catch (Exception e){
            throw new Exception( "모종의 이유로 인서트되지 아니 아니 아니되오!");
        }
        return re;
    }

    @RequestMapping("/posteditimpl")
    public String posteditimpl(Post post, String ref_link, String pdate, String subject) throws Exception {

        String re = "";
        int result = 0;
        int projectId = post.getProjectId();
        try {
            if (post.getImgFile()==null) {
                result = postService.updatePost(post);
            } else {
                MultipartFile imgfile = post.getImgFile();
                String img = imgfile.getOriginalFilename();
                FileUpDownUtil.uploadFile(imgfile, uploadPath);
                post.setImg(img);
                result = postService.updatePost(post);
            }

            if (result == 1) {
                PostDetail postDetail = postService.getPostDetail(projectId);
                postDetail.setRefLink(ref_link);
                postDetail.setPdate(pdate);
                postDetail.setSubject(subject);
                postDetail.setContent(post.getContent());
                postDetailService.editPostDetail(postDetail);

                postSkilltagService.remove(projectId);
                List<String> list = post.getHashtag();
                for (String hashtag : list) {
                    int hashtagId = Integer.parseInt(hashtag);
                    PostSkilltag postSkilltag = new PostSkilltag();
                    postSkilltag.setProjectId(projectId);
                    postSkilltag.setHashtagId(hashtagId);
                    postSkilltagService.regPostSkilltag(postSkilltag);
                }
            } else {
                re = "모종의 이유로 인서트되지 아니 아니 아니되오!";
            }
        } catch (Exception e){
            throw new Exception("모종의 이유로 에딧되지 아니 아니 아니되오!");
        }
        return re;
    }
}
