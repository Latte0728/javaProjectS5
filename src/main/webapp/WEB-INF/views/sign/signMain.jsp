<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>signMain.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
 	<style>
 		a {
 		text-decoration-line: none;
 		}
 		hr.new {
 		 border: 5px solid #A3CCA3;
		}
		.ok {
    	box-sizing:border-box;
      padding: 35px;
      border: 1px solid #ccc;
      border-radius: 10px;
      position: relative;
      width:20%;
      height:20%;
      text-align:center;
    }

    .ok {
      content: ""; 
      top: 30px;
      left: 10%;
      transform: translateX(-50%);
      background-color: #2E9AFE;
      padding: 10px 15px;
      font-size:15px;
    }
    
    .complaint {
      box-sizing:border-box;
      padding: 35px;
      border: 1px solid #ccc;
      border-radius: 10px;
      position: relative;
      width:20%;
      height:20%;
      text-align:center;
      
    }

    .complaint {
      content: ""; 
      top: 30px;
      left: 10%;
      transform: translateX(-50%);
      background-color: #FF0040;
      padding: 10px 15px;
      font-size:15px;
      
    }
    
    .info {
    	box-sizing:border-box;
      padding: 35px;
      border: 1px solid #ccc;
      border-radius: 10px;
      position: relative;
      width:20%;
      height:20%;
      text-align:center;
    }

    .info {
      content: ""; 
      top: 30px;
      left: 10%;
      transform: translateX(-50%);
      background-color: #D7DF01;
      padding: 10px 15px;
      font-size:15px;
    }
    .Quit {
    	box-sizing:border-box;
      padding: 35px;
      border: 1px solid #ccc;
      border-radius: 10px;
      position: relative;
      width:20%;
      height:20%;
      text-align:center;
    }

    .Quit {
      content: ""; 
      top: 30px;
      left: 10%;
      transform: translateX(-50%);
      background-color: #01DF01;
      padding: 10px 15px;
      font-size:15px;
    }
 	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>회 원 전 용 방</h2>
  <hr class="new" />
  <div>
  	<p> 회원님의 방문을 진심으로 환영합니다.</p>
  </div>
  <hr class="new" />
  	<img src="${ctp}/resources/images/1.jpeg" style="width:1110px; height:300px"/>
  <hr class="new" />
  <div class="ok" style="display:inline-block;">
  	<a style="text-decoration:none;" href="${ctp}/reservation/reservationConfirm">
	  	<i class="fa-regular fa-calendar-days fa-4x" style="color:white"></i>
	  	<p><br/></p>
	  	<font color="white">예약 확인</font>
 		</a>
  </div>
  <div class="complaint" style="margin-left:68.1px; display:inline-block">
  	<i class="fa-solid fa-clipboard-list fa-4x" style="color:white;" ></i>
  	<p><br/></p>
  	<font color="white">내가 올린 글 조회</font>
  </div>
  <div class="info" id="info" style="margin-left:68.1px; display:inline-block">
  	<a style="text-decoration:none;" href="${ctp}/sign/signUserUpdate">
	  	<i class="fa-solid fa-circle-info fa-4x"  style="color:white;" ></i>
	  	<p><br/></p>
	  	<font color="white">내 정보 수정</font>
  	</a>
  </div>
  <div class="Quit" style="margin-left:68.1px; display:inline-block">
  	<a style="text-decoration:none;" href="${ctp}/sign/signUserDel">
  		<i class="fa-solid fa-person-through-window fa-4x" style="color:white;" ></i>
  	<p><br/></p>
  	<font color="white">회원 탈퇴</font>	
  	</a>
  </div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>