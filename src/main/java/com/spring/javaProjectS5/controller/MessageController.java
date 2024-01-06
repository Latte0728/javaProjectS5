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
		
		if(msgFlag.equals("signDeleteOk")) {
			model.addAttribute("msg", "회원이 삭제 되었습니다.");
			model.addAttribute("url", "user/userList");
		}
		else if(msgFlag.equals("signDeleteNo")) {
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
		else if(msgFlag.equals("guestInputOk")) {
			model.addAttribute("msg", "방명록에 글이 등록되었습니다.");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("guestInputNo")) {
			model.addAttribute("msg", "방명록 글올리기 실패~~~");
			model.addAttribute("url", "guest/guestInput");
		}
		else if(msgFlag.equals("adminLoginOk")) {
			model.addAttribute("msg", "관리자 인증 성공");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("kakaoLoginOk")) {
			model.addAttribute("msg", "카카오 로그인 성공");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("adminLoginNo")) {
			model.addAttribute("msg", "관리자 인증 실패~~");
			model.addAttribute("url", "guest/adminLogin");
		}
		else if(msgFlag.equals("adminLogout")) {
			model.addAttribute("msg", "관리자 로그아웃 되었습니다.");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("guestDeleteOk")) {
			model.addAttribute("msg", "방명록의 글이 삭제 되었습니다.");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("guestDeleteNo")) {
			model.addAttribute("msg", "방명록의 글 삭제 실패~~");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("mailSendOk")) {
			model.addAttribute("msg", "메일이 성공적으로 전송되었습니다.");
			model.addAttribute("url", "study/mail/mail");
		}
		else if(msgFlag.equals("signInNo")) {
			model.addAttribute("msg", "회원 로그인 실패");
			model.addAttribute("url", "sign/signIn");
		}
		else if(msgFlag.equals("signInOk")) {
			model.addAttribute("msg", mid + "님 로그인 되셨습니다.");
			model.addAttribute("url", "sign/signMain");
		}
		else if(msgFlag.equals("kakaosignInOk")) {
			model.addAttribute("msg", mid + "님 카카오 로그인 되셨습니다.");
			model.addAttribute("url", "sign/signMain");
		}
		else if(msgFlag.equals("signOut")) {
			model.addAttribute("msg", mid + "님 로그아웃 되었습니다.");
			model.addAttribute("url", "sign/signIn");
		}
		else if(msgFlag.equals("signUpOk")) {
			model.addAttribute("msg", "회원 가입 되었습니다.");
			model.addAttribute("url", "sign/signIn");
		}
		else if(msgFlag.equals("signUpNo")) {
			model.addAttribute("msg", "회원 가입 실패~~");
			model.addAttribute("url", "sign/signUp");
		}
		else if(msgFlag.equals("idCheckNo")) {
			model.addAttribute("msg", "아이디가 중복되었습니다.");
			model.addAttribute("url", "sign/signUp");
		}
		else if(msgFlag.equals("nickCheckNo")) {
			model.addAttribute("msg", "닉네임이 중복되었습니다.");
			model.addAttribute("url", "sign/signUpdate");
		}
		else if(msgFlag.equals("signUpdateOk")) {
			model.addAttribute("msg", "회원정보가 수정되었습니다.");
			model.addAttribute("url", "sign/signUpdate");
		}
		else if(msgFlag.equals("signUpdateNo")) {
			model.addAttribute("msg", "회원정보 수정실패~~");
			model.addAttribute("url", "sign/signUpdate");
		}
		else if(msgFlag.equals("boardInputOk")) {
			model.addAttribute("msg", "게시판에 글이 등록되었습니다.");
			model.addAttribute("url", "board/boardList");
		}
		else if(msgFlag.equals("boardInputNo")) {
			model.addAttribute("msg", "게시판에 글 등록실패~~");
			model.addAttribute("url", "board/boardInput");
		}
		else if(msgFlag.equals("adminNo")) {
			model.addAttribute("msg", "관리자만 접속하실수 있습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("signLevelNo")) {
			model.addAttribute("msg", "해당등급으로는 접근하실수 없습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("signNo")) {
			model.addAttribute("msg", "로그인후 사용하세요.");
			model.addAttribute("url", "sign/signIn");
		}
		else if(msgFlag.equals("boardDeletOk")) {
			model.addAttribute("msg", "게시글이 삭제되었습니다.");
			model.addAttribute("url", "board/boardList?pag="+pag+"&pageSize="+pageSize);
		}
		else if(msgFlag.equals("boardDeletNo")) {
			model.addAttribute("msg", "게시글 삭제 실패~~");
			model.addAttribute("url", "board/boardContent?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
		else if(msgFlag.equals("boardUpdateOk")) {
			model.addAttribute("msg", "게시글이 수정되었습니다.");
			model.addAttribute("url", "board/boardContent?idx="+idx+"&pag="+
			pag+"&pageSize="+pageSize);
		}
		else if(msgFlag.equals("boardUpdateNo")) {
			model.addAttribute("msg", "게시글 수정 실패~~");
			model.addAttribute("url", "board/boardUpdate?idx="+idx+"&pag="+pag+"&pageSize="+pageSize);
		}
		else if(msgFlag.equals("validatorError")) {
			model.addAttribute("msg", "user 등록 실패~~" + temp + "를 확인하세요..");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("fileUploadOk")) {
			model.addAttribute("msg", "파일이 업로드 되었습니다.");
			model.addAttribute("url", "study/fileUpload/fileUpload");
		}
		else if(msgFlag.equals("fileUploadNo")) {
			model.addAttribute("msg", "파일 업로드 실패~~");
			model.addAttribute("url", "study/fileUpload/fileUpload");
		}
		else if(msgFlag.equals("pdsInputOk")) {
			model.addAttribute("msg", "자료실에 등록되었습니다.");
			model.addAttribute("url", "pds/pdsList");
		}
		else if(msgFlag.equals("pdsInputNo")) {
			model.addAttribute("msg", "자료실에 등록실패~~");
			model.addAttribute("url", "pds/pdsInput");
		}
		
		
		return "include/message";
	}
}
