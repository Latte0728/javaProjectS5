package com.spring.javaProjectS5.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaProjectS5.vo.GuideVO;

public interface GuideService {

	public int setGuideWrite(MultipartHttpServletRequest mFile, GuideVO vo);

	public List<GuideVO> getGuideList();

	public GuideVO getGuideContent(int idx);

	public List<GuideVO> getGuideSearch(String search);

	public List<GuideVO> getGuideSearchList(String search, String searchString);
	
	public List<GuideVO> getGuidePageList(int startIndexNo, int pageSize, String part);

	public List<GuideVO> getGuidePageListSearch(String search, String searchString, int startIndexNo, int pageSize, String part);

	public List<GuideVO> getGuidePart(int startIndexNo, int pageSize, String part);

	public void setGuideReadNumUpdate(int idx);

	

	

	

}
