package com.spring.javaProjectS5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {

	@RequestMapping(value="/message/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, String mid, Model model, 
			@RequestParam(name="temp", defaultValue="",required=false) String temp,
			@RequestParam(name="idx", defaultValue="0",required=false) int idx,
			@RequestParam(name="pag", defaultValue="1",required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="5",required=false) int pageSize) {
		
		if(msgFlag.equals("signUserDeleteOk")) {
			model.addAttribute("msg", "회원이 삭제 되었습니다.");
			model.addAttribute("url", "user/userList");
		}
		else if(msgFlag.equals("signUserDeleteNo")) {
			model.addAttribute("msg", "회원 삭제 실패~~");
			model.addAttribute("url", "user/userList");
		}
		else if(msgFlag.equals("user2InputOk")) {
			model.addAttribute("msg", "회원 가입 성공!!!");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2InputNo")) {
			model.addAttribute("msg", "회원 가입 실패~~");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("guideWriteOk")) {
			model.addAttribute("msg", "글이 등록되었습니다");
			model.addAttribute("url", "guide/guideWrite");
		}
		else if(msgFlag.equals("guideWriteNo")) {
			model.addAttribute("msg", "글이 등록 실패");
			model.addAttribute("url", "guide/guideWrite");
		}
		
		
		
		return "include/message";
	}
}
