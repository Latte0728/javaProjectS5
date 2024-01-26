<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	  	<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="검색어를 입력해주세요" id="searchText" name="searchText"/>
				<input type="submit" value="검색" class="btn btn-info"/>
			</div>
		  <table class="table table-condensed" style="text-align:center;">
		  	<tr class="text-dark table-dark" >
					<th>번호</th>
					<th>제목</th>
					<th>첨부</th>
					<th>작성자</th>
					<th>작성일</th>
		  	</tr>
		  	<c:forEach var="vo" items="${vos}" varStatus="st">
			  	<tr>
			  		<td>${vo.idx}</td>
			  		<td><a href="noticeContent?idx=${vo.idx}">${vo.title}</a></td>
			  		<td>${vo.attch}</td>
			  		<td>${vo.writer}</td>
			  		<td>${fn:substring(vo.WDate,0,10)}</td>
			  	</tr>
		  	</c:forEach>
		  	<tr><td colspan="5" class="m-0 p-0"></td></tr>
		  </table>
		 </form> 
</div> 
<p><br/></p>
</body>
</html>