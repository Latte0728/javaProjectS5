package com.spring.javaProjectS5.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaProjectS5.service.BirdMeService;
import com.spring.javaProjectS5.vo.BirdMeVO;

@Controller

@RequestMapping(value="/birdMe")
// 중간 경로 지정

public class BirdMeController {
	
	@Autowired
	BirdMeService birdMeService; 

	@RequestMapping(value="/birdMeList", method = RequestMethod.GET)
	public String birdMeListGet(Model model, HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		List<BirdMeVO> vos	= birdMeService.getBirdMeList(mid);
		model.addAttribute("vos",vos);
		return "birdMe/birdMeList";
	}
	
	@ResponseBody
	@RequestMapping(value="/birdMeGoodCheck", method = RequestMethod.POST)
	public String birdMeGoodCheckPost(String part, int partIdx, String mid) {
		int res	= birdMeService.getBirdGoodList(part,partIdx,mid);

		if(res != 0) return "0";
		
		birdMeService.setBirdGoodInsert(part,partIdx,mid);
		return "1";
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
