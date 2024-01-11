package com.spring.javaProjectS5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/page")
public class PageController {
	
	@GetMapping(value="/menagerPage")
	public String menagerPageGet() {
		return "/page/menagerPage";
	}
	@GetMapping(value="/myPage")
	public String myPageGet() {
		return "page/myPage";
	}
}
