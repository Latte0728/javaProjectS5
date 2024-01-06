<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h1>생태 해설 예약 프로그램</h1>
	<p><br/></p>
	<span>예약상황을 알고 싶은 날짜를 클릭하면 해당 날짜에 등록된 프로그램의 예약상황을 실시간으로 확인할 수 있습니다.</span>
	<p><br/></p>
	<div class="reserve1">
		<h2>
			<span class="fa-solid fa-play"></span> &nbsp; 1.
			날짜선택
		</h2>
			<form class="reform" method="post">
				<table border="1">
					<tr>
						<th scope="col">월</th>
						<th scope="col">화</th>
						<th scope="col">수</th>
						<th scope="col">목</th>
						<th scope="col">금</th>
						<th scope="col">토</th>
						<th scope="col">일</th>
					</tr>
					<tr>
						<td></td>
					</tr>
				</table>
			</form>
	</div>		
</div>
<p><br/></p>
</body>
</html>