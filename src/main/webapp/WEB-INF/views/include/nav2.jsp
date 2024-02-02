<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>네비게이션2</title>
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
	</script>
	<style>
		li {display:inline;}
	</style>
</head>
<body>
<div class="container">
  <div class="w3-bar w3-light-white">
    <a href="${ctp}/" class="w3-bar-item w3-button"><img src="${ctp}/images/logo.png" style="width:100px; margin-top:-20px"></a>
    <a href="${ctp}/exhibition/exhibitionList" class="w3-bar-item w3-button">전시</a>
    <a href="${ctp}/guide/guideList" class="w3-bar-item w3-button">도감</a>
    <a href="${ctp}/reservation/reservationList" class="w3-bar-item w3-button">프로그램 예약</a>
    <a href="${ctp}/bird/birdFeature" class="w3-bar-item w3-button">새에 대한 궁금한 이야기</a>
    <div class="w3-dropdown-hover">
      <button class="w3-button">커뮤니티</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="${ctp}/notice/noticeList" class="w3-bar-item w3-button">공지사항</a>
        <a href="${ctp}/bulletinBoard/bulletinBoardList" class="w3-bar-item w3-button">게시판</a>
      	<a href="${ctp}/birdMe/birdMeList" class="w3-bar-item w3-button">내가 본 새</a>
      </div>
    </div>
    <div style="margin-top:10px;">
	    <c:if test="${empty sMid}">
				<a href="${ctp}/sign/signIn">로그인</a> |
				<a href="${ctp}/sign/signUp">회원 가입</a>
			</c:if>
			<c:if test="${!empty sMid}">
			  ${sMid}님 페이지 |
				<a href="javascript:kakaoLogout()">로그 아웃</a>
				<c:if test="${sLevel == 1}">| <a href="${ctp}/admin/menagerPage">관리자</a></c:if>
				<c:if test="${sLevel == 2}">| <a href="${ctp}/sign/signMain">마이 페이지</a></c:if>
			</c:if>
		</div>				 
  </div>
</div>
</body>
</html>