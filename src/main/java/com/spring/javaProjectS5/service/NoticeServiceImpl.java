package com.spring.javaProjectS5.service;

import java.io.File;
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

import com.spring.javaProjectS5.dao.NoticeDAO;
import com.spring.javaProjectS5.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDAO noticeDAO;
	
	@Override
	public int setNoticeInput(MultipartHttpServletRequest mFile, NoticeVO vo) {
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
			
			vo.setAttch(sFileNames);
			res = noticeDAO.setNoticeInput(vo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return res;
	}
	private void writeFile(MultipartFile file, String sFileName) throws IOException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/notice/");
		
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
	public List<NoticeVO> getNoticeList() {
		return noticeDAO.getNoticeList();
	}
	@Override
	public NoticeVO getNoticeContent(int idx) {
		return noticeDAO.getNoticeContent(idx);
	}
	@Override
	public int setNoticeDelete(int idx) {
		NoticeVO vo = noticeDAO.getNoticeContent(idx);
		// noticeContent의 내용을 공지사항의 번호인 idx를 이용하여 db에서 꺼내온다.(조회) 
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = "";
		if(vo.getContent().indexOf("src=\"/") != -1) {
			//         0         1         2         3         4         5
			//         012345678901234567890123456789012345678901234567890
			// <p><img src="/javaProjectS5/data/ckeditor/240124110131_9.jpg" style="height:171px
			String content = vo.getContent();
			// vo.content(vo.getContent())를 꺼내서 변수 content에 저장
			realPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
			// resources/data/ckeditor/ 하위 폴더 경로를 변수 realPath로 저장
			int position = 34;
			String nextFile = content.substring(content.indexOf("src=\"/") + position);
			// vo에 있는 content(공지사항 글 내용) 중에  src="/ 문자열을 찾아서(indexOf("2024")) 꺼낸뒤 자름
			// 이후 content(공지사항 글 내용) 중에 javaProjectS5/data/ckeditor/240117110349_1.jpg" 를 찾아 꺼내온다.
			boolean sw = true;
			
			while(sw) {
				String File = nextFile.substring(0,nextFile.indexOf("\""));
				
				String origFilePath = realPath + File;
				
				fileDelete(origFilePath);		// notice폴더의 그림파일(이미지)을 삭제처리한다.
				
				if(nextFile.indexOf("src=\"/") == -1) sw = false;
				// 만약 src= "/로 시작하는 문자열이 없다면 코드는 수행을 중지한다.
				else nextFile = nextFile.substring(nextFile.indexOf("src=\"/") + position);
				// 만약 src= "/로 시작하는 문자열이 존재한다면 코드는 해당 과정을 반복적으로 수행한다.
			}
			
		}
		// 첨부 파일도 삭제
		realPath = request.getSession().getServletContext().getRealPath("/resources/data/notice/");
		String origFilePath = realPath + vo.getAttch();
		System.out.println("origFile2 : " + origFilePath);
		
		fileDelete(origFilePath);
		
		return noticeDAO.setNoticeDelete(idx);
		// 이후 해당 게시판의 고유한 식별자인 idx를 이용하여 데이터베이스에서 해당 게시물을 찾아 삭제한다.
	}
	
	// 실제로 서버에 저장된 파일을 삭제처리한다.
	private void fileDelete(String origFilePath) {
		File delFile = new File(origFilePath);
		if(delFile.exists()) delFile.delete();
	}
	@Override
	public List<NoticeVO> getNoticeList(String searchText) {
		return noticeDAO.getNoticeList(searchText);
	}

	
}
