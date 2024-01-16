package com.spring.javaProjectS5.service;

import java.util.List;

import com.spring.javaProjectS5.vo.BulletinBoardVO;

public interface BulletinBoardService {

	public List<BulletinBoardVO> getBulletinBoardList();

	public int setBulletinBoardInput(BulletinBoardVO vo);

	public BulletinBoardVO getBulletinBoardContent(int idx);

}
