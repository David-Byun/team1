package com.example.demo.controller;

import com.example.demo.dto.FCMNotificationRequestDto;
import com.example.demo.dto.FirebaseToken;
import com.example.demo.service.FirebaseService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping
public class FirebaseController {
    private final FirebaseService firebaseService;

    @PostMapping("/token")
    public void putToken(FirebaseToken firebaseToken) {
        Optional<FirebaseToken> byToken = firebaseService.findByToken(firebaseToken.getToken());
        if (byToken.isEmpty()) {
            firebaseService.register(firebaseToken);
        }
    }

    @PostMapping("/api/notification")
    public String sendNotificationByToken(@RequestBody FCMNotificationRequestDto requestDto) {
        return firebaseService.sendNotificationByToken(requestDto);
    }
}
