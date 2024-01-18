<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>게시판 글쓰기</title>
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script>
	  function checkForm() {
		  var contentValue = CKEDITOR.instances['CKEDITOR'].getData().trim(); // CKEDITOR에서 내용 가져오기
		    if (!contentValue) {
		        alert("내용을 입력하세요."); // 내용이 비어있으면 경고 표시 및 제출 방지
		        return false;
		    } else {
		        return true; // 내용이 채워져 있으면 제출 허용
		    }
		}
  </script>
</head>
<p><br/></p>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>자유게시판</h2>
  <form method="post" onsubmit="return checkForm();">
  	<table class="table table-bordered">
  		<tr>
  			<th>작성자</th>
  			<td><input type="text" id="nickName" name="nickName" value="${sNickName}" readonly class="form-control" /></td>
  		</tr>
  		<tr>
  			<th>제목</th>
  			<td><input type="text" id="title" name="title"  class="form-control"/></td>
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
  		<tr>
  			<td style="text-align:center; border-right:none;">
  			  <input type="submit" value="등록" class="btn btn-success"/>
  			  <input type="reset" value="취소" class="btn btn-danger"/>
  			  <input type="button" value="돌아가기" onclick="location.href='bulletinBoardList'" class="btn btn-info"/>
  			</td>
  		</tr>
  	</table>
  	<input type="hidden" name="mid" value="${sMid}"/>
  </form>
</div> 
<p><br/></p>
</body>
</html>