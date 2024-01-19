<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>공지사항 작성</title>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script src="https://kit.fontawesome.com/415e1b251f.js" crossorigin="anonymous"></script>
  <style>
  .container{
  	padding:30px;
  	text-align:center;
  }
  table.noticeW_table {
	  border-collapse: separate;
	  border-spacing: 0;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 1px solid #ccc;
	  margin : 20px 10px;
}	  
	table.noticeW_table th {
	  width: 200px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	  border-top: 1px solid #fff;
	  border-left: 1px solid #fff;
	  background: #eee;
}
	table.noticeW_table td {
	  width: 1000px;
	  padding: 10px;
	  vertical-align: middle;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
}
	.ul_border {
		display: grid;
    place-items: baseline;
    margin-left: -40px;
	}
	.li_border {
		border-bottom: 1px dashed gray;	
		list-style-type: none;
		padding:5px;
		width:100%;
		text-align:left;
	}
	.btn btn-primary{
		background-color: #337ab7;
    border-color: #2e6da4;
	}
	.btn btn-danger{
		background-color: #d9534f;
    border-color: #d43f3a;
	}
</style>
</head>
<body>
<div class="container">
	<form method="post" enctype="multipart/form-data" style="text-align:center;">
		<h1 style="text-align:center;">공지사항 작성</h1>	
		<table class="noticeW_table">
			<tr>
				<th style="padding:20px;">제목</th>
				<td><input type="text" id="title" name="title" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">작성자</th>
				<td><input type="text" id="writer" name="writer" value="${sNickName}" class="form-control" readonly></td>
			</tr>
			<tr>
				<th style="padding:20px;">작성일</th>
				<td><input type="date" id="wDate" name="wDate" value="<%=java.time.LocalDate.now() %>" class="form-control" required></td>
			</tr>
			<tr>
			<tr>
				<th style="padding:20px;">작성 내용</th>
				<td><textarea id="content" name="content"  colspan="2" class="form-control" style="display:inline;"></textarea></td>
			</tr>
				<th rowspan="2" style="text-align:center; padding:70px;">파일</th>
				<td style="padding:-20px;"><!-- <input type='file' name="photo" id="photo" multiple  /> -->
					<ul class="ul_border">
						<li class="li_border">
							<input type='file' name="file" id="file" multiple />
						</li>
					</ul>
				</td>
			</tr>	
		</table>
		<p><br/></p>
		<div style="text-align: center;" class="btns_center">
			<button type="submit" class="btn btn-primary">
    		<i class="fas fa-check"></i> 등록
			</button>
			<button type="reset" class="btn btn-danger">
    		<i class="fas fa-times"></i> 취소
			</button>
		</div>
	</form>
</div>
</body>
</html>