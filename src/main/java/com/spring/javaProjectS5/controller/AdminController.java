package com.spring.javaProjectS5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaProjectS5.service.AdminService;
import com.spring.javaProjectS5.vo.QrCodeVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/menagerPage", method = RequestMethod.GET)
	public String menagerPageGet() {
		return "admin/menagerPage";
	}
	
	@RequestMapping(value = "/qrCreate", method = RequestMethod.GET)
	public String qrCreateGet() {
		return "admin/qrCode/qrCreate";
	}
	
	@ResponseBody
	@RequestMapping(value = "/qrCreate", method = RequestMethod.POST)
	public String qrCreatePost(QrCodeVO vo) {
		return adminService.setQrCreate(vo);
	}
	
	
}
