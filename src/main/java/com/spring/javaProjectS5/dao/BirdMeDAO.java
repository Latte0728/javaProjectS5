package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.BirdMeVO;

public interface BirdMeDAO {

	public List<BirdMeVO> getBirdMeList();

	public int setBirdMeInput(@Param("vo") BirdMeVO vo);

	public BirdMeVO getbirdMeContent(@Param("idx") int idx);

	public void setBirdReadNumUpdate(@Param("idx") int idx);
	
}
