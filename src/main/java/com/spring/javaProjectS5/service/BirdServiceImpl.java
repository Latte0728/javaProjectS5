package com.spring.javaProjectS5.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaProjectS5.dao.BirdDAO;
import com.spring.javaProjectS5.dao.GuideDAO;
import com.spring.javaProjectS5.vo.BirdVO;

@Service
public class BirdServiceImpl implements BirdService {
	
	@Autowired
	BirdDAO birdDAO;
	
		@Override
		public int setBirdWrite(MultipartFile file, String title) {
			int res = 0;
			try {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);
				
				writeFile(file, sFileName);
				
				res = birdDAO.setBirdWrite(title, sFileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return res;
		}
		
		private void writeFile(MultipartFile file, String sFileName) throws IOException {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
			String realPath = request.getSession().getServletContext().getRealPath("/resources/data/bird/");
			
			byte[] data = file.getBytes();
			FileOutputStream fos = new FileOutputStream(realPath + sFileName);
			fos.write(data);
			fos.close();
		}

		// 화일명 중복방지를 위한 서버에 저장될 실제 파일명 만들기
		private String saveFileName(String oFileName) {
			String fileName = "";
			
			Calendar cal = Calendar.getInstance();
			fileName += cal.get(Calendar.YEAR);
			fileName += cal.get(Calendar.MONTH);
			fileName += cal.get(Calendar.DATE);
			fileName += cal.get(Calendar.HOUR);
			fileName += cal.get(Calendar.MINUTE);
			fileName += cal.get(Calendar.SECOND);
			fileName += cal.get(Calendar.MILLISECOND);
			fileName += "_" + oFileName;
			
			return fileName;
		
		}

		@Override
		public List<BirdVO> getTitle() {
			return birdDAO.getTitle();
		}

}
