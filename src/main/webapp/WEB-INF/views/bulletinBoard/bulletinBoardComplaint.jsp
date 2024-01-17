<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>신고 확인 창</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 style="text-align:center;">신고 확인 창</h2>
  <table class="table table-hover" style="text-align:center">
  	<tr class="table-dark text-dark">
  		<th>번호</th>
  		<th>제목</th>
  		<th>작성자</th>
  		<th>작성일</th>
  	</tr>
  	<tr>
  		<td>${vo.idx}</td>
  		<td>${vo.title}</td>
  		<td>${vo.nickName}</td>
  		<td>${vo.WDate}</td>
  	</tr>
  </table>
</div> 
<p><br/></p>
</body>
</html>