package com.spring.javaProjectS5.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaProjectS5.service.NoticeService;
import com.spring.javaProjectS5.vo.NoticeVO;

@Controller

// 중간 경로 지정
@RequestMapping(value="/notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;

	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeListGet(Model model) {
		List<NoticeVO> vos = noticeService.getNoticeList();
		model.addAttribute("vos", vos);
		return "notice/noticeList";
	}
	
	


	@RequestMapping(value="/noticeInput", method=RequestMethod.GET)
	public String noticeInputGet() {
		return "notice/noticeInput";
	}

	// 공지사항 작성란(views에서 multipart/form-data를 Controller에서 MultipartHttpServletRequest mFile로 받음)
  @RequestMapping(value="/noticeInput", method=RequestMethod.POST) 
  public String noticeInputPost(NoticeVO vo, MultipartHttpServletRequest mFile) { 
  int res = noticeService.setNoticeInput(mFile,vo); 
	  if(res != 0) { 
	  	return "redirect:/message/noticeInputOk";
	  }	
	  else { 
	  	return "redirect:/message/noticeInputNo";
	  }
  }
	
  @RequestMapping(value="/noticeContent", method=RequestMethod.GET)
  public String noticeContentGet(Model model, int idx) {
  	NoticeVO vo = noticeService.getNoticeContent(idx);
  	
  	model.addAttribute("vo", vo);
  	return "notice/noticeContent";
  }

  @RequestMapping(value="/noticeDelete", method=RequestMethod.GET)
	public String noticeDelete(int idx) {
		int res = noticeService.setNoticeDelete(idx);
		
		if(res != 0) return "redirect:/message/noticeDeleteOk";
		else return "redirect:/message/noticeDeleteNo?idx="+idx;
	}
}
		 

