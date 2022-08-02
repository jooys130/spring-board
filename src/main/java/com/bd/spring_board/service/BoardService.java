package com.bd.spring_board.service;

import com.bd.spring_board.mapper.BoardMapper;
import com.bd.spring_board.model.BoardDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service // 이 클래스가 서비스 클래스임을 알려줌
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper boardMapper;
    public List<BoardDto> selectBoardList() throws Exception {
        return boardMapper.selectBoardList();
    }

    public BoardDto postDetail(int id) throws Exception {
        return boardMapper.postDetail(id);
    }
}
