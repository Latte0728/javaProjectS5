<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String today = java.time.LocalDate.now().toString().substring(0, 10);
  pageContext.setAttribute("today", today);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>예약 하기</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	 .active {
	  	width: 100%;
	    box-sizing: border-box;
	    border: 4px solid #ddd;
	    padding: 24px 77px;
	    margin: 0 0 30px;
	    overflow: hidden;
	  }  
  	 table.info_table {
		  border-collapse: separate;
		  border-spacing: 0;
		  text-align: center;
		  line-height: 1.5;
		  border-top: 1px solid #ccc;
		  border-left: 1px solid #ccc;
		  margin : 20px 10px;
		}	  
		 table.info_table th {
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
		 table.info_table td {
		  width: 1000px;
		  padding: 10px;
		  vertical-align: middle;
		  border-right: 1px solid #ccc;
		  border-bottom: 1px solid #ccc;
		}
		 .container {
		 	text-align:center;
		}
		 
  </style>
  <script>
  	'use strict';
  	function dateCheck() {
  		let startDate = '${fn:substring(vo.startDate,0,10)}';
  		let wDate = document.getElementById("wDate").value;
  		if(startDate <= wDate || '${today}' > wDate) {
  			alert('신청일자를 확인하세요');
  			return false;
  		}
  	}
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2>예약하기</h2>
	<div class="active">	
		<div class="picture">
		  <table class="text-center" style="width:100%">
		    <tr>
		      <td style="width:50%">
		        ${vo.content}
		      </td>
		      <td>
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      </td>
		      <td style="width:50%">
		        <table class="table table-bordered text-left" style="width:100%">
		          <tr>
		            <td>조회수</td><td>${vo.readNum}</td>
		          </tr>
		          <tr>
		            <td>주제</td><td>${vo.title}</td>
		          </tr>
		          <tr>
		            <td>기간</td><td>${fn:substring(vo.startDate,0,10)} ~ ${fn:substring(vo.endDate,0,10)}</td>
		          </tr>
		          <tr>
		            <td>참여 대상</td><td>${vo.training}</td>
		          </tr>
		          <tr>
		            <td>모집 인원</td><td>${vo.recruit}</td>
		          </tr>
		        </table>
		      </td>
		    </tr>
		  </table>
		</div>
	</div>
	<div class="infomation">
		<form method="post" name="infoForm" action="reservationFormOk">
			<table class="info_table" >
				<tr>
					<th>신청자(ID)</th>
					<td><input type="text" id="mid" name="mid" value="${sMid}" readonly class="form-control"/></td>
				</tr>
				<tr>	
					<th>신청 일자</th>
					<td><input type="date" onBlur="dateCheck()" name="wDate" id="wDate" value="<%=java.time.LocalDate.now() %>" class="form-control"></td>
				</tr>
				<tr>	
					<th>참가 인원</th>
					<td><input type="number" id="recruit" name="recruit" value="1" required class="form-control"></td>
				</tr>
				<tr>	
					<th>문의 사항</th>
					<td><textarea rows="4" class="form-control" id="content" name="content"></textarea></td>
				</tr>
			</table>
			<div>
				<input type="submit" class="btn btn-primary" value="신청하기" />
				<input type="reset"  class="btn btn-danger"  value="취소하기" />
				<input type="button" class="btn btn-info" 	 value="돌아가기" onclick="location.href='reservationList';"/>
			</div>
			<input type="hidden" name="reservationIdx" value="${vo.idx}"/>
		</form>
	</div>
</div>  
<p><br/></p>
</body>
</html>