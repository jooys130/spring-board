package com.bd.spring_board.model;

import lombok.Data;

@Data
public class UserDto {

    private String id;
    private String password;
    private String authorities;
    private boolean enabled;
}
