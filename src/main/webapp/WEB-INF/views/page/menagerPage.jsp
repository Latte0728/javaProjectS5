<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
<style>
	.new{
		border: 5px solid #0080FF;
	}
	.complaint{
		box-sizing:border-box;
    padding: 35px;
    border: 1px solid #ccc;
    border-radius: 10px;
    position: relative;
    width:20%;
    height:20%;
    text-align:center;
	}
	.complaint{
	 content: ""; 
    top: 30px;
    left: 10%;
    transform: translateX(-50%);
    background-color: #FF0000;
    padding: 10px 15px;
    font-size:15px;
	}
	.review {
  	box-sizing:border-box;
    padding: 35px;
    border: 1px solid #ccc;
    border-radius: 10px;
    position: relative;
    width:20%;
    height:20%;
    text-align:center;
    }

    .review {
    content: ""; 
    top: 30px;
    left: 10%;
    transform: translateX(-50%);
    background-color: #01DFD7;
    padding: 10px 15px;
    font-size:15px;
    }
	.statics {
  	box-sizing:border-box;
    padding: 35px;
    border: 1px solid #ccc;
    border-radius: 10px;
    position: relative;
    width:20%;
    height:20%;
    text-align:center;
    }

    .statics {
    content: ""; 
    top: 30px;
    left: 10%;
    transform: translateX(-50%);
    background-color: #04B431;
    padding: 10px 15px;
    font-size:15px;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
		<h2>관리자 페이지</h2>
			<div>
			<hr class="new" />
				<p>안녕하세요 관리자님!!!</p><br/>
				<p>오늘도 즐거운 하루 보내세요!!!</p>
			</div>
			<hr class="new" />
				<img src="${ctp}/resources/images/5.png" style="width:1110px; height:300px"/>
			<hr class="new" />
			<div class="complaint" style="margin-left:120px; display:inline-block">
				<a style="text-decoration:none;" href="${ctp}//">
				<i class="fa-solid fa-clipboard-check fa-4x" style="color:white;"></i>
				<p><br/></p>
	  		<font color="white">신고 확인</font>
				</a>
			</div>	
			<div class="review" style="margin-left:100px; display:inline-block">
				<a style="text-decoration:none;" href="${ctp}//">
				<i class="fa-solid fa-dragon fa-4x" style="color:white;"></i>
				<p><br/></p>
	  		<font color="white">도감 작성</font>
				</a>
			</div>
			<div class="statics" style="margin-left:100px; display:inline-block">
				<a style="text-decoration:none;" href="${ctp}//">
				<i class="fa-solid fa-chart-pie  fa-4x" style="color:white;"></i>
				<p><br/></p>
	  		<font color="white">선호 프로그램 통계</font>
				</a>
			</div>	
</div>
<p><br/></p>
</body>
</html>