package com.spring.javaProjectS5.vo;

import lombok.Data;

@Data
public class ReservationInfoVO {
	private int idx;
	private int reservationIdx;
	private String mid;
	private String wDate;
	private int recruit;
	private String content;
	
	private String title;
	private String startDate;
	private String endDate;
	private int date_diff;
	private String imgContent;
	
	private int reservationCnt;

}
