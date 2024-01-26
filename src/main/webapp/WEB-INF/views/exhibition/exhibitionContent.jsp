<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>주요 동물 안내</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	hr {
  	border : 5px dashed ;
  	}
  </style>
  <script>
  	function exhibitionDelete() {
  		let answer = confirm("삭제하시겠습니까?");
  		if(!answer) return false;
			
  		location.href="exhibitionDelete?idx=${vo.idx}";
  	}
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>주요 동물 안내</h2>
  <form method="post">
  	<h3>${vo.name}</h3>
  	<hr/>
  	<div>
  		<ul>
  			<li>학 명 : ${vo.SName}</li>
  		</ul>
  		<ul>
  			<li>종 분 류 : ${vo.CName}</li>
  		</ul>
  		<ul>
  			<li>분포 : ${vo.distribution}</li>
  		</ul>
  	</div>
  	<hr/>
  	<div>
  		<ul>
  			<li>식성 : ${vo.food}</li>
  		</ul>
  		<ul>
  			<li>생육 정보 : ${vo.breedInfo}</li>
  		</ul>
  		<ul>
  			<li>특징 : ${vo.content}</li>
  		</ul>
  	</div>
  </form>
  <div>
  	<input type="button" onclick="location.href='exhibitionList';" class="btn btn-warning" value="돌아가기">
  	<c:if test="${sLevel == 1}">
  		<input type="button" onclick="exhibitionDelete();" class="btn btn-danger" value="삭제">
  	</c:if>
  </div>
</div> 
<p><br/></p>
</body>
</html>