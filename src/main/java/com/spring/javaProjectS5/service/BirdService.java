package com.spring.javaProjectS5.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaProjectS5.vo.BirdVO;
import com.spring.javaProjectS5.vo.GuideVO;

public interface BirdService {

	public int setBirdWrite(MultipartFile file, String title);

	public List<BirdVO> getTitle();


}
