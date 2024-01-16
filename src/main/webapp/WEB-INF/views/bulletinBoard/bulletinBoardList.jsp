<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    #searchBox{
    	display:inline;
    }
    #selectBox{
    	display:inline;
    	margin-right:10px;
    	
    } 
    .searching {
			width: 100%;
	    box-sizing: border-box;
	    border: 1px solid #ddd;
	    padding: 24px 77px;
	    margin: 0 0 30px;
	    overflow: hidden;
		
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
			<span>
				<select class="form-control" id="search" name="search" style="width:10%" id="selectBox">
					<option value="total">통합</option>
					<option value="idx">번호</option>
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="cDate">작성일</option>
				</select>
			</span>
			<span>
				<input type="text" id="searchBox" name="searchBox" class="form-control" style="width:70%" >
			</span>
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
			<c:forEach  var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.idx}</td>
					<td><a href="bulletinBoardContent?idx=${vo.idx}">${vo.title}</a></td>
					<td>${vo.nickName}</td>
					<td>${fn:substring(vo.WDate,0,19)}</td>
					<td>${vo.readNum}</td>
				</tr>
			</c:forEach>
			<tr><td colspan="5" class="m-0 p-0"></td></tr>
		</table>
		<p><br/></p>
		<div>
			<input type="button" onclick="location.href='${ctp}/bulletinBoard/bulletinBoardInput';" class="btn btn-info" value="글쓰기"/>
		</div>
</div>  
<p><br/></p>
</body>
</html>