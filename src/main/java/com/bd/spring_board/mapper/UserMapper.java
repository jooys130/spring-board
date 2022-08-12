package com.bd.spring_board.mapper;

import com.bd.spring_board.model.UserDto;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {

    int insertNewUser(UserDto userDto); // 회원가입

}
