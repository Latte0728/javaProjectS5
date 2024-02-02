package com.spring.javaProjectS5.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.spring.javaProjectS5.dao.AdminDAO;
import com.spring.javaProjectS5.vo.QrCodeVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDAO adminDAO;

	@Override
	public String setQrCreate(QrCodeVO vo) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/qrCode/");
		
		String qrCodeName = "";
		String qrCodeName2 = "";
		
		try {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String strToday = sdf.format(today);
			
			System.out.println("vo : " + vo);
			qrCodeName = strToday + "_" + vo.getGuideIdx();
			String url = "http://49.142.157.251:9090";
			//String url = "http://localhost:9090";
			qrCodeName2 = url + request.getContextPath()+"/"+vo.getGuideUrl();
			qrCodeName2 = new String(qrCodeName2.getBytes("UTF-8"), "ISO-8859-1");
			
			File file = new File(realPath);
			if(!file.exists()) file.mkdirs();	// 폴더가 존재하지 않으면 폴더를 생성시켜준다.
			
			// qr 코드 만들기
			int qrCodeColor = 0xFF000000;	// qr코드의 글자색 - 검색
			int qrCodeBackColor = 0xFFFFFFFF;	// qr코드의 배경색(바탕색) - 흰색
			
			QRCodeWriter qrCodeWriter = new QRCodeWriter();
			BitMatrix bitMatrix = qrCodeWriter.encode(qrCodeName2, BarcodeFormat.QR_CODE, 200, 200);
			
			MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrCodeColor, qrCodeBackColor);
			BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix, matrixToImageConfig);
			
			// 생성된 QR코드 이미지를 그림파일로 만들어낸다.
			ImageIO.write(bufferedImage, "png", new File(realPath + qrCodeName + ".png"));
			
			vo.setQrCodeName(qrCodeName);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (WriterException e) {
			e.printStackTrace();
		}
		adminDAO.setQrCreate(vo);
		return vo.getQrCodeName();
	}
}
