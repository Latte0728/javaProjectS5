<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>예약 프로그램 상세 정보</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
<style>
	.h2_info{
		margin-left:50px
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
	
</style>  
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container"></div>
	<h2 class="h2_info">프로그램 목록</h2>
	<div class="info_box">
		<div>
			<div style="text-align: center;">
				<h3>
					<span class="sp_title">생태해설</span>
					<em>${vo.title}</em>
				</h3>
				<%-- <p>
					<strong>접수 기간</strong>
					" : ${vo.startDate} ~ ${vo.endDate}"
				</p> --%>
				<p>
					<strong>교육 기간</strong>
					" : ${vo.startDate} ~ ${vo.endDate}"
				</p>
			</div>
			<div>
				${vo.photo}
			</div>
			<div class="reserve_table">
				<table class="re_table">
					<tr>
						<th>모임 장소</th>
						<td></td>
					</tr>
					<tr>	
						<th>교육 대상</th>
						<td></td>
					</tr>
					<tr>	
						<th>교육 요일</th>
						<td></td>
					</tr>
					<tr>	
						<th>교육 대상</th>
						<td></td>
					</tr>
					<tr>	
						<th>모집 정원</th>
						<td></td>
					</tr>
					<tr>	
						<th>시간</th>
						<td></td>
					</tr>
					<tr>	
						<th>학습 내용</th>
						<td></td>
					</tr>
				</table>
				<div class="click_reserve">
					<a href=""  style="width:300px; text-decoration:none; height:55px; font-size: 17px; padding: 14px 82px; display:inline; color:#ffffff; background-color:#006666; margin-right:9px; id = "click" >예약하기</a>
				</div>
			</div>
		</div>
		<div>
			<a href=""></a>
		</div>
	</div>
<p><br/></p>
</body>
</html>