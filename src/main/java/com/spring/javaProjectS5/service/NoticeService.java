package com.spring.javaProjectS5.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaProjectS5.vo.NoticeVO;

public interface NoticeService {
	public int setNoticeInput(MultipartHttpServletRequest mFile, NoticeVO vo);

	public List<NoticeVO> getNoticeList();

	public NoticeVO getNoticeContent(int idx);

	public int setNoticeDelete(int idx);
}
