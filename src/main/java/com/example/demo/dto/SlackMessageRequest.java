package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashMap;

@Getter
@NoArgsConstructor
@Setter
@AllArgsConstructor
public class SlackMessageRequest {

    private String title;

    private HashMap<String, String> message;
}