package com.spring.javaProjectS5.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.javaProjectS5.dao.ReservationDAO;
import com.spring.javaProjectS5.vo.ReservationInfoVO;
import com.spring.javaProjectS5.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationDAO reservationDAO;

	@Override
	public int setReservationWrite(ReservationVO vo) {
		
		//         0         1         2         3         4         5
		//         012345678901234567890123456789012345678901234567890
		// <p><img src="/javaProjectS5/data/ckeditor/231220120242_10.jpg" style="height:725px;
		// <p><img src="/javaProjectS5/data/reservation/231220120242_10.jpg" style="height:725px;
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");
		
		int position = 34;
		String nextImg = vo.getContent().substring(vo.getContent().indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			
			String origFilePath = realPath + "ckeditor/" + imgFile;
			String copyFilePath = realPath + "reservation/" + imgFile;
			
			fileCopyCheck(origFilePath, copyFilePath);		// ckeditor폴더의 그림파일을 board폴더위치로 복사처리한다.
			
			if(nextImg.indexOf("src=\"/") == -1) sw = false;
			else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
		}
		vo.setContent(vo.getContent().replace("ckeditor", "reservation"));
		return reservationDAO.setReservationWrite(vo);
	}
	
	// 파일을 복사처리한다.
	private void fileCopyCheck(String origFilePath, String copyFilePath) {
		try {
			FileInputStream fis = new FileInputStream(new File(origFilePath));
			FileOutputStream fos = new FileOutputStream(new File(copyFilePath));
			
			byte[] bytes = new byte[2048];
			int cnt = 0;
			while((cnt = fis.read(bytes)) != -1) {
			  fos.write(bytes, 0, cnt);
			}
			fos.flush();
			fos.close();
			fis.close();			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ReservationVO> getReservationList() {
		return reservationDAO.getReservationList();
	}

	@Override
	public ReservationVO getReservationIdxSearch(int idx) {
		return reservationDAO.getReservationIdxSearch(idx);
	}

	@Override
	public int setReservationFormOk(ReservationInfoVO vo) {
		return reservationDAO.setReservationFormOk(vo);
	}

	@Override
	public ReservationInfoVO getReservationDuplicate(String mid, String wDate) {
		return reservationDAO.getReservationDuplicate(mid, wDate);
	}

}