package com.example.demo.service;

import com.example.demo.dto.FCMNotificationRequestDto;
import com.example.demo.dto.FirebaseToken;
import com.example.demo.mapper.FirebaseMapper;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class FirebaseService {

    private final FirebaseMessaging firebaseMessaging;
    private final FirebaseMapper firebaseMapper;
    public void register(FirebaseToken firebaseToken) {

        firebaseMapper.register(firebaseToken);
    }

    public Optional<FirebaseToken> findByToken(String token) {
        Optional<FirebaseToken> foundToken = firebaseMapper.findByToken(token);
        return foundToken;
    }

    public  String sendNotificationByToken(FCMNotificationRequestDto requestDto) {
        Notification notification = new Notification(requestDto.getTitle(), requestDto.getBody());
        Message message = Message.builder()
                .setToken("eenuvixYk1o:APA91bE3P7RfBH6d6zM5vSgFmjImO8K2Qwk4KqWjWomJIg32ffhnTNEtgDKp_LGrMKX9bGpHOcHQ9-z5K2-ZLUmnEheLDtc-hOrOZrAzFyOQeQD2IN3F8x1wgD_vu8Ip2rv-aITVQ8ox")
                .setNotification(notification)
                // .putAllData(requestDto.getData())
                .build();
        try {
            firebaseMessaging.send(message);
        } catch (FirebaseMessagingException e) {
            log.info("=============에러 발생============={}", e.getMessage());
            throw new RuntimeException(e);
        }
        return "알림을 성공적으로 전송했습니다";
    }
}
