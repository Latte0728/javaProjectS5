package com.spring.javaProjectS5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.javaProjectS5.service.BirdMeService;
import com.spring.javaProjectS5.vo.BirdMeVO;

@Controller

@RequestMapping(value="/birdMe")
// 중간 경로 지정

public class BirdMeController {
	
	@Autowired
	BirdMeService birdMeService; 

	@RequestMapping(value="/birdMeList", method = RequestMethod.GET)
	public String birdMeListGet(Model model) {
		List<BirdMeVO> vos	= birdMeService.getBirdMeList();
		model.addAttribute("vos",vos);
		return "birdMe/birdMeList";
	}

//	@RequestMapping(value="/birdMeList", method = RequestMethod.POST)
//	public String birdMeListPost(BirdMeVO vo,int idx, Model model) {
//		List<BirdMeVO> vos	= birdMeService.getBirdMeList(idx);
//		model.addAttribute("vos",vos);
//		return "birdMe/birdMeList";
//	}
	@RequestMapping(value="/birdMeInput", method = RequestMethod.GET)
	public String birdMeInputGet() {
		return "birdMe/birdMeInput";
	}

	
	@RequestMapping(value="/birdMeInput", method = RequestMethod.POST)
	public String birdMeInputPost(BirdMeVO vo) {
		int res = birdMeService.setBirdMeInput(vo);
		if(res !=0) return "redirect:/message/birdMeInputOk";
		else return "redirect:/message/birdMeInputNo";
	}

	@RequestMapping(value="/birdMeContent", method = RequestMethod.GET)
	public String birdMeContentGet(int idx, Model model) {
		// 조회수 증가
		birdMeService.setBirdReadNumUpdate(idx);
		
		BirdMeVO vo = birdMeService.getbirdMeContent(idx);
		model.addAttribute("vo", vo);
		return "birdMe/birdMeContent";
	}
}
