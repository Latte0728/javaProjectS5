package com.spring.javaProjectS5.service;

import java.util.List;

import com.spring.javaProjectS5.vo.BulletinBoardComplaintVO;
import com.spring.javaProjectS5.vo.BulletinBoardReplyVO;
import com.spring.javaProjectS5.vo.BulletinBoardVO;

public interface BulletinBoardService {

	public List<BulletinBoardVO> getBulletinBoardList();

	public int setBulletinBoardInput(BulletinBoardVO vo);

	public BulletinBoardVO getBulletinBoardContent(int idx);

	public List<BulletinBoardVO> getbulletinBoardList(String search, String searchString);

	public void setReadNumUpdate(int idx);

	public int setBulletinBoardDelete(int idx);

	public int setbulletinBoardUpdate(BulletinBoardVO vo);

	public List<BulletinBoardReplyVO> getBoardParentReplyList(int bulletinBoardIdx);

	public void setReplayOrderUpdate(int boardIdx, int re_order);

	public int setBoardReplyInput(BulletinBoardReplyVO vo);

	public int setBulletinBoardReplyDelete(int idx);

	public int setBulletinBoardComplaint(BulletinBoardComplaintVO vo);

	public List<BulletinBoardComplaintVO> getBulletinBoardComplaintList();


	

	

}
