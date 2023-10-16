package com.example.demo;

import com.example.demo.config.GithubApi;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class GithubApiTest {

    @Autowired
    GithubApi githubApi;

    @Test
    void contextLoads() throws Exception{
        String myId = "David-Byun/team1";
        JSONArray result = (JSONArray) githubApi.getOverview(myId);
        log.info(result.toJSONString());
        }

}