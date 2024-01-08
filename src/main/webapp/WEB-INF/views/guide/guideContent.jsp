<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>도감</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
<style>
	#guide1{
		text-align:center;
		font-size:40px;
	}  
	table.g_table1 {
	  border-collapse: separate;
	  border-spacing: 0;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 1px solid #ccc;
	  margin : 20px 10px;
}
	table.g_table1 th {
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
	table.g_table1 td {
	  width: 1000px;
	  padding: 10px;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
}
  table.g_table2 {
	  border-collapse: separate;
	  border-spacing: 0;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 1px solid #ccc;
	  margin : 20px 10px;
}
	table.g_table2 th {
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
	table.g_table2 td {
	  width: 1000px;
	  padding: 10px;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
}
	table.g_table3 {
	  border-collapse: separate;
	  border-spacing: 0;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 1px solid #ccc;
	  margin : 20px 10px;
}	  
	table.g_table3 th {
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
	table.g_table3 td {
	  width: 1000px;
	  padding: 10px;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
}
	table.g_table4 {
	  border-collapse: separate;
	  border-spacing: 0;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 1px solid #ccc;
	  margin : 20px 10px;
}	  
	table.g_table4 th {
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
	table.g_table4 td {
	  width: 1000px;
	  padding: 10px;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
}
	#gName1{
		color:#20B2AA;
	}
	#gName2{
		color:#20B2AA;
	}
	#gName3{
		color:#20B2AA;
	}
	#gName4{
		color:#20B2AA;
	}
	#sp{
		color:#20B2AA;
	}
</style>    
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<h2 id="guide1">도감</h2>
	<p><br/></p>
	<h3 id="gName1"><i class="fa fa-twitter fa-2x" aria-hidden="true" id="pic1"></i>${vo.bird_name}</h3>
	<form class="guideForm1" enctype="multipart/form-data" method="post">
		<table class="g_table1">
  		<tr>
  			<th>이름</th>
  			<td>${vo.bird_name}</td>
  			<th>학명</th>
  			<td>${vo.bird_SName}</td>
  		</tr>
  		<tr>
  			<th>목/과</th>
  			<td>${vo.bird_class}</td>
  			<th>주요 종</th>
  			<td>${vo.bird_species}</td>
  		</tr>
		</table>
	<p><br/></p>
	<h3 id="gName2"><i class="fa fa-twitter fa-2x fa-2x" aria-hidden="true" id="pic1"></i>도래현황 및 번식, 서식</h3>
	<span id="sp">새들이 언제 어디서 번식을 하고 살아가는지, 또 철새들은 한국과 어떤 지역을 오고 가는지 알아볼 수 있습니다.</span>	
		<table class="g_table2">
  		<tr>	
  			<th>도래현황</th>
  			<td>${vo.bird_advent}</td>
  		</tr>
  		<tr>
  			<th>관찰시기</th>
  			<td>${vo.bird_observe}</td>
  		<tr>	
  			<th>관찰빈도</th>
  			<td>${vo.bird_frequency}</td>
  	  </tr>
  		<tr>	
  			<th>번식지유형</th>
  			<td>${vo.bird_Breedtype}</td>
  	  </tr>
  		<tr>	
  			<th>서식지유형</th>
  			<td>${vo.bird_Habitattype}</td>
  	  </tr>
  		<tr>	
  			<th>주요번식지</th>
  			<td>${vo.bird_Mainbreed}</td>
  	  </tr>
  		<tr>	
  			<th>주요서식지</th>
  			<td>${vo.bird_Mainhabit}</td>
  	  </tr>
		</table>
	<p><br/></p>
	<h3 id="gName3"><i class="fa fa-twitter fa-2x fa-2x" aria-hidden="true" id="pic1"></i>외 형</h3>
	<span id="sp">암ㆍ수, 번식깃, 비번식깃, 어린새 등의 겉모습이 어떻게 다른지, 그리고 부리, 꼬리 등의 특징은 무엇인지 알아 볼수 있습니다.</span>
		
		<table class="g_table3">
			<tr>
  			<th>외형</th>
  			<td>${vo.bird_shape}</td>
  		</tr>
  		<tr>	
  			<th>부리</th>
  			<td>${vo.bird_beak}</td>
  		</tr>
  		<tr>
  			<th>꼬리</th>
  			<td>${vo.bird_tail}</td>
  		<tr>	
  			<th>크기</th>
  			<td>${vo.bird_size}</td>
  	  </tr>
		</table>
	<p><br/></p>
	<h3 id="gName4"><i class="fa fa-twitter fa-2x fa-2x" aria-hidden="true" id="pic1"></i>생활방식</h3>
	<span id="sp">새들이 어떻게 생활을 하고 어떤 먹이를 어떻게 사냥해 먹는지, 그리고 한국에서 살아가는 이 새들의 특징은 무엇인이 알아 볼 수 있습니다.</span>
		<table class="g_table3">
			<tr>
  			<th>생활방식</th>
  			<td colspan="3">${vo.bird_system}</td>
  		</tr>
  		<tr>	
  			<th>사냥방식</th>
  			<td>${vo.bird_hunt}</td>
  			<th>먹이</th>
  			<td>${vo.bird_food}</td>
  		</tr>
  		<tr>
  			<th>기타</th>
  			<td colspan="3">${vo.bird_etc}</td>
  	 </tr>
		</table>
		 
		<div>
		  <c:set var="bird_imgs" value="${fn:split(vo.photo,'/')}" />
			<c:forEach var="photo" items="${bird_imgs}" varStatus="st">
			  <img src="${ctp}/guide/${photo}" width="250px" class="m-2" />
			</c:forEach>			
		</div>
		
		<div>
			<span style="display: inline-block; margin-left: 100px;">
				<input type="button" onclick="location.href='${ctp}/h';" value="메인화면으로 돌아가기" class="btn1 btn btn-warning form-control" style="width:100%" />
			</span>
			<span style="display: inline-block; margin-left: 100px;">
				<input type="button" onclick="location.href='${ctp}/guide/guideList';" value="이전화면으로 돌아가기" class="btn1 btn-danger form-control" style="width:100%"  />
			</span> 
		</div>
	</form>		
</div>  
<p><br/></p>
</body>
</html>