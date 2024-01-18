<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
  <p><br/></p>
  <table class="table table-condensed" style="text-align:center">
  	<tr class="table-dark text-dark">
  		<th>번호</th>
  		<th>제목</th>
  		<th>작성자</th>
  		<th>작성일</th>
  	</tr>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
	  	<tr>
	  		<td>${vo.idx}</td>
	  		<td>${vo.content}</td>
	  		<td>${vo.mid}</td>
	  		<td>${fn:substring(vo.WDate,0,16)}</td>
	  	</tr>
  	</c:forEach>	
  </table>
</div> 
<p><br/></p>
</body>
</html>