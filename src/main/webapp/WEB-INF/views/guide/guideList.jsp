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
    
    .container img{
    	position:relative;
    	z-index: 1;
    }
    .container .qrCode{
    	position:absolute;
    	width:70px;
    	height:70px;
    	z-index:2;
    	margin-left: 179px;
    	margin-top: 122px;
    }
    
  </style>
  <script>
  	'use strict';
	  function pageSizeCheck() {
	    	let pageSize = $("#pageSize").val();
	    	// pageSize 선언 후 val함수에 $("#pageSize") 값 받아옴
	    	location.href = "guideList?pageSize="+pageSize;
    }
	 </script>  
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 style="text-align:center;">조류 도감 목록</h2>
  <p><br/></p>
  <h4>조류도감에서는 이름,학명 등의 종명 색인이나 종명 검색을 이용하여 누구나 쉽게 새를 찾아볼 수 있습니다.</h4>
  <div class="border pl-3 pt-3">
  	<div class="form-group">
			<a href="${ctp}/guide/guidePart?part=ㄱ" class="border p-2">가</a>
			<a href="${ctp}/guide/guidePart?part=ㄴ" class="border p-2">나</a>
			<a href="${ctp}/guide/guidePart?part=ㄷ" class="border p-2">다</a>
			<a href="${ctp}/guide/guidePart?part=ㄹ" class="border p-2">라</a>
			<a href="${ctp}/guide/guidePart?part=ㅁ" class="border p-2">마</a>
			<a href="${ctp}/guide/guidePart?part=ㅂ" class="border p-2">바</a>
			<a href="${ctp}/guide/guidePart?part=ㅅ" class="border p-2">사</a>
			<a href="${ctp}/guide/guidePart?part=ㅇ" class="border p-2">아</a>
			<a href="${ctp}/guide/guidePart?part=ㅈ" class="border p-2">자</a>
			<a href="${ctp}/guide/guidePart?part=ㅊ" class="border p-2">차</a>
			<a href="${ctp}/guide/guidePart?part=ㅋ" class="border p-2">카</a>
			<a href="${ctp}/guide/guidePart?part=ㅌ" class="border p-2">타</a>
			<a href="${ctp}/guide/guidePart?part=ㅍ" class="border p-2">파</a>
			<a href="${ctp}/guide/guidePart?part=ㅎ" class="border p-2 mr-4">하</a>
	  	<div class="searchForm form-group-append" style="display:inline">
				<form method="post" style="text-align:right; display:inline-block" class="myForm">  	
	  			<select name="search" id="search" >
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
  </div>
	<hr/>
	<!-- 사진 2줄(6장)을 랜덤하게 화면에 뿌려주기 -->
	<c:forEach var="vo"	items="${rVos}" varStatus="st">
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
	<hr style="clear:both" />
  <c:forEach var="vo"	items="${vos}" varStatus="st">
  	<div class="guideTotal">
	    <div class="guideEa" style="width:280px;height:280px;margin:20px;">
	      ${vo.bird_name}<br/>
	      <c:set var="bird_imgs"   value="${fn:split(vo.photo,'/')}" />
	      <img class="qrCode" src="${ctp}/qrCode/${vo.qrCodeName}.png" />
	      <a href="guideContent?idx=${vo.idx}"><img src="${ctp}/guide/${bird_imgs[0]}"  class="w3-border "  style="padding:10px" width="250px" /></a><br/>
	      □ 학명 : ${vo.bird_SName}<br/>
	      □ 목/과 : ${vo.bird_class}<br/>
	    </div>
  	</div>
  </c:forEach>
	<p><br/></p>
</div>
<!-- 블록 페이징 처리 -->
<div class="text-center" style="clear:both;">
  <ul class="pagination justify-content-center">
    <c:if test="${pageVO.pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="guideList?pag=1&pageSize=${pageVO.pageSize}">첫페이지</a></li></c:if>
  	<c:if test="${pageVO.curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="guideList?pag=${(pageVO.curBlock-1)*pageVO.blockSize+1}&pageSize=${pageVO.pageSize}">이전블록</a></li></c:if>
  	<c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}" varStatus="st">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="guideList?pag=${i}&pageSize=${pageVO.pageSize}">${i}</a></li></c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}"><li class="page-item"><a class="page-link text-secondary" href="guideList?pag=${i}&pageSize=${pageVO.pageSize}">${i}</a></li></c:if>
  	</c:forEach>
  	<c:if test="${pageVO.curBlock < pageVO.lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="guideList?pag=${(pageVO.curBlock+1)*pageVO.blockSize+1}&pageSize=${pageVO.pageSize}">다음블록</a></li></c:if>
  	<c:if test="${pageVO.pag < pageVO.totPage}"><li class="page-item"><a class="page-link text-secondary" href="guideList?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}">마지막페이지</a></li></c:if>
  </ul>
</div>  
<p><br/></p>
</body>
</html>