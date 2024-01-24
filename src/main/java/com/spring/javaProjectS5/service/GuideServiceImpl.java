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

import com.spring.javaProjectS5.dao.GuideDAO;
import com.spring.javaProjectS5.vo.GuideVO;

@Service

public class GuideServiceImpl implements GuideService {

	@Autowired
	GuideDAO guideDAO;

	@Override
	public int setGuideWrite(MultipartHttpServletRequest mFile, GuideVO vo) {
		int res = 0;
		try {
			List<MultipartFile> fileList = mFile.getFiles("file");
			String oFileNames = "";
			String sFileNames = "";
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);
				
				writeFile(file, sFileName);
				
				oFileNames += oFileName + "/";
				sFileNames += sFileName + "/";
			}
			oFileNames = oFileNames.substring(0, oFileNames.length()-1);
			sFileNames = sFileNames.substring(0, sFileNames.length()-1);
			
			vo.setPhoto(sFileNames);
			res = guideDAO.setGuideWrite(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	private void writeFile(MultipartFile file, String sFileName) throws IOException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/guide/");
		
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
	public List<GuideVO> getGuideList() {
		return guideDAO.getGuideList();
	}

	@Override
	public GuideVO getGuideContent(int idx) {
		return guideDAO.getGuideContent(idx);
	}

	@Override
	public List<GuideVO> getGuideSearch(String search) {
		return guideDAO.getGuideSearch(search);
	}

	@Override
	public List<GuideVO> getGuideSearchList(String search, String searchString) {
		return guideDAO.getGuideSearchList(search,searchString);
	}

	@Override
	public List<GuideVO> getGuidePageList(int startIndexNo, int pageSize, String part) {
		return guideDAO.getGuidePageList(startIndexNo, pageSize, part);
		
	}

	@Override
	public List<GuideVO> getGuidePageListSearch(String search, String searchString, int startIndexNo, int pageSize, String part) {
		return guideDAO.getGuidePageListSearch(search, searchString, startIndexNo, pageSize, part);
	}

	@Override
	public List<GuideVO> getGuidePart(int startIndexNo, int pageSize, String part) {
		return guideDAO.getGuidePart(startIndexNo, pageSize, part);
	}

	@Override
	public void setGuideReadNumUpdate(int idx) {
		guideDAO.setGuideReadNumUpdate(idx);
	}
	
}
