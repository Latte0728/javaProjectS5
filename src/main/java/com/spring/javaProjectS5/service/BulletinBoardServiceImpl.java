package com.spring.javaProjectS5.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS5.dao.BulletinBoardDAO;
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
}
