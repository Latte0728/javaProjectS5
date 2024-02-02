<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>404error(400errorPage)</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <hr/>
  <img src="${ctp}/images/errorpage405.jpg" width="50%">
  <div>
  	<a href="${ctp}/" class="btn btn-danger">Home화면으로 돌아가기</a>
  </div>
</div> 
<p><br/></p>
</body>
</html>