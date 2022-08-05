package com.bd.spring_board.model;

import lombok.Data;

@Data
public class BoardDto {
    private int id;
    private String title;
    private String author;
    private String insert_time;
    private String update_time;
    private String context;
    private int cnt;
}