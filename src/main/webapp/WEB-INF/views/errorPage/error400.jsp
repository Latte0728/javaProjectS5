<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>현재 페이지는 작업중으로 불편을 드려서 죄송합니다.</h2>
  <hr/>
  <img src="">
  <div>
  	<a href="${ctp}/" class="btn btn-danger">Home화면으로 돌아가기</a>
  </div>
</div> 
<p><br/></p>
</body>
</html>