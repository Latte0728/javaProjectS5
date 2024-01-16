package com.spring.javaProjectS5.vo;

import lombok.Data;

@Data
public class BulletinBoardVO {
	private int idx;
	private String title;
	private String nickName;
	private String wDate;
	private String content;
	private String openSw;
	private int readNum;
	private int good;
}
