package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.joda.time.DateTime;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class FirebaseToken {
    private int id;
    private String token;
    private String web;
    private DateTime rdate;

    public FirebaseToken(String token, String web) {
        this.token = token;
        this.web = web;
    }
}

