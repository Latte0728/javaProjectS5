<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>내가 본 새 작성 창</title>
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script>
  	function birdMeList() {
  		
  		window.location.href = 'birdMeList.html';
  		
  	} 
  	
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>내가 본 새 작성 창</h2>
  <form method="post">
  	<table class="table table-border">
  		<tr class="table-dark text-dark">
  			<th>제목</th>
  			<td><input type="text" id="title" name="title"/></td>
  		</tr>
  		<tr class="table-dark text-dark">
  			<th>관찰자</th>
  			<td><input type="text" id="observer" name="observer"/></td>
  		</tr>
  		<tr class="table-dark text-dark">
  			<th>관찰일</th>
  			<td><input type="date" value="<%=java.time.LocalDate.now() %>" id="wDate" name="wDate"></td>
  		</tr>
  		<tr class="table-dark text-dark">
  			<th>장소</th>
  			<td><input type="text" id="location" name="location"></td>
  		</tr>
  		<tr class="table-dark text-dark">
  			<th>관찰 내용</th>
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
  		<input type="button" onclick="birdMeList();" value="돌아가기" class="btn btn-warning"/>
  		<input type="submit"  value="작성 완료"  class="btn btn-primary"/>
  		<input type="reset"  value=" 작성 취소" class="btn btn-danger"/>
  	</div>
  </form>
</div> 
<p><br/></p>
</body>
</html>