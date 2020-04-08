package com.springboot.demo.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchPostsModel extends MemberModel {
    private String SearchType;
    private String Keyword;
    private int RowStart;
    private int RowNumber;
}
