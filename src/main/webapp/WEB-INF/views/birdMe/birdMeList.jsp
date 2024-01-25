<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>내가 본 새</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
    .birdGuid {
    	float: left;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>내가 본 새</h2>
  <form method="post">
  	<div class="input-group mb-3" class="form-control">
  		<select name="search">
  			<option>새 이름</option>
  			<option>장소</option>
  			<option>내용</option>
  		</select>
  		<input type="text" id="" name="" class="form-control">
  		<div class="input-group-append"><input type="button" value="입력" onclick="location.href='birdMeInput';" class="form-control btn btn-primary"></div>
  	</div>
  </form>
 	<div>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
  		<div class="birdGuid ml-4">
	  		<h3><a href="birdMeContent?idx=${vo.idx}">${vo.title}</a></h3>
  		  <c:set var="bird_temp" value="${fn:substring(vo.content,fn:indexOf(vo.content,'src=')+34,fn:length(vo.content))}"/>
  		  <c:set var="bird_img"   value="${fn:substring(bird_temp,0,fn:indexOf(bird_temp,'.jpg')+4)}" />
	      <a href="birdMeContent?idx=${vo.idx}"><img src="${ctp}/data/ckeditor/${bird_img}" class="w3-border" style="padding:10px" width="250px" /></a><br/>
  		</div>
  		<div class="birdGuid ml-4" style="line-height:30px">
  		  <br/><br/>
  			${vo.observer}<br/>
  			${vo.location}<br/>
  			${fn:substring(vo.WDate,0,10)}<br/>
  			${vo.readNum}
  		</div>
  		<c:if test="${st.count % 2 == 0}">
  			<div style="clear:both;"></div>
  		</c:if>
  	</c:forEach>
	</div>
	<br/>
	<div style="clear:both;">
		<div><input type="button" value="글쓰기" onclick="location.href='birdMeInput';" class="btn btn-primary"></div>
 	</div>
</div> 
<p><br/></p>
</body>
</html>