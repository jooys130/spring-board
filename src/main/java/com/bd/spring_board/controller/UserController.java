package com.bd.spring_board.controller;

import com.bd.spring_board.model.UserDto;
import com.bd.spring_board.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/joinPage")
    public String openJoinPage() throws Exception { // 회원가입 페이지
        return "Join";
    }

    @PostMapping("/joinPage")
    public String execSignUp(UserDto userDto) throws Exception { // 회원가입 처리
        userService.joinUser(userDto);
        return "redirect:/loginPage";
    }
}
