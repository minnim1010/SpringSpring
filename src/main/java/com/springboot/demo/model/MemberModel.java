package com.springboot.demo.model;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class MemberModel {
    private int bno;
    private String title;
    private String content;
    private String author;
    private Date regdate;
}
