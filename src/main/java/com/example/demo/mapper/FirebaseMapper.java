package com.example.demo.mapper;

import com.example.demo.dto.FirebaseToken;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface FirebaseMapper {
    void register(FirebaseToken firebaseToken);

    Optional<FirebaseToken> findByToken(String token);

    List<FirebaseToken> findAllTokens();
}
