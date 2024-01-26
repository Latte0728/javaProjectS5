<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>네비게이션</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<script src="https://kit.fontawesome.com/415e1b251f.js" crossorigin="anonymous"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	  window.Kakao.init("01abf913d97f588ec72ae806bb807a86");
	
	  function kakaoLogout() {
		  const accessToken = Kakao.Auth.getAccessToken();
		  if(accessToken) {
			  Kakao.Auth.logout(function() {
				  window.location.href = "https://kauth.kakao.com/oauth/logout?client_id=01abf913d97f588ec72ae806bb807a86&logout_redirect_uri=http://localhost:9090/javaProjectS5/sign/signOut";
			  });
		  }
		  else {
			  location.href = "${ctp}/sign/signOut";
		  }
	  }
	  
	  function signDelCheck() {
		  let ans = confirm("회원 탈퇴하시겠습니까?");
		  if(ans) {
			  ans = confirm("탈퇴하시면 1개월간 같은 아이디로 다시 가입하실수 없습니다.\n그래도 탈퇴 하시겠습니까?");
			  if(ans) {
				  $.ajax({
					  type : "post",
					  url  : "${ctp}/sign/signUserDel",
					  success:function(res) {
						  if(res == "1") {
							  alert("회원에서 탈퇴 되셨습니다.");
							  location.href = '${ctp}/sign/signIn';
						  }
						  else {
							  alert("회원 탈퇴신청 실패~~");
						  }
					  },
					  error : function() {
						  alert("전송오류!");
					  }
				  });
			  }
		  }
	  }
	</script>
	<style>
		li {display:inline;}
	</style>
</head>
<body>
		<!-- navigation -->
		<div class="container">
			<nav class="navmenu">
				<ul id="menu">
					<li>
						<a href="${ctp}/exhibition/exhibitionList">전시</a> | 
						<a href="${ctp}/guide/guideList">도감</a> |
						<a href="${ctp}/reservation/reservationList">프로그램 예약</a> |
						<c:if test="${sLevel == 1}">
					    <a href="${ctp}/page/menagerPage">관리자 페이지</a> |
						</c:if>
						<a href="${ctp}/sign/signMain">회원 방</a> |
						<a href="${ctp}/bulletinBoard/bulletinBoardList">게시판</a> |
						<a href="${ctp}/notice/noticeList">공지 사항</a> |
						<a href="${ctp}/birdMe/birdMeList">내가 본 새</a> |
						<a href="${ctp}/bird/birdFeature">새의 특징</a> |
						<c:if test="${empty sMid}">
							<a href="${ctp}/sign/signIn">로그인</a> |
						</c:if>
						<c:if test="${!empty sMid}">
						  ${sMid}님 페이지 |
							<a href="javascript:kakaoLogout()">로그 아웃</a> |
						</c:if>
						<a href="${ctp}/sign/signUp">회원 가입</a> 
					</li>
				</ul>
			</nav>
		</div>
</body>
</html>