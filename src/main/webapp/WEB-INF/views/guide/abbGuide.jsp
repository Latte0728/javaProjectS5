<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>도감</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<div class="container">
	<!-- 도감 내용 시작 -->
	<div class="bird_text">
		<a href="">
		<!-- a href="" 을 이용하여 화면 이미지 클릭시 그 이미지에 해당하는 도감 내용이 나옴  -->
		<h3>${vo.name}</h3>
		<span>
			<img src="" alt="${vo.name}">
		</span>
		<div class="name_kr">
			<ul>
				<li>
					<b>학명</b>
					" : ${vo.학명}";
				</li>
				<li>
					<b>목/과</b>
					" : ${목/과}";
				</li>
			</ul>
		</div>
		<!-- name_kr -->
		</a>
	</div>
	<!-- bird_text -->
</div>
</body>
</html>