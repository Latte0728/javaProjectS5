package com.spring.javaProjectS5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@GetMapping(value="/reserVation")
	public String reserVationGet() {
		return "reservation/reserVation";
	}
}
