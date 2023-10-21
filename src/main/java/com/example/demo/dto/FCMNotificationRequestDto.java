package com.example.demo.dto;

import lombok.*;

@Getter
@NoArgsConstructor
@Setter
@AllArgsConstructor
public class FCMNotificationRequestDto {
    private String title;
    private String body;

}