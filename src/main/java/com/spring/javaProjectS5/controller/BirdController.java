package com.spring.javaProjectS5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaProjectS5.service.BirdService;
import com.spring.javaProjectS5.vo.BirdVO;

@Controller


@RequestMapping(value="/bird")
// 중간 경로 지정

public class BirdController {
	
	@Autowired
	BirdService birdService;
	
	@RequestMapping(value="/birdWrite", method	=	RequestMethod.GET)
	public String birdWriteGet() {
		
		return "bird/birdWrite";
	}
	
	
	@RequestMapping(value="/birdWrite", method	=	RequestMethod.POST)
	public String birdWritePost(MultipartFile file, String title) {
		int res = birdService.setBirdWrite(file, title);
			if(res !=0) {
				return "redirect:/message/BirdWriteOk";
			}
			else return "redirect:/message/BirdWriteNo";
	}
	
	@RequestMapping(value="birdFeature", method = RequestMethod.GET)
	public String birdFeatureGet(Model model) {
		List<BirdVO> vos = birdService.getTitle();
		model.addAttribute("vos", vos);
		return "bird/birdFeature";
	}
	
	
	
	@RequestMapping(value="/birdEvolve", method = RequestMethod.GET)
	public String birdEvolveGet() {
		return "bird/birdEvolve";
	}
}
