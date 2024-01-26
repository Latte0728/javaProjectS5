package com.spring.javaProjectS5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.javaProjectS5.service.ExhibitionService;
import com.spring.javaProjectS5.vo.ExhibitionVO;


@Controller

@RequestMapping(value="/exhibition")

public class ExhibitionController {
	
	@Autowired
	ExhibitionService exhibitionService;
	
	//목록 창 get 방식
	@RequestMapping(value="/exhibitionList", method=RequestMethod.GET)
	public String exhibitionListGet(Model model) {
		
		List<ExhibitionVO> vos = exhibitionService.getExhibitionList();
		model.addAttribute("vos", vos);
		
		return "exhibition/exhibitionList";
	}
	// 목록 창 post 방식
	@RequestMapping(value="/exhibitionList", method=RequestMethod.POST)
	public String exhibitionListPost(String searchText, Model model) {
		List<ExhibitionVO> vos = exhibitionService.getexhibitionList(searchText);
		model.addAttribute("vos", vos);
 		return "exhibition/exhibitionList";
	}
	
	//입력 창 get 방식
	@RequestMapping(value="/exhibitonInput", method=RequestMethod.GET)
	public String exhibitionInputGet() {
		
		return "exhibition/exhibitonInput";
	}
	
	// 입력 창 post 방식
	@RequestMapping(value="/exhibitonInput", method=RequestMethod.POST)
	public String exhibitionInputPost(ExhibitionVO vo) {
		int res = exhibitionService.setExhibitionInput(vo);
		if(res !=0) return "redirect:/message/exhibitionInputOk";
		else return "redirect:/message/exhibitionInputNo";
	}
	
	// 컨텐트 창 get 방식       exhibitionContent
	@RequestMapping(value="/exhibitionContent", method=RequestMethod.GET)
	public String exhibitonContentGet(int idx, Model model) {
		
		ExhibitionVO vo = exhibitionService.getexhibitonContent(idx);
		model.addAttribute("vo", vo);
		return "exhibition/exhibitionContent";
	}
	
	//컨텐트 창 post 방식
//	@RequestMapping(value="/exhibitionContent", method=RequestMethod.POST)
//	public String exhibitonContentPost() {
//		
//		return "exhibition/exhibitionContent";
//	}

	@RequestMapping(value="/exhibitionDelete", method=RequestMethod.GET)
	public String exhibitionDeleteGet(int idx) {
		int res = exhibitionService.setExhibitionDelete(idx);
		
		if(res != 0) return "redirect:/message/exhibitionDeleteOk";
		else return "redirect:/message/exhibitionDeleteNo";
	}
	

}
