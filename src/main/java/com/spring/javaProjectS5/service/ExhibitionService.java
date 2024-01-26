package com.spring.javaProjectS5.service;

import java.util.List;

import com.spring.javaProjectS5.vo.ExhibitionVO;
import com.spring.javaProjectS5.vo.GuideVO;

public interface ExhibitionService {

	public int setExhibitionInput(ExhibitionVO vo);

	public List<ExhibitionVO> getExhibitionList();

	public ExhibitionVO getexhibitonContent(int idx);

	public int setExhibitionDelete(int idx);

	public List<ExhibitionVO> getexhibitionList(String searchText);

}
