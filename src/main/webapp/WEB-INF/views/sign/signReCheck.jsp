<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>비밀번호 재확인</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<style>
	.container {
		text-align:center;
	}
	.exCheck{
		border: 1px solid gray;
		padding:-50px;
	}
	.reCheck{
		padding:150px;
	}
</style>
<script>
	'use strict';
	
	function btnCheck() {
		
	}
</script>
<body>
<p><br/></p>
<div class="container">
	<div class="exCheck">
		<form method="post" class="reCheck">
			<h1>비밀번호 재확인</h1>
			<p><br/></p>
			<span>안전한 회원 정보 수정을 위해서 비밀번호를 
			<p><br/></p>
			다시 한 번 입력해주세요.</span>
			<p><br/></p>
			<input type="text" id="mid" name="mid" value="${sMid}" class="form-control" style="width:30%; display:inline;" readonly/>
			<p><br/></p>
			<input type="password" id="pwd" name="pwd" class="form-control" style="width:30%; display:inline;" placeholder="비밀번호" required/>
			<p><br/></p>
			<input type="button" value="확인" class="btn btn-success" onclick="location.onclick='${ctp}/sign/signReCheck';" style="width:30%"/>
		</form>
	</div>	
</div>  
<p><br/></p>
</body>
</html>