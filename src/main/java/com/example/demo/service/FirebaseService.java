package com.example.demo.service;

import com.example.demo.dto.FirebaseToken;
import com.example.demo.mapper.FirebaseMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class FirebaseService {

    private final FirebaseMapper firebaseMapper;
    public void register(FirebaseToken firebaseToken) {

        firebaseMapper.register(firebaseToken);
    }

    public Optional<FirebaseToken> findByToken(String token) {
        Optional<FirebaseToken> foundToken = firebaseMapper.findByToken(token);
        return foundToken;
    }

}
