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

}
