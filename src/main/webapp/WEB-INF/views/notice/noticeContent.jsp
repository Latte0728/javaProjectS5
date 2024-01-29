<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>공지사항 내용 보기</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script>
  	function deleteCheck() {
			let answer = confirm("삭제하시겠습니까?");
			if(!answer)	return false;
			let idx = ${vo.idx};
			
			location.href="${ctp}/notice/noticeDelete?idx="+idx;
  	}
  </script>	
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container" style="text-align:center;">
  <h2 style="text-align:center;">공지사항 내용 보기</h2>
  <p><br/></p>
	  <table class="table -table borderd">
	  	<tr class="text-dark table-dark">
	  		<th>제목</th>
	  		<td>${vo.title}</td>
	  	</tr>
	  	<tr>
	  		<th>첨부</th>
	  		<td>${vo.attch}</td>
	  	</tr>
	  	<tr>	
	  		<th>작성자</th>
	  		<td>${vo.writer}</td>
	  	</tr>
	  	<tr>	
	  		<th>내용</th>
	  		<td>${vo.content}</td>
	  	</tr>
	  	<tr>	
	  		<th>일자</th>
	  		<td>${fn:substring(vo.WDate,0,10)}</td>
	  	</tr>	
	  </table>
	  <div>
	    <c:if test="${sLevel == 1}">
	  		<input type="button" value="삭제하기" onclick="deleteCheck()" class="btn btn-danger"/>
	  	</c:if>
	  	<input type="button" value="돌아가기" onclick="history.back()" class="btn btn-info"/>
	  </div>
</div> 
<p><br/></p>
</body>
</html>