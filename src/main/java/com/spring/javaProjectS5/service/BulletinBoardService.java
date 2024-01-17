package com.spring.javaProjectS5.service;

import java.util.List;

import com.spring.javaProjectS5.vo.BulletinBoardVO;
import com.spring.javaProjectS5.vo.GuideVO;

public interface BulletinBoardService {

	public List<BulletinBoardVO> getBulletinBoardList();

	public int setBulletinBoardInput(BulletinBoardVO vo);

	public BulletinBoardVO getBulletinBoardContent(int idx);

	public List<BulletinBoardVO> getbulletinBoardList(String search, String searchString);

	public void setReadNumUpdate(int idx);

	public int setBulletinBoardDelete(int idx);

}
