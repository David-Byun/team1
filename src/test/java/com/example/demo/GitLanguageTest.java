package com.example.demo;

import com.example.demo.config.GithubApi;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Slf4j
@SpringBootTest
class GitLanguageTest {

    @Autowired
    GithubApi githubApi;

    @Test
    void contextLoads() throws Exception{
        try {
            // GitHub API 엔드포인트 URL 생성
            String owner = "David-Byun";
            String repo = "team1";
            String apiUrl = "https://api.github.com/repos/" + owner + "/" + repo + "/languages";

            // HTTP GET 요청 보내기
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            // 응답 코드 확인 (200 OK 이어야 함)
            int responseCode = connection.getResponseCode();
            if (responseCode == 200) {
                // JSON 응답을 읽어오기
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();

                // JSON 파싱
                String jsonString = response.toString();
                System.out.println(jsonString);
            } else {
                System.out.println("HTTP 요청 실패: " + responseCode);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        }

}