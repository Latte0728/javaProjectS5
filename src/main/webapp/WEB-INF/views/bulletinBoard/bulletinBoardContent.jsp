<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>게시글 내용 글보기</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	th{
  		background-color: #ddd;
  		text-align: center;
  	}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>게시글 내용 보기</h2>
  <table class="table table-border">
  	<tr>
  		<th>글쓴이</th>
  		<td>${vo.nickName}</td>
  		<th>조회수</th>
  		<td>${vo.readNum}</td>
  	</tr>
  	<tr>
  		<th>올린 날짜</th>
  		<td>${vo.WDate}</td>
  		<th>좋아요</th>
  		<td>${vo.good}</td>
  	</tr>
  	<tr>
  		<th>제목</th>
  		<td colspan="3">${vo.title}</td>
  	</tr>
  	<tr>
  		<th>내용</th>
  		<td colspan="3">${vo.content}</td>
  	</tr>
  	<tr>
  		<td colspan="4">
  			<input type="button" value="돌아가기" onclick="location.href='bulletinBoardList'" class="btn btn-success"/>
  			<c:if test="${vo.nickName == sNickName}">
	  			<input type="button" value="수정하기" onclick="location.href='bulletinBoardUpdate'" class="btn btn-info"/>
	  			<input type="button" value="삭제하기" onclick="deleteCheck()'" class="btn btn-danger"/>
  			</c:if>
  		</td>
  	</tr>
  </table>
</div> 
<p><br/></p>
</body>
</html>