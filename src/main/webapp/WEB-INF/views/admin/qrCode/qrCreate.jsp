<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>QR코드 생성</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script>
    'use strict';
    
    function qrCreate() {
    	let guideUrl = $("#guideUrl").val();
    	let guideIdx = guideUrl.substring(guideUrl.lastIndexOf("=")+1);
    	
    	if(guideUrl.trim() == "") {
    		alert("소개할 도감의 주소를 입력해주세요");
    		$("#guideUrl").focus();
    		return false;
    	}
    	
    	let query = {
    			guideIdx : guideIdx,
    			guideUrl   : guideUrl
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/admin/qrCreate",
    		data  : query,
    		success:function(res) {
    			if(res != "") {
    				alert("생성된 QR코드명 : " + res);
    				let qrCode = 'QR Code명 : ' + res + '<br/>';
    				qrCode += '<img src="${ctp}/qrCode/'+res+'.png"/>';
    				$("#demo").html(qrCode);
    			}
    			else alert("QR코드 생성 실패~~");
    		},
    		error : function() {
    			alert("전송 오류!!");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>소개할 도감을 QR코드로 생성하기</h2>
  <div>(소개하고 싶은 도감의 주소를 입력해주세요)</div>
  <hr/>
  <form method="post">
	  <table class="table table-bordered">
	    <tr>
	      <th>이동할 주소</th>
	      <td><input type="text" name="guideUrl" id="guideUrl" class="form-control" autofocus /></td>
	    </tr>
	    <tr>
	      <td colspan="2" class="text-center">
	        <input type="button" value="QR코드 생성" onclick="qrCreate()" class="btn btn-success mr-2"/>
	        <input type="button" value="다시입력" onclick="location.reload()" class="btn btn-warning mr-2"/>
	        <input type="button" value="돌아가기" onclick="location.href='menagerPage';" class="btn btn-info"/>
	      </td>
	    </tr>
	  </table>
  </form>
  <hr/>
  <div>생성된 QR 코드 :<br/>
    <div id="demo"></div>
  </div>
</div>
<p><br/></p>
</body>
</html>