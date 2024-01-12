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
		else if(msgFlag.equals("signInOk")) {
			model.addAttribute("msg", mid + "회원님 로그인 되었습니다.");
			model.addAttribute("url", "sign/signMain");
		}
		else if(msgFlag.equals("kakaosignInOk")) {
			model.addAttribute("msg", mid + "회원님 로그인 되었습니다.");
			model.addAttribute("url", "sign/signMain");
		}
		else if(msgFlag.equals("signOut")) {
			model.addAttribute("msg", mid + "회원님 로그아웃 되었습니다.");
			model.addAttribute("url", "sign/signIn");
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
		else if(msgFlag.equals("reservationWriteOk")) {
			model.addAttribute("msg", "이벤트 등록이 완료되었습니다.");
			model.addAttribute("url", "reservation/reservationList");
		}
		else if(msgFlag.equals("reservationWriteNo")) {
			model.addAttribute("msg", "이벤트 등록이 오류.");
			model.addAttribute("url", "reservation/reservationWrite");
		}
		else if(msgFlag.equals("certificationNo")) {
			model.addAttribute("msg", "로그인하셔서 예약해주세요.");
			model.addAttribute("url", "reservation/reservationList");
		}
		else if(msgFlag.equals("reservationFormOk")) {
			model.addAttribute("msg", "예약이 완료되었습니다.");
			model.addAttribute("url", "reservation/reservationConfirm");
		}
		else if(msgFlag.equals("reservationFormNo")) {
			model.addAttribute("msg", "예약 실패.");
			model.addAttribute("url", "reservation/reservationFormNo");
		}
		else if(msgFlag.equals("reservationDuplicate")) {
			model.addAttribute("msg", "이미 다른 프로그램을 같은 날짜에 신청하셨습니다.");
			model.addAttribute("url", "sign/signMain");
		}
		
		
		
		return "include/message";
	}
}
