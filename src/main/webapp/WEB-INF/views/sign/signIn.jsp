<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<meta charset="UTF-8">
	<title>로그인</title>
	<style>
		.container{
			text-align:center;
		}
		.idform {
			position:relative;
			
		}
		.idform span{
			position:absolute;
			top:6px;
			left:403px;
		}
		#mid{
			padding-left:35px;
		}
		.pwdform {
			position:relative;
		}
		.pwdform span{
			position:absolute;
			top:6px;
			left:403px;
		}
		#pwd{
			padding-left:35px;
		}
		.search{
			position: relative; top: 50%; left: 50%; transform: translate(-50%, -50%); 

		}
		
	</style>
	<script>
		'use strict';
		
		// 1. 요소를 불러와 변수에 담아준다.
		$(function() {
			const signBtn = document.getElementById("SiGnin");
			const id = document.getElementById("mid");
			const pwd = document.getElementById("pwd"); 
			
			id.addEventListener("keyup", signCheck);
			pwd.addEventListener("keyup", signCheck);
			
			// 2. 조건이 맞을 때 실행될 수 있도록 함수를 작성한다.
		  function signCheck(){
			
			if(id.value.length>=5 && pwd.value.length>=1 && pwd.value.length<=20) {
			// 아이디 입력시의 글자 수가 5 이상 비밀번호 입력 시 글자 수가 1 ~ 20이하일 시 	
						
						signBtn.disabled=false;
					}
					else {
						signBtn.disabled=true;
					}				
		
			}
		});
		
		$(function() {
    	$("#searchMid").hide();
    	$("#searchPassword").hide();
    });
    
    // 아이디 찾기 폼 보기
    function midSearch() {
    	$("#searchPassword").hide();
    	$("#searchMid").show();
    }
    
    // 이메일 검색처리
    function emailFind() {
    	let email = $("#emailSearch").val().trim();
    	if(email == "") {
    		alert("가입시 등록한 email을 입력하세요");
    		$("#emailSearch").focus();
    		return false;
    	}
    	
    	$.ajax({
    		url  : "${ctp}/sign/signEmailSearch",
    		type : "post",
    		data : {email : email},
    		success:function(res) {
    			if(res != 0) {
	    			let temp = res.split("/");
	    			console.log("temp :", temp);
	    			let str = '검색결과 : <br/><font color=blue><b>';
	    			for(let i=0; i<temp.length; i++) {
	    				let jump = Math.floor((Math.random()*(4-2)) + 2);
	    				let tempMid = temp[i].substring(0,1);
	    				console.log("tempMid",tempMid,", jump",jump);
	    				for(let j=1; j<temp[i].length; j++) {
	    					if(j % jump == 0) tempMid += "*";
	    					else tempMid += temp[i].substring(j,j+1);
	    				}
		    			str += tempMid;
		    			
		    			str += "<br/>";
	    			}
	    			str += '</b></font>';
	    			$("#midShow").html(str);
    			}
    			else {
    				alert("검색한 아이디가 없습니다.")
    			}
    		},
    		error : function() {
    			alert("전송 오류!");
    		}
    	});
    }
  
    // 비밀번호 검색폼 보여주기
    function searchPassword() {
    	$("#searchMid").hide();
    	$("#searchPassword").show();
    
    }
    
    // 비밀번호 검색처리
    function passwordFind() {
    	let mid = $("#midSearch").val().trim();
    	let email = $("#emailSearch2").val().trim();
    	if(mid == "" || email == "") {
    		alert("가입시 등록한 아이디와 메일주소를 입력하세요");
    		$("#midSearch").focus();
    		return false;
    	}
    	
    	let query = {
    			mid   : mid,
    			email : email
    	}
    	
    	$.ajax({
    		url  : "${ctp}/sign/signPasswordSearch",
    		type : "post",
    		data : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("새로운 비밀번호가 회원님 메일로 발송 되었습니다.");
    			}
    			else {
    				alert("등록하신 정보가 잘못되었습니다. 확인후 다시 전송하세요.");
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
		    
		    
    // 카카오로그인을 위한 자바스크립트 앱키
    window.Kakao.init("01abf913d97f588ec72ae806bb807a86");
    
    function kakaoLogin() {
    	// 카카오에 인증요청처리를 한다.
    	window.Kakao.Auth.login({
    		scope: 'profile_nickname, account_email',
    		success:function(autoObj) {
    			console.log(Kakao.Auth.getAccessToken(), "정상 토큰발급됨...");
    			window.Kakao.API.request({
    				url : '/v2/user/me',
    				success:function(res) {
    					const kakao_account = res.kakao_account;
    					console.log(kakao_account);
    					location.href = "${ctp}/sign/kakaoSignIn?nickName="+kakao_account.profile.nickname+"&email="+kakao_account.email+"&accessToken="+Kakao.Auth.getAccessToken();
    				}
    			});
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
		<h2>로그인</h2>
		<p><br/></p>
		<p><b>국립생태원을 찾아주셔서 진심으로 감사드립니다.</b><br/>
		로그인을 하셔서 국립생태원 내의 더욱 더 재미있고 다양한 서비스를 이용해보세요!
		</p>
		<p><br/></p>
		<form class="signform" method="post">
			<div class="did">
				<div class="idform">
					<span><i class="fa-solid fa-user"></i></span> 
					<input type="text" id="mid" name="mid" placeholder="아이디" autofocus class="form-control" style="width:30%; display:inline-block;" />
				</div>
			</div>	
			<div class="dpwd">
				<div class="pwdform"> 
					<span><i class="fa-solid fa-lock"></i></span>
					<input type="password"  maxlength="20" id="pwd" name="pwd"  placeholder="비밀번호(20글자 이내로 입력해주세요)"  class="form-control" style="width:30%; display:inline-block;">
				</div>
			</div>	
			<p><br/></p>
			<div class="selection">
				<div class="sel">
					<input type="checkbox" id="idSave" name="idSave" /> 아이디 저장 &nbsp;  &nbsp;
					<p><br/></p>
					<input type="submit" id="SiGnin" name="siGnin" onclick="signCheck()" value="로그인" disabled class="btn btn-primary form-control" style="width:30%" />
				</div>
			</div>	
			<hr/>
			<div class="find mb-3">
				<a href="javascript:midSearch()">아이디 찾기 |</a>
				<a href="javascript:searchPassword()">비밀번호 찾기 |</a>
				<a href="${ctp}/sign/signUp">회원가입</a>
			</div>
			<div>
				<a href="javascript:kakaoLogin()"><img src="${ctp}/images/kakao_login_medium_narrow.png" width="155px"/></a>
			</div>
		</form>	
			<p><br/></p>
			<form name="searchForm">
				<div id="searchMid">
					<i class="fa-solid fa-envelope"></i>
					<span>이메일</span><br/>
					<span><input type= text class="search form-control" id="emailSearch" name="emailSearch" placeholder="회원 가입시의 이메일을 입력해주세요" style="width:30%" /></span>
					<span><input type="button" class="btn btn-primary" onclick="emailFind()"  value="검색" /></span>
					<span><input type="reset" class="btn btn-danger" id="cancel" name="cancel" value="취소"  /></span>
				</div>
				<br/>
				<div id="midShow"></div>
				<div class="searchPassword" id = "searchPassword">
					<span>아이디</span>
					<span><input type= text class="search form-control" id="midSearch" name="midSearch" placeholder=" 아이디를 입력해주세요" style="width:30%" /></span>
					<span>이메일</span>
					<span><input type= text class="search form-control"  id="emailSearch2" class="form-control" placeholder="메일주소를 입력해주세요" style="width:30%" /></span>
					<span><input type="submit" class="btn btn-primary" onclick="passwordFind()" value="확인" /></span>
					<span><input type="reset" class="btn btn-danger" id="rest" name="rest" value="취소"  /></span>
				</div>
			</form>
</div>
<p><br/></p>
</body>
<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</html>