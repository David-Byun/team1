package com.example.demo.controller;

import com.example.demo.dto.SlackMessageRequest;
import com.example.demo.service.SlackService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@RequestMapping("/slack")
@RequiredArgsConstructor
public class SlackController {
    private final SlackService slackService;

    @PostMapping("/send")
    public String sendMessage(@RequestParam String title, @RequestParam String messageKey, @RequestParam String messageValue) {

        // 필요한 작업 수행
        // 예를 들어, HashMap에 데이터 추가
        HashMap<String, String> message = new HashMap<>();
        message.put(messageKey, messageValue);
        SlackMessageRequest request = new SlackMessageRequest();
        request.setTitle(title);
        request.setMessage(message);

        try {
            slackService.sendMessage(request.getTitle(), request.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }

        return "success";
    }
}
