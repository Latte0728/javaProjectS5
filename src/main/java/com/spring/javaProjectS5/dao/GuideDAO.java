package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.GuideVO;

public interface GuideDAO {

	public int setGuideWrite(@Param("vo") GuideVO vo);

	public List<GuideVO> getGuideList();

	public GuideVO getGuideContent(@Param("idx") int idx);

}
