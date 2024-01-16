package com.spring.javaProjectS5.controller;

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
		if(part.equals("total")) part = "전체";
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "guide", part, "");
		
		
		List<GuideVO> vos = guideService.getGuidePageList(pageVO.getStartIndexNo(),pageSize,part);
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		
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
		System.out.println("vo : " + vo);
		int res = guideService.setGuideWrite(mFile, vo);
		
		if(res !=0) return "redirect:/message/guideWriteOk";
		else return "redirect:/message/guideWriteNo";
	}
	
	
	/*
	 * @RequestMapping(value="/guideList", method=RequestMethod.GET) public String
	 * guideListGet(Model model) { List<GuideVO> vos = guideService.getGuideList();
	 * model.addAttribute("vos", vos); return "guide/guideList"; }
	 */
	 	
	
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
		System.out.println("vos : " + vos);
		System.out.println("pageVO : " + pageVO);
		System.out.println("part : " + part);
		
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
		GuideVO vo =	guideService.getGuideContent(idx);
		model.addAttribute("vo", vo);
		return "guide/guideContent";
	}
}