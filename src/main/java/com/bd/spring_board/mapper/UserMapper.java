package com.bd.spring_board.mapper;

import com.bd.spring_board.model.UserDto;
import com.bd.spring_board.model.UserSecurityDto;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {

    int insertNewUser(UserDto userDto); // 회원가입

    UserSecurityDto getUserInfo(String id); // 유저 정보

}
