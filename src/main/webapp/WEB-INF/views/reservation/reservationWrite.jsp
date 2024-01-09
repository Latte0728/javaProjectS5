<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>예약 프로그램 작성</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<form method="post" enctype = "multipart/form-data">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" style="width:30%"></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><input type="text" class="form-control" id="date" name="date" placeholder="날짜를 입력해주세요" style="width:30%"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="" class="form-control" id="photo" name="photo" placeholder="날짜를 입력해주세요" style="width:30%"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><text-area class="form-control" id="contents" name="contents" placeholder="제목을 입력해주세요" style="width:30%"></text-area></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><input type="text" class="form-control" id="views" name="views" placeholder="제목을 입력해주세요" style="width:30%"></td>
			</tr>			
		</table>
	</form>
</div> 
<p><br/></p>
</body>
</html>