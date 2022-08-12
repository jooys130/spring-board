package com.bd.spring_board.controller;

import com.bd.spring_board.model.UserDto;
import com.bd.spring_board.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/loginPage")
    public String openLoginPage() throws Exception { // 로그인 페이지
        return "Login";
    }

    @RequestMapping("/logoutPage")
    public String openLogoutPage() throws Exception { // 로그아웃 결과 페이지 = 게시글 목록
        return "BoardList";
    }

    @RequestMapping("/accessDenied")
    public String openAccessDeniedPage() throws Exception { // 접근 거부 페이지
        return "AccessDenied";
    }
}
