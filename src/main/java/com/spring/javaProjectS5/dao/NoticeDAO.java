package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.NoticeVO;

public interface NoticeDAO {

	public int setNoticeInput(@Param("vo") NoticeVO vo);

	public List<NoticeVO> getNoticeList();

	public NoticeVO getNoticeContent(@Param("idx") int idx);

	public int setNoticeDelete(@Param("idx") int idx);

	public List<NoticeVO> getNoticeSearch(@Param("searchText") String searchText);

}
