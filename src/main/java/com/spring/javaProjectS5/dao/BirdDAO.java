package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.BirdVO;

public interface BirdDAO {

	public int setBirdWrite(@Param("title") String title, @Param("sFileName") String sFileName);

	public List<BirdVO> getTitle();

}
