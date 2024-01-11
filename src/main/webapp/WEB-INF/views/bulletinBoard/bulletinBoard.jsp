<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>게시판</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<style>
		.container {
			text-align:center;
		}
		.fa-solid fa-xmark{
      position: absolute;
      top: 50%;
      right: 8px;
      transform: translateY(-50%);
      cursor: pointer;
		}
			.fa-solid fa-magnifying-glass{
			position: absolute;
      top: 50%;
      left: 8px;
      transform: translateY(-50%);
    }  
	</style>  
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2>게시판</h2>
	<form method="post"></form>
		<div class="searching">
			<i class="fa-solid fa-xmark"></i>
			<i class="fa-solid fa-magnifying-glass"></i>
			<span><input type="text" id="" name="" class="form-control" style="width:30%"></span>
		</div>
		<p><br/></p>
		<table class="table table-hover text-align:center">
			<tr class="table-dark text-dark" >
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td>${vo.number}</td>
				<td>${vo.title}</td>
				<td>${vo.writer}</td>
				<td>${vo.wDate}</td>
				<td>${vo.check}</td>
			</tr>
		</table>
		<p><br/></p>
		<div>
			<input type="button" onclick="location.href='';" class="btn btn-info" value="글쓰기"/>
		</div>
</div>  
<p><br/></p>
</body>
</html>