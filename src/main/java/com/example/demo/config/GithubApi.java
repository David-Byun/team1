package com.example.demo.config;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kohsuke.github.*;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Slf4j
@Component
public class GithubApi {
    GitHub github;
    String token = "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";

    public Object getOverview (String repository) throws IOException {
        try {
            connectToGithub(token);
        } catch (IOException e) {
            throw new IllegalArgumentException("failed to connect gitHub");
        }

        JSONArray result = new JSONArray();
        GHRepository ghRepository = github.getRepository(repository);

        int sum2 = 0;
        int index = 1;
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> map2 = new HashMap<>();
        SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        PagedIterable<GHRepository.Contributor> contributors = ghRepository.listContributors();
        PagedIterable<GHCommit> commits = ghRepository.listCommits();
        PagedIterable<GHCommit> commitIterable = ghRepository.listCommits();
        List<GHCommit> commitsList = commitIterable.asList();
        int commitCount = Math.min(commitsList.size(), 5);
        List<GHCommit> recentCommits = commitsList.subList(0, commitCount);
        int commitIndex = 1;
        List<Object> recCommits = new ArrayList<>();
        for (GHCommit commit : recentCommits) {
            Map<String, String> recent = new HashMap<>();
            recent.put("author", commit.getCommitShortInfo().getAuthor().getName());
            recent.put("message", commit.getCommitShortInfo().getMessage());
            Date commitDate = commit.getCommitShortInfo().getAuthoredDate();
            String date = outputDateFormat.format(commitDate);
            recent.put("date", date);
            recCommits.add(recent);
            commitIndex++;
        }
        List<Object> branch = new ArrayList<>();
        for(GHRepository.Contributor contributor : contributors){
            Map<String, String> map3 = new HashMap<>();
            map3.put("branch", contributor.getLogin());
            map3.put("contributions", contributor.getContributions()+"");
            branch.add(map3);
            sum2+=contributor.getContributions();
            index++;
        }

        List<Object> lang = (List<Object>) getLanguage(repository);
        map.put("recent", recCommits);
        map.put("branch", branch);
        map.put("lang", lang);
        map.put("sum", sum2+"");
        result.add(map);

        log.info(result.toJSONString());
        return result;
    }

        /* 초기방법
        List에 team member의 git Login Id를 받아와서 일치하는 브랜치로 커밋을 몰아넣고 커밋 수 count
        이거 시간 너무 오래걸림 때때로 2분씩 걸려서 다른 방법을 쓴다.
         */
//        double sum = 0;
//        PagedIterable<GHCommit> commits = ghRepository.listCommits();
//        Map<String, String> map = new HashMap<>();
//        for(String name : branchName){
//            List<GHCommit> branchCommits = new ArrayList<>();
//            for (GHCommit commit : commits) {
//                if (commit.getAuthor().getLogin().equals(name)) {
//                    branchCommits.add(commit);
//                }
//            sum++;
//            }
//            map.put(name, branchCommits.size()+"");
//        }
//        sum = sum / branchName.size();
//        map.put("sum", sum+"");
//        map.put("lang", lang);
//        log.info(map.toString());
//        result.add(map);

    private void connectToGithub(String token) throws IOException {
        github = new GitHubBuilder().withOAuthToken(token).build();
        github.checkApiUrlValidity();
    }

    private Object getLanguage(String repository) throws IOException {
        List<Object> langMap = new ArrayList<>();
        try {
            String lagUrl = "https://api.github.com/repos/" + repository + "/languages";
            URL url = new URL(lagUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            int responseCode = connection.getResponseCode();
            if (responseCode == 200) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();
                String jsonString = response.toString();
                JSONParser parser = new JSONParser();
                JSONObject jsonObject = (JSONObject) parser.parse(jsonString);
                int langIndex = 1;
                for (Object key : jsonObject.keySet()) {
                    Map<String, Object> tmp = new HashMap<>();
                    String language = (String) key;
                    long bytes = (long) jsonObject.get(key);
                    tmp.put("language", language);
                    tmp.put("bytes", bytes+"");
                    langMap.add(tmp);
                    langIndex++;
                }
            } else {
                langMap.add("언어 정보 접근 실패");
            }
        }catch (IOException | ParseException e) {
            e.printStackTrace();

        }
        return langMap;
    }
}