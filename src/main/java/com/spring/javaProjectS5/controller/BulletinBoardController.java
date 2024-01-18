package com.spring.javaProjectS5.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaProjectS5.service.BulletinBoardService;
import com.spring.javaProjectS5.vo.BulletinBoardComplaintVO;
import com.spring.javaProjectS5.vo.BulletinBoardReplyVO;
import com.spring.javaProjectS5.vo.BulletinBoardVO;

@Controller

@RequestMapping(value="/bulletinBoard")
// 중간 경로 지정

public class BulletinBoardController {
	
	@Autowired
	BulletinBoardService bulletinBoardService;

	@RequestMapping(value="/bulletinBoardList", method=RequestMethod.GET)
	public String bulletinBoardGet(Model model) {
		List<BulletinBoardVO> vos = bulletinBoardService.getBulletinBoardList();
		model.addAttribute("vos", vos);
		return "bulletinBoard/bulletinBoardList";
	}
	
	@RequestMapping(value="/bulletinBoardList", method=RequestMethod.POST)
	public String guideListPost(Model model, String searchString, String search) {
		if(search.equals("total")) search = "전체";
		List<BulletinBoardVO> vos = bulletinBoardService.getbulletinBoardList(search,searchString);
		model.addAttribute("vos", vos);
		model.addAttribute("search", search);
		return "bulletinBoard/bulletinBoardList";
	}
	@RequestMapping(value="/bulletinBoardInput", method=RequestMethod.GET)
	public String bulletinBoardInputGet(Model model) {
		return "bulletinBoard/bulletinBoardInput";
	}
	
	@RequestMapping(value="/bulletinBoardInput", method=RequestMethod.POST)
	public String bulletinBoardInputPost(BulletinBoardVO vo) {
		int res = bulletinBoardService.setBulletinBoardInput(vo);
		if(res != 0) return "redirect:/message/bulletinBoardInputOk";
		else return "redirect:/message/bulletinBoardInputNo";
	}
	
	//@ResponseBody
	@RequestMapping(value="/bulletinBoardDelete", method=RequestMethod.GET)
	public String bulletinBoardDeleteGet(int idx) {
		int res = bulletinBoardService.setBulletinBoardDelete(idx);
		//return res + "";
		if(res != 0) return "redirect:/message/bulletinBoardDeleteOk";
		else return "redirect:/message/bulletinBoardDeleteNo?idx="+idx;
	}
	
	//@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/bulletinBoardContent", method=RequestMethod.GET)
	public String bulletinBoardInputGet(Model model, int idx, HttpSession session, HttpServletRequest request) {
		
		
		// 조회수 증가(중복 방지)
		ArrayList<String> boardContentIdx = (ArrayList) session.getAttribute("sBoardContentIdx");
		// 세션에서 게시글의 번호(idx)를 가져옴
		if(boardContentIdx == null) {
			boardContentIdx = new ArrayList<String>();
			// 게시글 번호가 세션에 없다면 ArrayList를 이용하여 배열로 하나 만듦(배열 안에 게시글 번호를 하나 담는다)
			
		}
		String imsiContextIdx = "board" + idx;
		// 게시글의 번호(idx)를 board 변수에 담아 생성함
		if(!boardContentIdx.contains(imsiContextIdx)) {
			bulletinBoardService.setReadNumUpdate(idx);
			// 게시글 idx가 포함되어있지 않다면 조회수 저장
			boardContentIdx.add(imsiContextIdx);
			// 조회수 +1 추가
			session.setAttribute("sBoardContentIdx", boardContentIdx);
			// 세션에 담아 저장
		}
		
	  BulletinBoardVO vo = bulletinBoardService.getBulletinBoardContent(idx);
	  
	  model.addAttribute("vo", vo);
	  
	  // 댓글 처리 
	  List<BulletinBoardReplyVO> rVos = bulletinBoardService.getBoardParentReplyList(idx);
	  model.addAttribute("rVos", rVos);	  
	  
	  return "bulletinBoard/bulletinBoardContent";
		 
	}

	@RequestMapping(value="/bulletinBoardComplaint", method=RequestMethod.GET)
	public String bulletinBoardComplaintGet(Model model) {
		List<BulletinBoardComplaintVO> vos = bulletinBoardService.getBulletinBoardComplaintList();
		
		model.addAttribute("vos", vos);
		return "bulletinBoard/bulletinBoardComplaint";
	}
	
	@ResponseBody
	@RequestMapping(value="/bulletinBoardReplyDelete", method=RequestMethod.POST)
	public String bulletinBoardReplyDeletePost(int idx) {
		int res = bulletinBoardService.setBulletinBoardReplyDelete(idx);
		
		if(res != 0) return "1";
		else return "0";
	}

	@RequestMapping(value="/bulletinBoardUpdate", method=RequestMethod.GET)
	public String bulletinBoardUpdateGet(Model model, int idx) {
		BulletinBoardVO vo = bulletinBoardService.getBulletinBoardContent(idx);
		// DB에서 게시글 내용 보기(bulletinBoardContent)의 데이터를 get으로 조회 후 idx로 반환 받고 vo로 넘겨줌 
		model.addAttribute("vo", vo);
		return "bulletinBoard/bulletinBoardUpdate";
	}
	
		
  @RequestMapping(value="/bulletinBoardUpdate", method=RequestMethod.POST)
  public String bulletinBoardUpdatePost(BulletinBoardVO vo) {
  	
  	int res = bulletinBoardService.setbulletinBoardUpdate(vo);
  	if(res != 0) return "redirect:/message/bulletinBoardUpdateOk"; 
  	else return "redirect:/message/bulletinBoardUpdateNo"; 
  }
  
  @ResponseBody
  @RequestMapping(value="/bulletinBoardComplaintInput", method=RequestMethod.POST)
  public String bulletinBoardComplaintInputPost(BulletinBoardComplaintVO vo) {
  	
  	int res = bulletinBoardService.setBulletinBoardComplaint(vo);
  	
  	
  	if(res != 0) return "1"; 
  	else return "0"; 
  }


  /*else if(com.equals("/boardGoodCheck")) {
	command = new BoardGoodCheckCommand();
	command.execute(request, response);
	return;*/
  //}

//부모댓글 입력처리(원본글에 대한 댓글)
	@ResponseBody
	@RequestMapping(value = "/boardReplyInput", method = RequestMethod.POST)
	public String boardReplyInputPost(BulletinBoardReplyVO vo) {
		
		int res = bulletinBoardService.setBoardReplyInput(vo);
		
		//System.out.println("vo" + vo );
		return res+"";
	}
	
	// 대댓글 입력처리((부모)댓글에 대한 답변글)
	@ResponseBody
	@RequestMapping(value = "/boardReplyInputRe", method = RequestMethod.POST)
	public String boardReplyInputRePost(BulletinBoardReplyVO vo) {
		// 답변글일경우는 1.re_step은 부모의 re_step+1, 2.re_order는 부모의 re_order보다 큰 댓글은 모두 +1처리후, 3.자신의 re_order+1처리한다.
		
		vo.setRe_step(vo.getRe_step() + 1);
		
		bulletinBoardService.setReplayOrderUpdate(vo.getBulletinBoardIdx(), vo.getRe_order());
		
		vo.setRe_order(vo.getRe_order() + 1);
		
		int res = bulletinBoardService.setBoardReplyInput(vo);
		
		return res+"";
	}


}
		 

