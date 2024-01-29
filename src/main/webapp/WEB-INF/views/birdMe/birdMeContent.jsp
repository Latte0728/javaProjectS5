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
  	th {
  		background-color:#f2f2f2;
  	}
  </style>
  <script>
  	function btnreturn() {
  		window.history.back();
  		
  	}
		function goodCheck() {
	    	$.ajax({
	    		url  : "birdMeGoodCheck",
	    		type : "post",
	    		data : {idx : ${vo.idx}},
	    		success:function(res) {
	    			if(res == "0") alert('이미 좋아요 버튼을 클릭하셨습니다.');
	    			else location.reload();
	    		},
	    		error : function() {
	    			alert("전송 오류!!");
	    		}
	    	});
	    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2>내가 본 새</h2>
	<form method="post">
		${vo.title}  	
  	<hr/>
  	<table class="table table-bordered">
  		<tr class="table-dark text-dark" >
  			<th></th>
  			<td></td>	
  		</tr>
  		<tr>
  			<th>관찰자</th>
  			<td>${vo.observer}</td>
  		</tr>
  		<tr>
  			<th>관찰일</th>
  			<td>${fn:substring(vo.WDate,0,10)}</td>
  		</tr>
  		<tr>
  			<th>장소</th>
  			<td>${vo.location}</td>
  		</tr>
  		<tr>
  			<th>조회수</th>
  			<td>${vo.readNum}</td>
  		</tr>
  		<tr>	
  			<th>좋아요</th>
  			<td><font color="red"><a href="javascript:goodCheck()">❤</a></font></td>
  		</tr>
  		<tr>
  			<th>관찰 내용</th>
  			<td>${vo.content}</td>
  		</tr>
  	</table>
  </form>
  <div style="text-align:center;">
  	<input type="button" onclick="btnreturn()" value="돌아가기" class="btn btn-info" />
  </div>
</div>
<p><br/></p>
</body>
</html>