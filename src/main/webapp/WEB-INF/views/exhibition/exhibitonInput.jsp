<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>주요 전시 동물 작성 창</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <style>
  	th {
  		background-color:#A4A4A4;
  		
  	}
  </style>
  <script>
  	/* 돌아가기 버튼 구현 */
  	function placeCheck() {
  		window.location.href = '${ctp}/page/menagerPage.html';
  		
  	}
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>주요 동물 작성 창</h2>
  <form method="post">
  	<table class="table table-bordered" style="text-align:center;">
  		<tr>
  			<th>국명</th>
  			<td><input type="text" class="form-control" id="name" name="name"></td>
			</tr>  		
  		<tr>
  			<th>학명</th>
  			<td><input type="text" class="form-control" id="SName" name="SName"></td>
			</tr>  		
  		<tr>
  		<tr>
  			<th>종분류</th>
  			<td><input type="text" class="form-control" id="CName" name="CName"></td>
			</tr>  		
  		<tr>
  			<th>영명</th>
  			<td><input type="text" class="form-control" id="EName" name="EName"></td>
			</tr>  		
  		<tr>
  			<th>분포</th>
  			<td><input type="text" class="form-control" id="distribution" name="distribution"></td>
			</tr>  		
  		<tr>
  			<th>식성</th>
  			<td><input type="text" class="form-control" id="food" name="food"></td>
			</tr>  		
  		<tr>
  			<th>생육 정보</th>
  			<td><input type="text" class="form-control" id="breedInfo" name="breedInfo"></td>
			</tr>  		
  		<tr>
  			<th>특징</th>
  			<td><textarea rows="2" class="form-control" id="CKEDITOR" name="content" placeholder="내용을 입력해주세요" style="width:100%"></textarea></td>
  			<script>
	        CKEDITOR.replace("content",{
	        	height:480,
	        	filebrowserUploadUrl:"${ctp}/imageUpload",		/* 파일(이미지) 업로드시에 매핑경로 */
	        	uploadUrl : "${ctp}/imageUpload"							/* 여러개의 그림파일을 드래그&드롭해서 올릴수 있다. */
	        });
        </script>
			</tr>  		
  	</table>
  	<div style="text-align:center">
  		<input type="button"  value="돌아가기 "  onclick="placeCheck()" class="btn btn-warning" />
  		<input type="submit"  value="등록 " class="btn btn-info" />
  		<input type="reset"  value="취소" class="btn btn-danger" />
  	</div>
  </form>
</div> 
<p><br/></p>
</body>
</html>