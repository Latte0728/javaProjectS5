package com.spring.javaProjectS5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/errorPage")
public class ErrorController {

	// 404에러가 났을때 이동할 메세지 폼 보기
	@RequestMapping(value = "/error400", method = RequestMethod.GET)
	public String error400Get() {
		return "errorPage/error400";
	}
	
	@RequestMapping(value = "/error404", method = RequestMethod.GET)
	public String error404Get() {
		return "errorPage/error400";
	}
	
	// 405에러가 났을때 이동할 메세지 폼 보기
	@RequestMapping(value = "/error405", method = RequestMethod.GET)
	public String error405Get() {
		return "errorPage/error400";
	}
	
	
  @RequestMapping(value = "/error405", method = RequestMethod.POST) 
  public String error405Post() { 
	  	return "redirect:/message/signInNo"; 
	}
	 
	
	// 500에러가 났을때 이동할 메세지 폼 보기
	@RequestMapping(value = "/error500", method = RequestMethod.GET)
	public String error500Get() {
		return "errorPage/error400";
	}
	
	@RequestMapping(value = "/error500", method = RequestMethod.POST)
	public String error500Post() {
		return "errorPage/error400";
	}
	
}
