package com.spring.javaProjectS5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaProjectS5.dao.ExhibitionDAO;
import com.spring.javaProjectS5.vo.ExhibitionVO;
import com.spring.javaProjectS5.vo.GuideVO;

@Service

public class ExhibitionServiceImpl implements ExhibitionService {

	@Autowired
	ExhibitionDAO exhibitonDAO;

	@Override
	public int setExhibitionInput(ExhibitionVO vo) {
		return exhibitonDAO.setExhibitionInput(vo);
	}

	@Override
	public List<ExhibitionVO> getExhibitionList() {
		return exhibitonDAO.getExhibitionList();
	}

	@Override
	public ExhibitionVO getexhibitonContent(int idx) {
		return exhibitonDAO.getexhibitonContent(idx);
	}

	@Override
	public int setExhibitionDelete(int idx) {
		return exhibitonDAO.setExhibitionDelete(idx);
	}

	// 검색창 버튼 구현 단계
	@Override
	public List<ExhibitionVO> getexhibitionList(String searchText) {
		return exhibitonDAO.getexhibitionList(searchText);
	}
}
