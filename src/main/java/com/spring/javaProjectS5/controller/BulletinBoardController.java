package com.spring.javaProjectS5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.javaProjectS5.service.BulletinBoardService;
import com.spring.javaProjectS5.vo.BulletinBoardVO;

@Controller

@RequestMapping(value="/bulletinBoard")
// 중간 경로 지정

public class BulletinBoardController {
	
	@Autowired
	BulletinBoardService bulletinBoardService;

	@RequestMapping(value="/bulletinBoardList", method=RequestMethod.GET)
	public String bulletinBoardGet(Model model) {
		List<BulletinBoardVO> vos = bulletinBoardService.getBulletinBoardList();
		model.addAttribute("vos", vos);
		return "bulletinBoard/bulletinBoardList";
	}
	
	@RequestMapping(value="/bulletinBoardInput", method=RequestMethod.GET)
	public String bulletinBoardInputGet(Model model) {
		return "bulletinBoard/bulletinBoardInput";
	}
	
	@RequestMapping(value="/bulletinBoardInput", method=RequestMethod.POST)
	public String bulletinBoardInputPost(BulletinBoardVO vo) {
		int res = bulletinBoardService.setBulletinBoardInput(vo);
		if(res != 0) return "redirect:/message/bulletinBoardInputOk";
		else return "redirect:/message/bulletinBoardInputNo";
	}
	
	@RequestMapping(value="/bulletinBoardContent", method=RequestMethod.GET)
	public String bulletinBoardInputGet(Model model, int idx) {
		BulletinBoardVO vo = bulletinBoardService.getBulletinBoardContent(idx);
		
		model.addAttribute("vo", vo);
		return "bulletinBoard/bulletinBoardContent";
	}
}
