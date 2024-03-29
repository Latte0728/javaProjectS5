package com.spring.javaProjectS5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS5.dao.BirdMeDAO;
import com.spring.javaProjectS5.vo.BirdMeVO;

@Service

public class BirdMeServiceImpl implements BirdMeService {

	@ Autowired
	BirdMeDAO birdMeDAO;
	@Override
	public List<BirdMeVO> getBirdMeList(String mid) {
		return birdMeDAO.getBirdMeList(mid);
	}
	@Override
	public int setBirdMeInput(BirdMeVO vo) {
		return birdMeDAO.setBirdMeInput(vo);
	}
	@Override
	public BirdMeVO getbirdMeContent(int idx) {
		return birdMeDAO.getbirdMeContent(idx);
	}
	@Override
	public void setBirdReadNumUpdate(int idx) {
		 birdMeDAO.setBirdReadNumUpdate(idx);
	}
	@Override
	public int getBirdGoodList(String part, int partIdx, String mid) {
		return birdMeDAO.getBirdGoodList(part, partIdx, mid);
	}
	@Override
	public void setBirdGoodInsert(String part, int partIdx, String mid) {
		birdMeDAO.setBirdGoodInsert(part, partIdx, mid);
	}

}
