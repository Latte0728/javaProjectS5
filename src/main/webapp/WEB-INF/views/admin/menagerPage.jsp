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
	    width:15%;
	    height:20%;
	    text-align:center;
		}
		.complaint{
		 	content: ""; 
	    top: 30px;
	    left: 30px;
	    transform: translateX(-50%);
	    background-color: #FF0000;
	    padding: 10px 15px;
	    font-size:15px;
		}
		.notice{
			box-sizing:border-box;
	    padding: 35px;
	    border: 1px solid #ccc;
	    border-radius: 10px;
	    position: relative;
	    width:15%;
	    height:20%;
	    text-align:center;
		}
		.notice{
		 	content: ""; 
	    top: 30px;
	    left: 30px;
	    transform: translateX(-50%);
	    background-color: #FF8000;
	    padding: 10px 15px;
	    font-size:15px;
		}
		.review {
	  	box-sizing:border-box;
	    padding: 35px;
	    border: 1px solid #ccc;
	    border-radius: 10px;
	    position: relative;
	    width:15%;
	    height:20%;
	    text-align:center;
	    }
	
	  .review {
	    content: ""; 
	    top: 30px;
	    left: 30px;
	    transform: translateX(-50%);
	    background-color: #F7FE2E;
	    padding: 10px 15px;
	  	font-size:15px;
	    }
		.why {
	  	box-sizing:border-box;
	    padding: 35px;
	    border: 1px solid #ccc;
	    border-radius: 10px;
	    position: relative;
	    width:20%;
	    height:20%;
	    text-align:center;
	    }
	
	  .why {
	    content: ""; 
	    top: 30px;
	    left: 70px;
	    transform: translateX(-50%);
	    background-color: #01DFD7;
	    padding: 10px 15px;
	  font-size:15px;
	    }
		.bird {
	  	box-sizing:border-box;
	    padding: 35px;
	    border: 1px solid #ccc;
	    border-radius: 10px;
	    position: relative;
	    width:20%;
	    height:20%;
	    text-align:center;
	    }
	
	  .bird {
	    content: ""; 
	    top: 30px;
	    left: 85px;
	    transform: translateX(-50%);
	    background-color: #d6e6f5;
	    padding: 10px 15px;
	  font-size:15px;
	    }
	    .book {
		  	box-sizing:border-box;
		    padding: 35px;
		    border: 1px solid #ccc;
		    border-radius: 10px;
		    position: relative;
		    width:20%;
		    height:20%;
		    text-align:center;
	    }
	
	    .book {
		    content: ""; 
		    top: 30px;
		    left: 200px;
		    transform: translateX(-50%);
		    background-color: #b5d692;
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
		    left: 160px;
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
				<div class="complaint" style="margin-left:100px; display:inline-block">
					<a style="text-decoration:none;" href="${ctp}/bulletinBoard/bulletinBoardComplaint">
						<i class="fa-solid fa-clipboard-check fa-4x"></i>
						<p><br/></p>
			  		<font color="black">신고 확인</font>
					</a>
				</div>	
				<div class="notice" style="margin-left:10px; display:inline-block">
					<a style="text-decoration:none;" href="${ctp}/notice/noticeInput">
						<i class="fa-solid fa-circle-exclamation fa-4x"></i>
						<p><br/></p>
			  		<font color="black">공지 작성</font>
					</a>
				</div>	
				<div class="review" style="margin-left:10px; display:inline-block">
					<a style="text-decoration:none;" href="${ctp}/guide/guideWrite">
						<i class="fa-solid fa-dragon fa-4x"></i>
						<p><br/></p>
			  		<font color="black">도감 작성</font>
					</a>
				</div>
				<div class="why" style="margin-left:10px; display:inline-block">
					<a style="text-decoration:none;" href="${ctp}/bird/birdWrite">
						<i class="fa-solid fa-dove fa-4x"></i>
						<p><br/></p>
			  		<font color="black">새에 대한 궁금한 이야기</font>
					</a>
				</div>
				<div class="bird" style="margin-left:10px; display:inline-block">
					<a style="text-decoration:none;" href="${ctp}/exhibition/exhibitonInput">
						<i class="fa-solid fa-crow fa-4x"></i>
						<p><br/></p>
			  		<font color="black">주요 전시 동물 작성 창</font>
					</a>
				</div>
			</div>
			<div class="book" style="margin-left:540px; display:inline-block; margin-top:15px;">
				<a style="text-decoration:none;" href="${ctp}/reservation/reservationAdminView">
					<i class="fa-solid fa-book-open-reader fa-4x"></i>
					<p><br/></p>
		  		<font color="black">프로그램 예약 현황</font>
				</a>
			</div>
			<div class="statics" style="margin-left:-100px; display:inline-block">
				<a style="text-decoration:none;" href="${ctp}/admin/qrCreate">
					<i class="fa-solid fa-chart-pie  fa-4x"></i>
					<p><br/></p>
		  		<font color="black">QR코드 생성</font>
				</a>
			</div>	
<p><br/></p>
</body>
</html>