package com.bd.spring_board.mapper;

import com.bd.spring_board.model.BoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface BoardMapper {
    List<BoardDto> selectBoardList() throws Exception;

    BoardDto selectPostDetail(int id) throws Exception;

    void insertNewPost(BoardDto newPostDto) throws Exception;

    void updatePost(BoardDto updatePostDto) throws Exception;

    void deletePost(int id) throws Exception;
}

