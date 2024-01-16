package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.GuideVO;

public interface GuideDAO {

	public int setGuideWrite(@Param("vo") GuideVO vo);

	public List<GuideVO> getGuideList();

	public GuideVO getGuideContent(@Param("idx") int idx);

	public List<GuideVO> getGuideSearch(@Param("search") String search);

	public List<GuideVO> getGuideSearchList(@Param("search") String search, @Param("searchString") String searchString);
	
	public List<GuideVO> getGuidePageList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("part") String part);

	public int totRecCnt(@Param("part") String part);

	public List<GuideVO> getGuidePageListSearch(@Param("search") String search, @Param("searchString") String searchString, @Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("part") String part);

	public int totRecCntSearch(@Param("part") String part, @Param("search") String search, @Param("searchString") String searchString);

	public int totRecCntPart(@Param("part") String part);

	public List<GuideVO> getGuidePart(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("part") String part);
	
	


}
