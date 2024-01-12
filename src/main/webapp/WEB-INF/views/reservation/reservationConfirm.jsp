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
  <script>
		function imgCheck(idx, title, imageOne){
			$(".modal-title").html(title);
			let str = '<img src="${ctp}/reservation/'+imageOne+'" width="470px"/>';
			$(".modal-body").html(str);
			$("#idx").val(idx);
		}
	</script> 
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
  		<c:set var="nextImg" value="${fn:substring(vo.imgContent,fn:indexOf(vo.imgContent,'src=')+37,fn:length(vo.imgContent))}"/>
		  <c:set var="imageOne" value="${fn:substring(nextImg,0,fn:indexOf(nextImg,'\"'))}"/>
  		<tr>
  			<td>${st.count}</td>
  			<td><a href="#" onclick="imgCheck('${vo.idx}','${vo.title}','${imageOne}')" data-toggle="modal" data-target="#myModal">${vo.title}</a></td>
  			<td>${fn:substring(vo.WDate,0,10)}</td>
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
<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body"></div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <form name="reservationForm" method="post">
	        <input type="hidden" name ="idx" id="idx" />
	        <button type="button" class="btn btn-secondary" class="close" data-dismiss="modal">창닫기</button>
      	</form>
      </div>
      
    </div>
  </div>
</div> 
<p><br/></p>
</body>
</html>