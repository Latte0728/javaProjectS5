package com.spring.javaProjectS5.vo;

import lombok.Data;

@Data
public class BulletinBoardReplyVO {
	private int idx;
	private int bulletinBoardIdx;
	private int re_step;
	private int re_order;
	private String mid;
	private String nickName;
	private String wDate;
	private String content;
	
	
}
