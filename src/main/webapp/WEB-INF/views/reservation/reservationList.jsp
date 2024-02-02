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
  <title>예약 프로그램 상세 정보</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<style>
	/*
		.h2_info{
			text-align:center;
		}
		.h4_info{
			
			text-align:center;
			
		}
		.sp_title {
			display: inline-block;
	    min-width: 105px;
	    padding: 3.5px 10px;
	    text-align: center;
	    color: #fff;
	    font-size: 15px;
	    background: #006666;
	    box-sizing: border-box;
		}
		.info_box {
			width: 100%;
	    box-sizing: border-box;
	    border: 4px solid #ddd;
	    padding: 24px 77px;
	    margin: 0 0 30px;
	    overflow: hidden;
		}
		table.re_table {
		  border-collapse: separate;
		  border-spacing: 0;
		  text-align: center;
		  line-height: 1.5;
		  border-top: 1px solid #ccc;
		  border-left: 1px solid #ccc;
		  margin : 10px 10px;
			margin-left:910px;
		}	  
		table.re_table th {
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
		table.re_table td {
		  width: 1000px;
		  padding: 10px;
		  vertical-align: middle;
		  border-right: 1px solid #ccc;
		  border-bottom: 1px solid #ccc;
		}
		.click_reserve {
			text-align:right;
		}
		a {
		line-height: 40px;
		padding:5px;
		marign-right:9px;
		}  
	*/	
	</style> 
	<script>
		function imgCheck(idx, title, imageOne){
			$(".modal-title").html(title);
			let str = '<img src="${ctp}/reservation/'+imageOne+'" width="470px"/>';
			$(".modal-body").html(str);
			$("#idx").val(idx);
		}
		
		function reservationFormCheck(){
			reservationForm.action = '${ctp}/reservation/reservationForm';
			reservationForm.submit();
		}
		
	</script> 
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2 class="h2_info">프로그램 목록</h2>
	<h4 class="h4_info">제목을 클릭하셔서 다양한 프로그램을 예약해보세요!!!</h4>
	<div class="info_box">
		<div style="text-align: center;">
			<div class="row">
				<c:forEach var="i" begin="0" end="3" varStatus="st">
					  <c:set var="nextImg" value="${fn:substring(vos[i].content,fn:indexOf(vos[i].content,'src=')+37,fn:length(vos[i].content))}"/>
					  <div class="col"><img src="${ctp}/reservation/${fn:substring(nextImg,0,fn:indexOf(nextImg,'\"'))}" class="w3-round-large" style="width:100%"/></div>
				</c:forEach>
		  </div>
		</div>
		<hr/>
		<div class="text-center">
			<table class="table table-hover table-striped">
				<tr class="table-info text-dark">
					<th>번호</th>
					<th>제목</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>대상</th>
					<th>모집정원</th>
				</tr>
				<c:forEach var="vo" items="${vos}" varStatus="st">
				  <c:set var="nextImg" value="${fn:substring(vo.content,fn:indexOf(vo.content,'src=')+37,fn:length(vo.content))}"/>
				  <c:set var="imageOne" value="${fn:substring(nextImg,0,fn:indexOf(nextImg,'\"'))}"/>
					<tr>	
						<td>${st.count}</td>
						<td>
						  <c:if test="${today < fn:substring(vo.startDate,0,10)}">
						  	<a href="#" onclick="imgCheck('${vo.idx}','${vo.title}','${imageOne}')" data-toggle="modal" data-target="#myModal">${vo.title}</a>
							</c:if>
						  <c:if test="${today >= fn:substring(vo.startDate,0,10)}">
						  	<a href="javascript:alert('예약신청일이 지나 예약을 할 수 없습니다.');">${vo.title}</a>
							</c:if>
						</td>
						<td>${fn:substring(vo.startDate,0,10)}</td>
						<td>${fn:substring(vo.endDate,0,10)}</td>
						<td>${vo.training}</td>
						<td>${vo.recruit}</td>
					</tr>
				</c:forEach>
				<tr><td colspan="6" class="m-0 p-0"></td></tr>
			</table>
		</div>
	</div>
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
					<button type="button" onclick="reservationFormCheck()" class="btn btn-info" data-dismiss="modal">예약하기</button>     
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">돌아가기</button>
      	</form>
      </div>
      
    </div>
  </div>
</div>
<p><br/></p>
</body>
</html>