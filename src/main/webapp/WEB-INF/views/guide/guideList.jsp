<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>도감</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
    .guideEa {
      float: left;
      margin: 10px;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>조류 도감 리스트</h2>
  <c:forEach var="vo"	items="${vos}" varStatus="st">
  	<div class="guideTotal">
	    <div class="guideEa" style="width:280px;height:280px;margin:20px;">
	      ${vo.bird_name}<br/>
	      <c:set var="bird_imgs" value="${fn:split(vo.photo,'/')}" />
	      <a href="guideContent?idx=${vo.idx}"><img src="${ctp}/guide/${bird_imgs[0]}" width="250px" /></a><br/>
	      □ 학명 : ${vo.bird_SName}<br/>
	      □ 목/과 : ${vo.bird_class}<br/>
	    </div>
  	</div>
  </c:forEach>
</div>
<p><br/></p>
</body>
</html>