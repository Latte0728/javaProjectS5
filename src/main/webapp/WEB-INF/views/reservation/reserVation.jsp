<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약시스템</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
<style>
 .interpretation{
 		background-color:#006666;
 		
 }	
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp"/>
<p><br/></p>
<div class="container">
	<h1 style="text-align:center">예약 시스템</h1>
	<p><br/></p>
	<h3 style="text-align:center">현재 진행 중인 
	<span style="color:#0040FF">프로그램</span>
	</h3>
	<p><br/></p>
		<div class="program">
			<div>
				<ul>
					<li>
						<a href="" >
							<span class="interpretation"><font style="color:#ffffff">생태해설</font></span>
							<span>
								<img src=""/>
							</span>
							<div class="program_content">
								<p class="kinds">
									<span>단체</span>
									<span>유아</span>
									<span>초등</span>
									<span>중등</span>
									<span>고등</span>
									<span>성인</span>
								</p>
							</div>
						</a>
					</li>
				</ul>	
			</div>
		</div>
		<div class="re_service">
			
		</div>
</div>
<p><br/></p>
</body>
</html>