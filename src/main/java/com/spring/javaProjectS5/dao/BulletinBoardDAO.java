package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.BulletinBoardComplaintVO;
import com.spring.javaProjectS5.vo.NoticeVO;
import com.spring.javaProjectS5.vo.BulletinBoardReplyVO;
import com.spring.javaProjectS5.vo.BulletinBoardVO;

public interface BulletinBoardDAO {

	public List<BulletinBoardVO> getBulletinBoardList();

	public int setBulletinBoardInput(@Param("vo") BulletinBoardVO vo);

	public BulletinBoardVO getBulletinBoardContent(@Param("idx") int idx);

	public List<BulletinBoardVO> getbulletinBoardList(@Param("search") String search, @Param("searchString") String searchString);

	public void setReadNumUpdate(@Param("idx") int idx);

	public int setBulletinBoardDelete(@Param("idx") int idx);

	public int setbulletinBoardUpdate(@Param("vo") BulletinBoardVO vo);

	public void setReplayOrderUpdate(@Param("bulletinBoardIdx") int bulletinBoardIdx, @Param("re_order")  int re_order);

	public int setBoardReplyInput(@Param("vo") BulletinBoardReplyVO vo);

	public List<BulletinBoardReplyVO> getBoardParentReplyList(@Param("bulletinBoardIdx") int bulletinBoardIdx);

	public int setBulletinBoardReplyDelete(@Param("idx") int idx);

	public int BulletinBoardComplaintVO(@Param("vo") BulletinBoardComplaintVO vo);

	public List<BulletinBoardComplaintVO> getBulletinBoardComplaintList();

	public BulletinBoardVO getBulletinBoardDelete(@Param("idx") int idx);

}
