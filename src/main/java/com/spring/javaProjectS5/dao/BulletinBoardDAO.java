package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.BulletinBoardVO;

public interface BulletinBoardDAO {

	public List<BulletinBoardVO> getBulletinBoardList();

	public int setBulletinBoardInput(@Param("vo") BulletinBoardVO vo);

	public BulletinBoardVO getBulletinBoardContent(@Param("idx") int idx);

	public List<BulletinBoardVO> getbulletinBoardList(@Param("search") String search, @Param("searchString") String searchString);

	public void setReadNumUpdate(@Param("idx") int idx);

	public int setBulletinBoardDelete(@Param("idx") int idx);

}
