<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>도감 작성</title>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script src="https://kit.fontawesome.com/415e1b251f.js" crossorigin="anonymous"></script>
  <style>
  .container{
  	padding:30px;
  }
  table.guide_table {
	  border-collapse: separate;
	  border-spacing: 0;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 1px solid #ccc;
	  margin : 20px 10px;
}	  
	table.guide_table th {
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
	table.guide_table td {
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
	<form method="post" enctype="multipart/form-data">
		<h1 style="text-align:center;">도감 작성</h1>	
		<table  class="guide_table">
			<tr>
				<th style="padding:20px;">이름</th>
				<td><input type="text" id="bird_name" name="bird_name" class="form-control" autofocus required></td>
			</tr>
			<tr>
				<th style="padding:20px;">학명</th>
				<td><input type="text" id="bird_ SName" name="bird_SName" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">목/과</th>
				<td><input type="text" id="bird_class" name="bird_class" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">주요 종</th>
				<td><input type="text" id="bird_species" name="bird_species" class="form-control"></td>
			</tr>
			<tr>
				<th style="padding:20px;">도래 현황 </th>
				<td><input type="text" id="bird_advent" name="bird_advent" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">관찰 시기 </th>
				<td><input type="text" id="bird_observe" name="bird_observe" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">관찰 빈도</th>
				<td><input type="text" id="bird_frequency" name="bird_frequency" class="form-control"></td>
			</tr>
			<tr>
				<th style="padding:20px;">번식지 유형 </th>
				<td><input type="text" id="bird_Breedtype" name="bird_Breedtype" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">서식지 유형 </th>
				<td><input type="text" id="bird_Habitattype" name="bird_Habitattype" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">주요 번식지 </th>
				<td><input type="text" id="bird_Mainbreed" name="bird_Mainbreed" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">주요 서식지</th>
				<td><input type="text" id="bird_Mainhabit" name="bird_Mainhabit" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">외형</th>
				<td><textarea rows="3" id="bird_shape" name="bird_shape" class="form-control" required></textarea></td>
			</tr>
			<tr>
				<th style="padding:20px;">부리 </th>
				<td><input type="text" id="bird_beak" name="bird_beak" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">꼬리</th>
				<td><input type="text" id="bird_tail" name="bird_tail" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">크기</th>
				<td><input type="text" id="bird_size" name="bird_size" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">생활 방식 </th>
				<td><input type="text" id="bird_system" name="bird_system" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">사냥 방식</th>
				<td><input type="text" id="bird_hunt" name="bird_hunt" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">먹이</th>
				<td><input type="text" id="bird_food" name="bird_food" class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">기타 </th>
				<td><textarea rows="3" id="bird_etc" name="bird_etc" class="form-control" required></textarea></td>
			</tr>
			<tr>
				<th rowspan="4" style="text-align:center; padding:70px;">파일</th>
				<td style="padding:-20px;"><!-- <input type='file' name="photo" id="photo" multiple  /> -->
					<ul class="ul_border">
						<li class="li_border">
							<input type='file' name="file" id="file" multiple  />
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