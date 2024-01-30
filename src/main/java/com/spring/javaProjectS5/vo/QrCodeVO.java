package com.spring.javaProjectS5.vo;

import lombok.Data;

@Data
public class QrCodeVO {
	private int idx;
	private int guideIdx;
	private String guideUrl;
	private String qrCodeName;
}
