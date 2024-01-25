<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>새에 대한 궁금한 이야기 작성</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>새에 대한 궁금한 이야기 작성</h2>
  	<form enctype="multipart/form-data" method="post">
  		<table class="table table-bordered" style="text-align:center">
  			<tr class="text-dark table-dark">
  				<th>분류(제목)</th>
  				<td>참조 파일</td>
  			</tr>	
  			<tr>
  				<th>
  				  <select name="title" class="form-control">
  				  	<option>파일(새의 특징)</option>
  				  	<option>파일(새의 진화)</option>
  				  	<option>파일(해부학적특징)</option>
  				  	<option>파일(깃털의 이해)</option>
  				  	<option>파일(비행 원리)</option>
  				  	<!-- <option>파일(외부 명칭)</option> -->
  				  	<option>파일(새의 일생)</option>
  				  	<option>파일(철새들의 이동)</option>
  				  </select>
  				</th>
  				<td><input type="file" name="file"/></td>
  			</tr>
  		</table>
  		<div style="text-align:center">
  			<input type="submit" value="등록" class="btn btn-info">
  			<input type="reset" value="취소" class="btn btn-danger">
  		</div>
  	</form>
</div> 
<p><br/></p>
</body>
</html>