package com.spring.javaProjectS5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.javaProjectS5.service.BulletinBoardService;

@Controller

@RequestMapping(value="/bulletinBoard")
// 중간 경로 지정

public class BulletinBoardController {
	
	@Autowired
	BulletinBoardService bulletinBoardService;

	@RequestMapping(value="/bulletinBoard", method=RequestMethod.GET)
	public String bulletinBoard() {
		return "bulletinBoard/bulletinBoard";

	}
}
