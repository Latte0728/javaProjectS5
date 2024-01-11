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
	// sql 파일에서 join으로 테이블을 묶은 이후 vo에 만든다.
	private String startDate;
	//sql 파일에서 join으로 테이블을 묶은 이후 vo에 만든다.
	private String endDate;
	//sql 파일에서 join으로 테이블을 묶은 이후 vo에 만든다.
	private int date_diff;
	//sql 파일에서 join으로 테이블을 묶은 이후 vo에 만든다.
}
