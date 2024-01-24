package com.spring.javaProjectS5.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javaProjectS5.dao.GuideDAO;
import com.spring.javaProjectS5.pagination.PageProcess;
import com.spring.javaProjectS5.pagination.PageVO;
import com.spring.javaProjectS5.service.GuideService;
import com.spring.javaProjectS5.vo.GuideVO;

@Controller
@RequestMapping("/guide")
// 중간 경로 지정
public class GuideController {
	
	@Autowired
	GuideService guideService;
	
	@Autowired
	PageProcess pageProcess;
	
	@RequestMapping(value = "/guideList", method = RequestMethod.GET)
	public String guideListGet(Model model,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "9", required = false) int pageSize,
			@RequestParam(name="part", defaultValue = "전체", required = false) String part
			) {
		// 나중에 입력된 자료부터 출력하기 (페이징 처리)
		if(part.equals("total")) part = "전체";
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "guide", part, "");
		List<GuideVO> vos = guideService.getGuidePageList(pageVO.getStartIndexNo(),pageSize,part);
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		
		// 사진을 랜덤하게 담아서 뿌려주기
		ArrayList<GuideVO> rVos = new ArrayList<GuideVO>();
		GuideVO rVO = new GuideVO();
		int randIdx = 0;
		
		for(int i = 0; i<6; i++) {
			randIdx = (int)(Math.random()*pageVO.getTotRecCnt()) + 1;
			rVO = guideService.getGuideContent(randIdx);
			if(rVO != null && !rVO.getBird_name().equals("")) {
				rVos.add(rVO);
			}
			else i--;
		}
		// for문을 사용하여 도감 작성 검색창의 아래 부분 공간에 사진 2줄(6)장을 랜덤하게 담아서 보여준다.
		// 사진이 있는 것들은 1개씩 꺼내와서 카운트를 증가시키고 사진이 없는 것이 rVO(randIdx에서 넘겨받음)에 들어오는 경우 1개 빼서(else i--;), 
		// 사진이 있는 것들로 대체시킨다. 
		model.addAttribute("rVos", rVos);
		
		return "guide/guideList";
	}
	
	@RequestMapping(value="/guideList", method=RequestMethod.POST)
	public String guideListPost(Model model, String searchString, String search) {
		if(search.equals("total")) search = "전체";
		List<GuideVO> vos = guideService.getGuideSearchList(search,searchString);
		model.addAttribute("vos", vos);
		model.addAttribute("search", search);
		return "guide/guideList";
	}
	
	@GetMapping(value="/guideWrite")
	public String guideWriteGet() {
		return "guide/guideWrite";
	}

	@RequestMapping(value="/guideWrite",	method=RequestMethod.POST)
	public String guideWritePost(MultipartHttpServletRequest mFile, GuideVO vo) {
		int res = guideService.setGuideWrite(mFile, vo);
		
		if(res !=0) return "redirect:/message/guideWriteOk";
		else return "redirect:/message/guideWriteNo";
	}
	
	@GetMapping(value="/bulletinBoardNotice")
	public String bulletinBoardNoticeGet() {
		return "guide/bulletinBoardNotice";
	}
	
	
	@RequestMapping(value="/guidePart", method=RequestMethod.GET)
	public String guideSearchGet(Model model,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "9", required = false) int pageSize,
			@RequestParam(name="part", defaultValue = "전체", required = false) String part
			) {
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "guidePart", part, "");
		
		List<GuideVO> vos = guideService.getGuidePart(pageVO.getStartIndexNo(),pageSize,part);
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		
		return "guide/guideList";
	}
	
	@RequestMapping(value="/guideSearch", method=RequestMethod.GET)
	public String guideSearchGet(
			Model model, String search, String searchString,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "9", required = false) int pageSize,
			@RequestParam(name="part", defaultValue = "전체", required = false) String part
			) {
		searchString = search + "/" + searchString;
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "guideSearch", part, searchString);
		
		List<GuideVO> vos = guideService.getGuidePageListSearch(search, searchString, pageVO.getStartIndexNo(),pageSize,part);
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		
		return "guide/guideList";
	}
	
	
	@GetMapping(value="/guideContent")
	public String guideContentGet(Model model, int idx) {
		// 조회수 증가하기(클릭했을 때만 증가시키기)
		guideService.setGuideReadNumUpdate(idx);
		
		GuideVO vo =	guideService.getGuideContent(idx);
		model.addAttribute("vo", vo);
		return "guide/guideContent";
	}
}