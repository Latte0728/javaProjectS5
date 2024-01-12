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
    .easy {
    	overflow: hidden;
	    /*margin-bottom: 15px;*/
	    border: 1px solid #04B404;
	    padding: 10px;
    }
    .easySearch ul li a {
    	display:inline;
    	width: 100%;
    	padding: 8px 10px 5px 10px;
    	color: #04B404;
    	font-size: 1.2em;
    	border : 1px solid green;
    }
    ul {
			padding-top: 		10px;
	    padding-right: 	10px;
	    /*padding-bottom:	10px;*/
	    padding-left: 	10px;
    }
    #search_filed{
    	color: #04B404;
    	width: 10%;
    	height: 20%;
    }
    #btnSearch{
    	border: 1px solid #04B404;
    	color: #000000;
    	background: #64FE2E;
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 style="text-align:center;">조류 도감 목록</h2>
  <p><br/></p>
  <h4>조류도감에서는 이름,학명 등의 종명 색인이나 종명 검색을 이용하여 누구나 쉽게 새를 찾아볼 수 있습니다.</h4>
  <div class="easy" >
  	<div class="easySearch" style="display:inline">	
	  	<ul  style="margin:0; padding:0; display:inline-block" >
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㄱ">가</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㄴ">나</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㄷ">다</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㄹ">라</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㅁ">마</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㅂ">바</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㅅ">사</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㅇ">아</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㅈ">자</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㅊ">차</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㅋ">카</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㅌ">타</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㅍ">파</a>
	  		</li>
	  		<li>
	  			<a href="${ctp}/guide/guideSearch?search=ㅎ">하</a>
	  		</li>
  		</ul>
  	</div>	
  	<div class="searchForm" style="display:inline">
			<form method="post" style="text-align:right; display:inline-block" class="myForm">  	
  			<select style="width:60px" name="search" id="search" >
	  			<option value="total" <c:if test="${search=='total'}">selected</c:if>>통합</option>
	  			<option value="bird_name" <c:if test="${search=='bird_name'}">selected</c:if>>이름</option>
	  			<option value="bird_SName" <c:if test="${search=='bird_SName'}">selected</c:if>>학명</option>
	  		</select>
	  		<input type="text"  name="searchString" id="searchString" required />
	  		<input type="submit" value="검색" id="btnSearch">	
	  		<input type="button" value="전체" onclick="location.href='guideList';" id="btnSearch">	
  		</form>
  	</div>
  </div>
  <c:forEach var="vo"	items="${vos}" varStatus="st">
  	<div class="guideTotal">
	    <div class="guideEa" style="width:280px;height:280px;margin:20px;">
	      ${vo.bird_name}<br/>
	      <c:set var="bird_imgs"   value="${fn:split(vo.photo,'/')}" />
	      <a href="guideContent?idx=${vo.idx}"><img src="${ctp}/guide/${bird_imgs[0]}"  class="w3-border"  style="padding:10px" width="250px" /></a><br/>
	      □ 학명 : ${vo.bird_SName}<br/>
	      □ 목/과 : ${vo.bird_class}<br/>
	    </div>
  	</div>
  </c:forEach>
</div>
<p><br/></p>
</body>
</html>