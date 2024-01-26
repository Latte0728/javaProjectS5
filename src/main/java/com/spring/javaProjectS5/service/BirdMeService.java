package com.spring.javaProjectS5.service;

import java.util.List;

import com.spring.javaProjectS5.vo.BirdMeVO;

public interface BirdMeService {

	public List<BirdMeVO> getBirdMeList(String mid);

	public int setBirdMeInput(BirdMeVO vo);

	public BirdMeVO getbirdMeContent(int idx);

	public void setBirdReadNumUpdate(int idx);

	public int getBirdGoodList(String part, int partIdx, String mid);

	public void setBirdGoodInsert(String part, int partIdx, String mid);

}
