package com.spring.javaProjectS5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaProjectS5.service.GuideService;
import com.spring.javaProjectS5.vo.GuideVO;

@Controller
@RequestMapping("/guide")
// 중간 경로 지정
public class GuideController {
	
	@Autowired
	GuideService guideService;
	
	@GetMapping(value="/guideWrite")
	public String guideWriteGet() {
		return "guide/guideWrite";
	}

	@RequestMapping(value="/guideWrite",	method=RequestMethod.POST)
	public String guideWritePost(MultipartHttpServletRequest mFile, GuideVO vo) {
		System.out.println("vo : " + vo);
		int res = guideService.setGuideWrite(mFile, vo);
		
		if(res !=0) return "redirect:/message/guideWriteOk";
		else return "redirect:/message/guideWriteNo";
	}
	@GetMapping(value="/abbGuide")
	public String abbGuideGet() {
		return "guide/abbGuide";
	}
	
	@RequestMapping(value="/guideList", method=RequestMethod.GET)
	public String guideListGet(Model model) {
		List<GuideVO> vos = guideService.getGuideList();
		model.addAttribute("vos", vos);
		return "guide/guideList";
	}
	
	@GetMapping(value="/guideContent")
	public String guideContentGet(Model model, int idx) {
		GuideVO vo =	guideService.getGuideContent(idx);
		model.addAttribute("vo", vo);
		return "guide/guideContent";
	}
}