<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>예약 확인</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>예약 확인</h2>
  <table class="table table-hover">
  	<tr class ="table-dark text-dark">
  		<th>번호</th>
  		<th>제목</th>
  		<th>예약 일자</th>
  		<th>예약 인원</th>
  		<th>진행 일자</th>
  		<th>진행 상황</th>
  	</tr>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
  		<tr>
  			<td>${st.count}</td>
  			<td>${vo.title}</td>
  			<td>${vo.WDate}</td>
  			<td>${vo.recruit}</td>
  			<td>${fn:substring(vo.startDate,0,10)} ~ ${fn:substring(vo.endDate,0,10)}</td>
  			<td>
  			  <c:if test="${vo.date_diff < 0}"><font color="red">예약 종료</font></c:if>
  			  <c:if test="${vo.date_diff >= 0}">예약 진행중</c:if>
  			</td>
  		</tr>
  	</c:forEach>
  	<tr><td colspan="6" class="m-0 p-0"></td></tr>
  </table>
  <div>
  	<input type="button" class="btn btn-primary" onclick="location.href='reservationList';" value="돌아가기">
  </div>
</div> 
<p><br/></p>
</body>
</html>