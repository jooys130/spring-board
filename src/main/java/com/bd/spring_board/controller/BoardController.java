package com.bd.spring_board.controller;

import com.bd.spring_board.model.BoardDto;
import com.bd.spring_board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller // 해당 클래스를 컨트롤러로 동작하게 한다.
@RequiredArgsConstructor // final이나 @NotNull 을 사용한 필드에 대한 생성자를 자동으로 생성해준다
public class BoardController {
    private final BoardService boardService;

    @RequestMapping("/boardlist") // 이 주소로 접속하면 이 메소드를 호출한다.
    public String openBoardList(Model model) throws Exception {
        List<BoardDto> boardListDto = boardService.selectBoardList(); // Service를 호출하는 부분. Service의 반환값을 리스트에 저장
        model.addAttribute("boardList", boardListDto);

        return "BoardList";
    }

    @RequestMapping("/post/{id}") // 이 주소로 접속하면 이 메소드를 호출한다.
    public String openPost(@PathVariable int id, Model model) throws Exception {
        BoardDto postDetailDto = boardService.selectPostDetail(id);
        model.addAttribute("postDetail", postDetailDto);

        return "Post";
    }


    @RequestMapping("/edit/{id}") // 이 주소로 접속하면 이 메소드를 호출한다.
    public String editPost(@PathVariable int id, Model model) throws Exception {
        BoardDto editDetailDto = boardService.selectPostDetail(id); // Service를 호출하는 부분. Service의 반환값을 리스트에 저장
        model.addAttribute("editDetail", editDetailDto);

        return "EditPost";
    }

    @RequestMapping("/create") // 이 주소로 접속하면 이 메소드를 호출한다.
    public String createPost(Model model) throws Exception {

        return "NewPost";
    }
}
