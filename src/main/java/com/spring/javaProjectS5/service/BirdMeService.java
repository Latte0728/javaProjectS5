package com.spring.javaProjectS5.service;

import java.util.List;

import com.spring.javaProjectS5.vo.BirdMeVO;

public interface BirdMeService {

	public List<BirdMeVO> getBirdMeList();

	public int setBirdMeInput(BirdMeVO vo);

	public BirdMeVO getbirdMeContent(int idx);

	public void setBirdReadNumUpdate(int idx);

}
