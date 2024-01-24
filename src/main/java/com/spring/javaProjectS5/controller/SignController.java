package com.spring.javaProjectS5.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.javaProjectS5.service.SignUserService;
import com.spring.javaProjectS5.vo.SignUserVO;

@Controller
@RequestMapping("/sign")
public class SignController {

	@Autowired
	SignUserService signUserService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	JavaMailSender mailSender;
	
	// 회원 로그인폼 보여주기
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String signLoginGet(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();

		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cMid")) {
					request.setAttribute("mid", cookies[i].getValue());
					break;
				}
			}
		}
		return "sign/signIn";
	}
	
	// 회원 로그인 체크
	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	public String signLoginPost(HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name="mid", defaultValue = "admin1234", required=false) String mid,
			@RequestParam(name="pwd", defaultValue = "1234", required=false) String pwd,
			@RequestParam(name="idSave", defaultValue = "", required=false) String idSave) {
		SignUserVO vo = signUserService.getSignUserIdCheck(mid);
		
		if(vo != null && vo.getUserDel().equals("NO") && passwordEncoder.matches(pwd, vo.getPwd())) {
			// 1.세션처리
			String strLevel = "";
			if(vo.getLevel() == 1) strLevel = "관리자";
			else if(vo.getLevel() == 2) strLevel = "회원";
			
			
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("strLevel", strLevel);
			
			// 2.쿠키저장/삭제
			if(idSave.equals("on")) {
				Cookie cookieMid = new Cookie("cMid", mid);
				//cookieMid.setPath("/");
				cookieMid.setMaxAge(60*60*24*7);
				response.addCookie(cookieMid);
			}
			else {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
						break;
					}
				}
			}
			return "redirect:/message/signInOk?mid="+mid;
		}
		else {
			return "redirect:/message/signInNo";
		}
		
	}
	
	// 카카오로그인 처리
	@RequestMapping(value = "/kakaoSignIn", method = RequestMethod.GET)
	public String kakaoLoginGet(HttpSession session,HttpServletRequest request, HttpServletResponse response,
			String nickName, String email, String accessToken) throws MessagingException {
		//System.out.println("nickName : " + nickName + " , email : " + email);
		session.setAttribute("sAccessToken", accessToken);
		
		// 카카오로그인한 회원이 현재 우리 회원인지를 조사한다.(넘어온 이메일의 @를 기준으로 아이디와 이메일을 분리후 signUser테이블의 정보와 비교한다.)
		SignUserVO vo = signUserService.getSignUserNickNameEmailCheck(nickName, email);
		//System.out.println("vo : " + vo);
		// 현재 카카오로그인한 회원이 우리회원이 아니였다면, 자동으로 우리회원에 가입처리한다.(필수입력사항:아이디,닉네임,이메일) - 단, 성명은 '닉네임'과 동일하게 가입처리한다.
		if(vo == null) {
			// 아이디 결정해주기
			String mid = email.substring(0, email.indexOf("@"));
			
			// 만약에 기존에 같은 아이디가 존재한다면 가입처리할수 없도록 한다.
			SignUserVO vo2 = signUserService.getSignUserIdCheck(mid);
			if(vo2 != null) return "redirect:/message/midSameSearch";
			
			// 임시 비밀번호를 발급처리후 메일로 전송처리한다.
			UUID uid = UUID.randomUUID();
			String pwd = uid.toString().substring(0,8);
			session.setAttribute("sImsiPwd", pwd);
			
			// 새로 발급받은 임시비밀번호로 암호화 처리후 DB에 저장처리한다.
			// 자동 회원 가입처리(DB에 앞에서 만들어준 값들로 가입처리한다.)
			signUserService.setKakaoSignUserInput(mid, passwordEncoder.encode(pwd), nickName, email);
			
			// 새로 발급된 임시비밀번호를 메일로 전송한다.
			mailSend(email, pwd);	
			
			// 새로 가입처리된 회원의 정보를 다시 vo에 담아준다.
			vo = signUserService.getSignUserIdCheck(mid);
		}
			
		// 1.세션처리
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		else if(vo.getLevel() == 1) strLevel = "회원";
		
		
		
		session.setAttribute("sMid", vo.getMid());
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("strLevel", strLevel);
		
		return "redirect:/message/kakaosignInOk?mid="+vo.getMid();
	}
	
	// 카카오 가입완료후 임시 비밀번호 메일 전송처리
	private void mailSend(String toMail, String content) throws MessagingException {
		String title = "임시 비밀번호를 발급하였습니다.";
		
		// 메일 전송을 위한 객체 : MimeMessage(), MimeMessageHelper()
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		// 메일보관함에 회원이 보내온 메세지들의 정보를 모두 저장시킨후 작업처리하자...
		messageHelper.setTo(toMail);
		messageHelper.setSubject(title);
		messageHelper.setText(content);
		
		// 메세지 보관함의 내용(content)에 필요한 정보를 추가로 담아서 전송시킬수 있도록 한다.
	
		content = "<br><hr><h3>임시 비밀번호는 <font color='red'>"+content+"</font></h3><hr><br>";
		content += "<p><img src=\"cid:main.jpg\" width='500px'></p>";
		content += "<p>방문하기 : <a href='http://49.142.157.251:9090/cjgreen/'>CJ Green프로젝트</a></p>";
		content += "<hr>";
		messageHelper.setText(content, true);
		
		// 본문에 기재된 그림파일의 경로를 별도로 표시시켜준다. 그런후, 다시 보관함에 담아준다.
		//FileSystemResource file = new FileSystemResource("D:\\javaweb\\springframework\\works\\javawebS\\src\\main\\webapp\\resources\\images\\main.jpg");
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		FileSystemResource file = new FileSystemResource(request.getSession().getServletContext().getRealPath("/resources/images/main.jpg"));
		messageHelper.addInline("main.jpg", file);

		// 메일 전송하기
		mailSender.send(message);
	}

	// 회원 로그 아웃처리
	@RequestMapping(value = "/signOut", method = RequestMethod.GET)
	public String signLogoutGet(HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		session.invalidate();
		
		return "redirect:/message/signOut?mid="+mid;
	}
	
	// Kakao 로그 아웃처리
	@RequestMapping(value = "/kakaosignOut", method = RequestMethod.GET)
	public String kakaoLogoutGet(HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		String accessToken = (String) session.getAttribute("sAccessToken");
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		
		try {
      URL url = new URL(reqURL);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("POST");
      conn.setRequestProperty("Authorization", "Bearer " + accessToken);

      // 카카오에 정상처리 되었다면 200번이 돌아온다.
      int responseCode = conn.getResponseCode();
      System.out.println("responseCode : " + responseCode);
      
      // 정상처리후 카카오에서는 id를 보내준다. 아래코드는 확인해보기 위해서 적어본다.
      BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      String id = "", data = "";
      while ((data = br.readLine()) != null) id += data;
      System.out.println("id : " + id);
      
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		session.invalidate();
		
		return "redirect:/message/kakaosignOut?mid="+mid;
	}
	
	@RequestMapping(value = "/signMain", method = RequestMethod.GET)
	public String signMainGet() {
		
		return "sign/signMain";
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUpGet() {
		return "sign/signUp";
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpPost(SignUserVO vo) {
		// 아이디/닉네임 중복체크
		if(signUserService.getSignUserIdCheck(vo.getMid()) != null) return "redirect:/message/idCheckNo";
		if(signUserService.getSignUserNickCheck(vo.getNickName()) != null) return "redirect:/message/nickCheckNo";
		
		// 비밀번호 암호화
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		// 회원사진 처리(service객체에서 처리후 DB에 저장한다.)
		int res = signUserService.setSignUpUserOk(vo);
		
		if(res == 1) return "redirect:/message/signUpOk";
		else return "redirect:/message/signUpNo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/signIdCheck", method = RequestMethod.POST)
	public String signIdCheckPost(String mid) {
		SignUserVO vo = signUserService.getSignUserIdCheck(mid);
		
		if(vo  != null) return "1";
		else return "0";
	}
	
	@ResponseBody
	@RequestMapping(value = "/signNickCheck", method = RequestMethod.POST)
	public String signNickCheckPost(String nickName) {
		SignUserVO vo = signUserService.getSignUserNickCheck(nickName);
		
		if(vo  != null) return "1";
		else return "0";
	}
	
	
	@RequestMapping(value = "/signPwdCheck/{pwdFlag}", method = RequestMethod.GET)
	public String signPwdCheckGet(@PathVariable String pwdFlag, Model model) {
		model.addAttribute("pwdFlag", pwdFlag);
		return "sign/signPwdCheck";
	}
	
	@ResponseBody
	@RequestMapping(value = "/signPwdCheck", method = RequestMethod.POST)
	public String signPwdCheckPost(String pwd, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		SignUserVO vo = signUserService.getSignUserIdCheck(mid);
		
		if(passwordEncoder.matches(pwd, vo.getPwd())) return "1";
		else return "0";
	}
	
	@ResponseBody
	@RequestMapping(value = "/signPwdChangeOk", method = RequestMethod.POST)
	public String signPwdChangeOkPost(String pwd, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		pwd = passwordEncoder.encode(pwd);
		int res = signUserService.setPwdChangeOk(mid, pwd);
		
		if(res != 0) return "1";
		else return "0";
	}
	
	// 회원 수정
	@RequestMapping(value = "/signUserUpdate", method = RequestMethod.GET)
	public String signUpdateGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		SignUserVO vo = signUserService.getSignUserIdCheck(mid);
		model.addAttribute("vo", vo);
		return "sign/signUserUpdate";
	}
	
	@RequestMapping(value = "/signUserUpdate", method = RequestMethod.POST)
	public String signUpdatePost(SignUserVO vo, HttpSession session) {
		// 닉네임 체크
		String nickName = (String) session.getAttribute("sNickName");
		if(signUserService.getSignUserNickCheck(vo.getNickName()) != null && !nickName.equals(vo.getNickName())) {
			return "redirect:/message/nickCheckNo";
		}
		int res = signUserService.setSignUserUpdateOk(vo);
		if(res != 0) {
			session.setAttribute("sNickName", vo.getNickName());
			return "redirect:/message/signUserUpdateOk";
		}
		else return "redirect:/message/signUserUdpateNo";
	}
	
	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "/signPasswordSearch", method = RequestMethod.POST)
	public String signPasswordSearchPost(String mid, String email) throws MessagingException {
		SignUserVO vo = signUserService.getSignUserIdCheck(mid);
		if(vo != null && vo.getEmail().equals(email)) {
			// 정보 확인후, 임시비밀번호를 발급받아서 메일로 전송처리한다.
			UUID uid = UUID.randomUUID();
			String pwd = uid.toString().substring(0,8);
			
			// 발급받은 비밀번호를 암호화후 DB에 저장한다.
			signUserService.setSignUserPasswordUpdate(mid, passwordEncoder.encode(pwd));
			
			// 발급받은 임시번호를 회원 메일주소로 전송처리한다.
			String title = "임시 비밀번호를 발급하셨습니다.";
			String mailFlag = "임시 비밀번호 : " + pwd;
			String res = mailSend(email, title, mailFlag);
			
			if(res == "1") return "1";
		}
		return "0";
	}
	
	// 메일 전송하기
	public String mailSend(String toMail, String title, String mailFlag) throws MessagingException {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String content = "";
		// 메일 전송을 위한 객체 : MimeMessage(), MimeMessageHelper()
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		// 메일보관함에 회원이 보내온 메세지들의 정보를 모두 저장시킨후 작업처리하자...
		messageHelper.setTo(toMail);
		messageHelper.setSubject(title);
		messageHelper.setText(content);
		
		// 메세지 보관함의 내용(content)에, 발신자의 필요한 정보를 추가로 담아서 전송시켜주면 좋다....
		content = content.replace("\n", "<br>");
		content += "<br><hr><h3>"+mailFlag+"</h3><hr><br>";
		content += "<p><img src=\"cid:main.jpg\" width='500px'></p>";
		content += "<p>방문하기 : <a href='49.142.157.251:9090/cjgreen'>JavaProject</a></p>";
		content += "<hr>";
		messageHelper.setText(content, true);
		
		// 본문에 기재된 그림파일의 경로와 파일명을 별로도 표시한다. 그런후 다시 보관함에 저장한다.
		FileSystemResource file = new FileSystemResource(request.getSession().getServletContext().getRealPath("/resources/images/main.jpg"));
		//FileSystemResource file = new FileSystemResource("D:\\JavaProject\\springframework\\works\\javaProjectS\\src\\main\\webapp\\resources\\images\\main.jpg");
		messageHelper.addInline("main.jpg", file);
		
		// 메일 전송하기
		mailSender.send(message);
		
		return "1";
	}
	
	// 회원가입시 이메일로 인증번호 전송하기
	@ResponseBody
	@RequestMapping(value = "/signEmailCheck", method = RequestMethod.POST)
	public String signEmailCheckPost(String email, HttpSession session) throws MessagingException {
		UUID uid = UUID.randomUUID();
		String emailKey = uid.toString().substring(0,8);
		session.setAttribute("sEmailKey", emailKey);
		
		mailSend(email, "이메일 인증키입니다.", "인증키 : "+emailKey);
		return "1";
	}
	
	// 이메일 확인하기
	@ResponseBody
	@RequestMapping(value = "/signEmailCheckOk", method = RequestMethod.POST)
	public String signEmailCheckOkPost(String checkKey, HttpSession session) throws MessagingException {
		String sCheckKey = (String) session.getAttribute("sEmailKey");
		if(checkKey.equals(sCheckKey)) return "1";
		else return "0";
	}
	
	// 아이디 검색
	@ResponseBody
	@RequestMapping(value = "/signEmailSearch", method = RequestMethod.POST)
	public String signEmailSearchPost(String email) {
		List<SignUserVO> vos = signUserService.getSignUserEmailSearch(email);
		String res = "";
		for(SignUserVO vo : vos) {
			res += vo.getMid() + "/";
		}
		if(vos.size() == 0) return "0";
		else return res;
	}

	// 회원 탈퇴 
	@ResponseBody
	@RequestMapping(value="/signUserDel", method = RequestMethod.POST)
	public String signUserDelPost(HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		int res = signUserService.setSignUserDel(mid);
			if(res == 1) {
				session.invalidate();
				return "1";
			}
			else return "0";
	}
}