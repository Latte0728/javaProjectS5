package com.spring.javaProjectS5.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS5.vo.ExhibitionVO;
import com.spring.javaProjectS5.vo.GuideVO;

public interface ExhibitionDAO {

	public int setExhibitionInput(@Param("vo") ExhibitionVO vo);

	public List<ExhibitionVO> getExhibitionList();

	public ExhibitionVO getexhibitonContent(@Param("idx") int idx);

	public int setExhibitionDelete(@Param("idx") int idx);

	// 검색창 버튼 구현 단계
	public List<ExhibitionVO> getexhibitionList(@Param("searchText") String searchText);

	

}
