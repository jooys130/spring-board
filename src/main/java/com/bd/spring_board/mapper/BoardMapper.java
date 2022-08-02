package com.bd.spring_board.mapper;

import com.bd.spring_board.model.BoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BoardMapper {
    List<BoardDto> selectBoardList() throws Exception;

    BoardDto postDetail(int id) throws Exception;
}

