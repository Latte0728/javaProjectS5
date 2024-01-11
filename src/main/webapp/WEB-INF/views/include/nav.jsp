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
						<a href="${ctp}/exhibition/exhiBition">전시</a> | 
						<a href="${ctp}/education/edu">교육</a> | 
						<a href="${ctp}/guide/guideList">도감</a> |
						<a href="${ctp}/reservation/reservationList">프로그램 예약</a> |
						<a href="${ctp}/page/menagerPage">관리자 페이지</a> |
						<a href="${ctp}/sign/signReCheck">비밀번호 재확인</a> |
						<a href="${ctp}/sign/signMain">회원 방</a> |
						<a href="${ctp}/sign/signUpdate">정보 수정</a> |
						<a href="${ctp}/bulletinBoard/bulletinBoard">게시판</a> |
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