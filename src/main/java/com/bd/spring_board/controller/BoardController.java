package com.bd.spring_board.controller;

import com.bd.spring_board.model.BoardDto;
import com.bd.spring_board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller // 해당 클래스를 컨트롤러로 동작하게 한다.
@RequiredArgsConstructor // final이나 @NotNull 을 사용한 필드에 대한 생성자를 자동으로 생성해준다
public class BoardController {
    private final BoardService boardService;

    @RequestMapping("/boardlist") // 이 주소로 접속하면 이 메소드를 호출한다.
    public String openBoardList(Model model) throws Exception {
        List<BoardDto> boardList = boardService.selectBoardList(); // Service를 호출하는 부분. Service의 반환값을 리스트에 저장
        model.addAttribute("boardList", boardList);

        return "BoardList";
    }

    @RequestMapping("/post") // 이 주소로 접속하면 이 메소드를 호출한다.
    public String openPost(Model model) throws Exception {
        List<BoardDto> boardList = boardService.selectBoardList(); // Service를 호출하는 부분. Service의 반환값을 리스트에 저장
        model.addAttribute("boardList", boardList);

        return "Post";
    }

    @RequestMapping("/edit") // 이 주소로 접속하면 이 메소드를 호출한다.
    public String editPost(Model model) throws Exception {
        List<BoardDto> boardList = boardService.selectBoardList(); // Service를 호출하는 부분. Service의 반환값을 리스트에 저장
        model.addAttribute("boardList", boardList);

        return "EditPost";
    }
}
