<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>예약 프로그램 작성</title>
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
<style>
	.container{
		text-align:center;
	}
	table.book_table {
	  border-collapse: separate;
	  border-spacing: 0;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 1px solid #ccc;
	  margin : 20px 10px;
	}	  
	table.book_table th {
	  width: 200px;
	  padding: 10px;
	  font-weight: bold;
	  text-align:center;
	  vertical-align: center;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	  border-top: 1px solid #fff;
	  border-left: 1px solid #fff;
	  background: #eee;
}
	table.book_table td {
	  width: 1000px;
	  padding: 10px;
	  vertical-align: middle;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
}
</style>  
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2>예약 프로그램 작성</h2>
	<form method="post" enctype="multipart/form-data">
		<table class="book_table">
			<tr>
				<th>제목</th>
				<td><input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" style="width:100%" required></td>
			</tr>
			<tr>
				<th>교육 시작 날짜</th>
				<td><input type="date" value="<%=java.time.LocalDate.now() %>" class="form-control" id="startDate" name="startDate" placeholder="시작 날짜를 입력해주세요" style="width:100%" required></td>
			</tr>
			<tr>
				<th>교육 대상</th>
				<td>
				  <select class="form-control" id="training" name="training">
				  	<option>전체</option>
				  	<option>초등</option>
				  	<option>중등</option>
				  	<option>고등</option>
				  	<option>성인</option>
				  	<option>단체</option>
				  </select>
				</td>
			</tr>
			<tr>
				<th>모집 정원</th>
				<td><input type="number" class="form-control" id="recruit" name="recruit" value="1" required></td>
			</tr>
			<tr>	
				<th>교육 종료 날짜</th>
				<td><input type="date" value="<%=java.time.LocalDate.now() %>" class="form-control" id="endDate" name="endDate" placeholder="종료 날짜를 입력해주세요" style="width:100%" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="6" class="form-control" id="CKEDITOR" name="content" placeholder="내용을 입력해주세요" style="width:100%"></textarea></td>
        <script>
	        CKEDITOR.replace("content",{
	        	height:480,
	        	filebrowserUploadUrl:"${ctp}/imageUpload",		/* 파일(이미지) 업로드시에 매핑경로 */
	        	uploadUrl : "${ctp}/imageUpload"							/* 여러개의 그림파일을 드래그&드롭해서 올릴수 있다. */
	        });
        </script>
			</tr>
		</table>
		<div>
			<span><input type="submit" value="등록" class="btn btn-info"/></span>
			<span><input type="reset"  value="취소" class="btn btn-danger"/></span>
		</div>
	</form>
</div> 
<p><br/></p>
</body>
</html>