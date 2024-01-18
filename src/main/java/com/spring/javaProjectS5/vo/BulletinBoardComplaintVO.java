package com.spring.javaProjectS5.vo;

import lombok.Data;

@Data
public class BulletinBoardComplaintVO {
	private int idx;
	private int bulletinBoardIdx;
	private String title;
	private String mid;
	private String wDate;
	private String content;
}
