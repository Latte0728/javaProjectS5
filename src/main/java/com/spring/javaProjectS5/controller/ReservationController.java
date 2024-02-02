package com.spring.javaProjectS5.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.javaProjectS5.service.ReservationService;
import com.spring.javaProjectS5.vo.ReservationInfoVO;
import com.spring.javaProjectS5.vo.ReservationVO;

@ Controller

@RequestMapping(value="/reservation") 
public class ReservationController {
	
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping(value="/reservationWrite", method=RequestMethod.GET)
	public String reservationWriteGet() {
		return "reservation/reservationWrite";
	}
	
	@RequestMapping(value="/reservationWrite", method=RequestMethod.POST)
	public String reservationWritePost(ReservationVO vo) {
		int res = reservationService.setReservationWrite(vo);
		if(res != 0) return "redirect:/message/reservationWriteOk";
		else return "redirect:/message/reservationWriteNo";
	}
	
	
	@RequestMapping(value="/reservationList", method=RequestMethod.GET)
	public String reservationListGet(Model model) {
		List<ReservationVO> vos = reservationService.getReservationList();
		model.addAttribute("vos", vos);
		return "reservation/reservationList";
	}
	
	@RequestMapping(value="/reservationForm", method=RequestMethod.POST)
	public String reservationListPost(Model model,int idx, HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		if(mid == null) return "redirect:/message/certificationNo";
		ReservationVO vo = reservationService.getReservationIdxSearch(idx);
		model.addAttribute("idx", idx);
		model.addAttribute("vo", vo);
		return "reservation/reservationForm";
	}
	
	@RequestMapping(value="/reservationFormOk", method=RequestMethod.POST)
	public String reservationFormOkPost(ReservationInfoVO vo, HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		if(mid == null) return "redirect:/message/certificationNo";
		
		ReservationInfoVO vo2 = reservationService.getReservationDuplicate(mid, vo.getWDate());
		if(vo2 != null) return "redirect:/message/reservationDuplicate";
		int res = reservationService.setReservationFormOk(vo);
		if(res != 0) return "redirect:/message/reservationFormOk";
		else return "redirect:/message/reservationFormNo";
	}
	
	@RequestMapping(value="/reservationConfirm", method=RequestMethod.GET)
	public String reservationConfirmGet(HttpSession session, Model model) {
		String mid = (String)session.getAttribute("sMid");
		List<ReservationVO> vos = reservationService.getReservationConfirm(mid);
		model.addAttribute("vos", vos);
		return "reservation/reservationConfirm";
	}
	
	@RequestMapping(value="/reservationAdminView", method=RequestMethod.GET)
	public String reservationAdminViewGet() {
		reservationService.getSchedule();
		return "reservation/reservationAdminView";
	}
	
	@RequestMapping(value="/scheduleMenu", method=RequestMethod.GET)
	public String scheduleMenuGet(String ymd, Model model) {
    List<ReservationVO> vos = reservationService.getScheduleMenu(ymd);
		System.out.println("ymd :" + ymd);
		System.out.println("vos :" + vos);
		model.addAttribute("vos",vos);
		model.addAttribute("ymd", ymd);
		model.addAttribute("scheduleCnt", vos.size());
		return "reservation/scheduleMenu";
	}
	
}

