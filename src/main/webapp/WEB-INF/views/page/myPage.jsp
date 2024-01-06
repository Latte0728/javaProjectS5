<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<script src="https://kit.fontawesome.com/415e1b251f.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>

<p><br/></p>
<div class="container">
	<div class="mytext">
		<span>안녕하세요 {vo.mid}님</span><br/>
		<span>국립생태원과 함께한지</span>
		<span>{vo.date}일 째 되는 날입니다.</span><br/>
		<span>오늘도 즐겁고 행복한 하루 보내세요!!!</span>
	</div>
	<table border="1">
		<tr>
			<th>개인 정보 수정하기</th>
			<td><i class="fa-solid fa-chevron-right"></i></td>
		</tr>
	</table>	
</div>
<p><br/></p>
</body>
</html>