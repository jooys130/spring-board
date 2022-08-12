package com.bd.spring_board.service;

import com.bd.spring_board.mapper.UserMapper;
import com.bd.spring_board.model.UserDto;
import com.bd.spring_board.model.UserSecurityDto;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserService implements UserDetailsService {
    private UserMapper userMapper;

    public void joinUser(UserDto userDto) { // 회원가입 처리
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();// 비밀번호 암호화
        userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userDto.setAuthorities("USER");
        userDto.setEnabled(true);
        userMapper.insertNewUser(userDto);
    }
    public UserSecurityDto loadUserByUsername(String id) throws UsernameNotFoundException { // 상세정보 조회
        UserSecurityDto user = userMapper.getUserInfo(id);
        if (user == null) {
            throw new UsernameNotFoundException("유효하지 않은 로그인 정보입니다.");
        }
        return user;
    }
}
