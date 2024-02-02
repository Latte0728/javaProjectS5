<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>주요 전시 동물</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	.text-box {
  		display: flex;
	    justify-content: center;
	    align-items: center;
	    padding: 20px;
	    min-height: 130px;
	    border-radius: 3px;
	    border: 1px solid #ccc;
	    margin-bottom: 30px;
  	}
  	.ft_green {
  		color:#037a4e;
  	}
  	.ul_board {
  		display : flex;
  		padding: 40px;
    	align-items: center;
  	}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>주요 전시 동물</h2>
  <form method="post">
	  <div class="text-box">
	  	<img src="${ctp}/resources/images/6.png" />
	  	<p>생태 보전의 중요성을 알리기 위해 
	  	<span class="ft_green">국립생태원이 보호하고 있는 대표 동물들</span>을 안내합니다.
	  	</p>
	  </div>
		<div class="input-group mb-3">
			<input type="text" class="form-control" placeholder="검색어를 입력해주세요" id="searchText" name="searchText"/>
			<input type="submit" value="검색" class="btn btn-info"/>
		</div>
		<div>
			<ul class="ul_board">
				<li>
					<c:forEach var="vo" items="${vos}" varStatus="st">
						<table class="table table-bordered">
							<tr>
							  <td width="35%" class="text-center align-middle">
									<c:set var="bird_temp" value="${fn:substring(vo.content,fn:indexOf(vo.content,'src=')+34,fn:length(vo.content))}"/>
					  		  <c:set var="bird_img"   value="${fn:substring(bird_temp,0,fn:indexOf(bird_temp,'.jpg')+4)}" />
						      <a href="exhibitionContent?idx=${vo.idx}"><img src="${ctp}/data/ckeditor/${bird_img}" class="w3-border" style="padding:10px" width="250px" /></a><br/>
				      	</td>
				      	<td width="65%">
				      		<table class="table-borderless">
				      			<tr><td><font size="3">동물군</font></td></tr>
				      			<tr><td><font size="5"><b>${vo.name}</b> ${vo.SName}</font></td></tr>
				      			<tr><td>ㆍ학 명 : ${vo.SName}</td></tr>
				      			<tr><td>ㆍ국 명 : ${vo.name}</td></tr>
				      			<tr><td>ㆍ영 명 : ${vo.EName}</td></tr>
				      			<tr><td>ㆍ분 포 : ${vo.distribution}</td></tr>
				      		</table>
				      	</td>
							</tr>
						</table>
					</c:forEach>
				</li>
			</ul>
		</div>
 	</form>	
</div>
<p><br/></p>
</body>
</html>