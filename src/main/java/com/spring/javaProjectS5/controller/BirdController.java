package com.spring.javaProjectS5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

@RequestMapping(value="/bird")
// 중간 경로 지정

public class BirdController {
	
	@RequestMapping(value="birdFeature", method = RequestMethod.GET)
	public String birdFeatureGet() {
		
		return "bird/birdFeature";
	}
	
	
	
	@RequestMapping(value="/birdEvolve", method = RequestMethod.GET)
	public String birdEvolveGet() {
		return "bird/birdEvolve";
	}
}
