package com.spring.javaProjectS5.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.javaProjectS5.dao.BulletinBoardDAO;
import com.spring.javaProjectS5.vo.BulletinBoardComplaintVO;
import com.spring.javaProjectS5.vo.BulletinBoardReplyVO;
import com.spring.javaProjectS5.vo.BulletinBoardVO;

@Service
public class BulletinBoardServiceImpl implements BulletinBoardService {
	@Autowired
	BulletinBoardDAO bulletinBoardDAO;

	@Override
	public List<BulletinBoardVO> getBulletinBoardList() {
		return bulletinBoardDAO.getBulletinBoardList();
	}

	@Override
	public int setBulletinBoardInput(BulletinBoardVO vo) {
		return bulletinBoardDAO.setBulletinBoardInput(vo);
	}

	@Override
	public BulletinBoardVO getBulletinBoardContent(int idx) {
		return bulletinBoardDAO.getBulletinBoardContent(idx);
	}

	@Override
	public List<BulletinBoardVO> getbulletinBoardList(String search, String searchString) {
		return bulletinBoardDAO.getbulletinBoardList(search, searchString);
	}

	@Override
	public void setReadNumUpdate(int idx) {
		bulletinBoardDAO.setReadNumUpdate(idx);
	}

	@Override
	public int setBulletinBoardDelete(int idx) {
		BulletinBoardVO vo = bulletinBoardDAO.getBulletinBoardContent(idx);
		// boardContent 안에 그림 파일이 존재할 경우 그림파일을 삭제 처리함.
		if(vo.getContent().indexOf("src=\"/") != 0) {
			//         0         1         2         3         4         5
			//         012345678901234567890123456789012345678901234567890
			// <p><img src="/javaProjectS5/data/ckeditor/240117110349_1.jpg" style="height:725px;
			
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
			String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");
			
			int position = 34;
			String nextImg = vo.getContent().substring(vo.getContent().indexOf("src=\"/") + position);
			// vo에 있는 content(게시판 글 내용) 중에  src="/ 문자열을 찾아서(indexOf("src=\"/")) 꺼낸뒤 자름
			// 이후 content(게시판 글 내용) 중에 javaProjectS5/data/ckeditor/240117110349_1.jpg" 를 찾아 꺼내온다.
			boolean sw = true;
			
			while(sw) {
				String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
				
				String origFilePath = realPath + "ckeditor/" + imgFile;
				
				fileDelete(origFilePath);		// board폴더의 그림파일을 삭제처리한다.
				
				if(nextImg.indexOf("src=\"/") == -1) sw = false;
				// 만약 src="/로 시작하는 문자열이 없다면 코드는 수행을 중지한다.
				else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
				// 만약 src="/로 시작하는 문자열이 존재한다면 코드는 해당 과정을 반복적으로 수행한다.
			}
		}
		return bulletinBoardDAO.setBulletinBoardDelete(idx);
		// 이후 해당 게시판의 고유한 식별자인 idx를 이용하여 데이터베이스에서 해당 게시물을 찾아 삭제한다.
	}
	
	// 실제로 서버에 저장된 파일을 삭제처리한다.
	private void fileDelete(String origFilePath) {
		File delFile = new File(origFilePath);
		if(delFile.exists()) delFile.delete();
	}

	@Override
	public int setbulletinBoardUpdate(BulletinBoardVO vo) {
		return bulletinBoardDAO.setbulletinBoardUpdate(vo);
	}

	@Override
	public List<BulletinBoardReplyVO> getBoardParentReplyList(int bulletinBoardIdx) {
		return bulletinBoardDAO.getBoardParentReplyList(bulletinBoardIdx);
	}

	@Override
	public void setReplayOrderUpdate(int boardIdx, int re_order) {
		bulletinBoardDAO.setReplayOrderUpdate(boardIdx, re_order);		
	}

	@Override
	public int setBoardReplyInput(BulletinBoardReplyVO vo) {
		return bulletinBoardDAO.setBoardReplyInput(vo);
	}

	@Override
	public int setBulletinBoardReplyDelete(int idx) {
		return bulletinBoardDAO.setBulletinBoardReplyDelete(idx);
	}

	@Override
	public int setBulletinBoardComplaint(BulletinBoardComplaintVO vo) {
		return bulletinBoardDAO.BulletinBoardComplaintVO(vo);
	}

	@Override
	public List<BulletinBoardComplaintVO> getBulletinBoardComplaintList() {
		return bulletinBoardDAO.getBulletinBoardComplaintList();
	}
	
}


	
	

