package com.spring.javaProjectS5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/guide")
// 중간 경로 지정
public class GuideController {
	
	@GetMapping(value= "/guide")
	public String guideGet() {
		return "guide/guide";
	}
}
