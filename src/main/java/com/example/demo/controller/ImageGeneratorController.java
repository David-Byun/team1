package com.example.demo.controller;

import com.example.demo.dto.ImageRequest;
import com.example.demo.dto.ImageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class ImageGeneratorController {

    @Autowired
    private RestTemplate restTemplate;

    private static final String OEPNAIURL = "https://api.openai.com/v1/images/generations";

    @PostMapping("/generateImage")
    public String generateImage(@RequestBody ImageRequest imageRequest) {
        ImageResponse imageResponse = restTemplate.postForObject(OEPNAIURL, imageRequest, ImageResponse.class);
        return imageResponse.getData().get(0).get("url").toString();
    }
}
