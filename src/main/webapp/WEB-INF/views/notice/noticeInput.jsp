<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>공지사항 작성</title>
  <jsp:include page="/WEB-INF/views/include/nav.jsp" />
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script src="https://kit.fontawesome.com/415e1b251f.js" crossorigin="anonymous"></script>
  <style>
  .container{
  	padding:30px;
  	text-align:center;
  }
  table.noticeW_table {
	  border-collapse: separate;
	  border-spacing: 0;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 1px solid #ccc;
	  margin : 20px 10px;
}	  
	table.noticeW_table th {
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
	table.noticeW_table td {
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
<script src="${ctp}/ckeditor/ckeditor.js"></script>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script>
	  function checkForm() {
		  var contentValue = CKEDITOR.instances['CKEDITOR'].getData().trim(); // CKEDITOR에서 내용 가져오기
	    if (!contentValue) {
	        alert("내용을 입력하세요."); // 내용이 비어있으면 경고 표시 및 제출 방지
	        return false;
	    }
	  	
			// 전송전에 파일에 관한 사항들을 체크한다.
			let fName = document.getElementById("file").value;
	  	if(fName.trim() != "") {
	    	let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
	    	let maxSize = 1024 * 1024 * 5;
	    	let fileSize = document.getElementById("file").files[0].size;
	    	
	    	if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'zip' && ext != 'hwp' && ext != 'ppt' && ext != 'pptx' && ext != 'xlsx') {
	    		alert("업로드 가능한 파일은 'jgp/gif/png/zip/hwp/ppt/pptx/xlsx' 만 가능합니다.");
	    		return false;
	    	}
	    	else if(fileSize > maxSize) {
	    		alert("업로드할 파일의 최대용량은 5MByte입니다.");
	    		return false;
	    	}
	  	}
  		myform.submit();
		}
  </script>
</head>
<body>
<div class="container">
	<form name="myform" method="post" enctype="multipart/form-data" style="text-align:center;">
		<h1 style="text-align:center;">공지사항 작성</h1>	
		<table class="noticeW_table">
			<tr>
				<th style="padding:20px;">제목</th>
				<td><input type="text" id="title" name="title"  class="form-control" required></td>
			</tr>
			<tr>
				<th style="padding:20px;">작성자</th>
				<td><input type="text" id="writer" name="writer" value="${sNickName}" class="form-control" readonly></td>
			</tr>
			<tr>
				<th style="padding:20px;">작성일</th>
				<td><input type="date" id="wDate" name="wDate" value="<%=java.time.LocalDate.now() %>" class="form-control" required></td>
			</tr>
			<tr>
  			<th>내용</th>
  			<td><textarea id="CKEDITOR" name="content" class="form-control"></textarea></td>
        <script>
	        CKEDITOR.replace("content",{
	        	height:480,
	        	filebrowserUploadUrl:"${ctp}/imageUpload",		/* 파일(이미지) 업로드시에 매핑경로 */
	        	uploadUrl : "${ctp}/imageUpload"							/* 여러개의 그림파일을 드래그&드롭해서 올릴수 있다. */
	        });
        </script>
  		</tr>
				<th rowspan="2" style="text-align:center; padding:70px;">파일</th>
				<td style="padding:-20px;"><!-- <input type='file' name="photo" id="photo" multiple  /> -->
					<ul class="ul_border">
						<li class="li_border">
							<input type='file' name="file" id="file"  />
						</li>
					</ul>
				</td>
			</tr>	
		</table>
		<p><br/></p>
		<div style="text-align: center;" class="btns_center">
			<button type="button" onclick="checkForm()" class="btn btn-primary">
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