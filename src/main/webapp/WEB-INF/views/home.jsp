<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<html>
<head>
	<title>국립생태원</title>
	<jsp:include page="/WEB-INF/views/include/nav.jsp" />
</head>
<style>
	h3{
	text-align:center;
	font-size:20;
	}
	
	h2 {text-align: center;}
	
	
	.pictures {display:none;}
	
	.layout {
		display:flex;
	
	}
	.left-menu {
		
		margin-left:80px;
		margin-right:100px;
		border-top:5px solid #3887BE;
		border-left:5px solid #3887BE;
		border-right:5px solid #3887BE;
		border-bottom:5px solid #3887BE;
	}
	.notice {
		width : 60%;
	}
	.ptext {
		display:block;
		text-shadow :2px 2px 8px rgba(0,0,0,.5);
	}
</style>
<body>

<p class="ptext" >국내 자연생태계의 지속가능성<br/>
<span> 국립생태원이 만들어갑니다.</span>
</p>
<video autoplay loop muted playsinline> 
	<source src="resources/images/mainVideo.mp4" type="video/mp4">

</video>
<p><br/></p>
<h2 style="color:blue;"> 알림 및 홍보</h2>
<div class="layout">
	<ul class="left-menu">
		<li>
			<i class="fa-regular fa-clock" style="color:#3887BE"></i>
			<h4 style="color:blue;">국립생태원 관람안내</h4>
			<h6> 	관람시간 안내  &nbsp;&nbsp; 09 : 30 ~ 18 : 00</h6>
			<h6>	매표 마감 시간 &nbsp;&nbsp; 09 : 30 ~	17 : 00</h6>
		</li>
		<p><br></p>
		<li>
			<i class="fa-solid fa-calculator" style="color:#3887BE"></i>
			<h4 style="color:blue;">이용 요금</h4>
		</li>
		<li>
			<span>성인</span>
			<p>3000원</p>
		</li>
		<li>
			<span>청소년</span>
			<p>2000원</p>
		</li>
		<li>
			<span>어린이</span>
			<p>1000원</p>
		</li>
		<li>
			<span>유료입장객 단체 4인이상
			</span>
			<p>1000원 할인</p>
		</li>
	</ul>
	<div class="notice">
		<div class="w3-bar w3-border w3-light-grey w3-center">
		  <a href="resources/images/1.png" style="width:25%" class="w3-bar-item w3-button w3-mobile">생태원 운영 안내</a>
		  <a href="resources/images/2.png" style="width:25%" class="w3-bar-item w3-button w3-mobile">국립생태원 지도 </a>
		  <a href="resources/images/3.png" style="width:25%" class="w3-bar-item w3-button w3-mobile">입장권 할인 안내</a>
		  <a href="resources/images/4.png" style="width:25%" class="w3-bar-item w3-button w3-mobile">이달의 해설</a>
		</div>
		<div class="w3-bar w3-display-container">
		  <img class="pictures" src="resources/images/1.png" style="width:100%">
		  <img class="pictures" src="resources/images/2.png" style="width:100%">
		  <img class="pictures" src="resources/images/3.png" style="width:100%">
		  <img class="pictures" src="resources/images/4.png" style="width:100%">
		  
		  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
		  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
		</div>
	</div>
</div>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("pictures");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>	
</body>
</html>
