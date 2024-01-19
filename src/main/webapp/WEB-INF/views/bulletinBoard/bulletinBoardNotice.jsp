<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>공지사항</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h1 style="text-align:center;">공지 사항</h1>
  <p><br/></p>
  	<form method="post" enctype="multipart/form-data" >
		  <table class="table table-condensed">
		  	<tr class="text-dark table-dark" style="text-align:center;">
					<th>번호</th>
					<th>제목</th>
					<th>첨부</th>
					<th>작성자</th>
					<th>작성일</th>
		  	</tr>
		  	<tr>
		  		<td>${vo.idx}</td>
		  		<td>${vo.title}</td>
		  		<td>${vo.attch}</td>
		  		<td>${vo.writer}</td>
		  		<td>${vo.WDate}</td>
		  	</tr>
		  </table>
		 </form> 
</div> 
<p><br/></p>
</body>
</html>