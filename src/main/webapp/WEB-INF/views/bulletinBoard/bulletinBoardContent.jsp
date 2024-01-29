<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>게시글 내용 글보기</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
  	th{
  		background-color:#ddd;
  		text-align:center;
  	}
  	.btn{
  		text-align:center;
  		border-right:none;
  	}
  </style>
  <script>
  	function deleteCheck() {
			let answer = confirm("삭제하시겠습니까?");
			if(!answer)	return false;
			let idx = ${vo.idx};
			
			location.href="${ctp}/bulletinBoard/bulletinBoardDelete?idx="+idx;
			
		  	
  	}
  	
  	function goodCheck() {
    	$.ajax({
    		url  : "boardGoodCheck",
    		type : "post",
    		data : {idx : ${vo.idx}},
    		success:function(res) {
    			if(res == "0") alert('이미 좋아요 버튼을 클릭하셨습니다.');
    			else location.reload();
    		},
    		error : function() {
    			alert("전송 오류!!");
    		}
    	});
    }
  	
  	 // 원본글에 대한 댓글 달기
    function replyCheck() {
    	let content = $("#content").val();
    	if(content.trim() == "") {
    		alert("댓글을 입력하세요!");
    		$("#content").focus();
    		return false;
    	}
    	let query = {
    			bulletinBoardIdx  : ${vo.idx},
    			mid				: '${sMid}',
    			nickName	: '${sNickName}',
    			content		: content
    	}
    	
    	$.ajax({
    		url  : "${ctp}/bulletinBoard/boardReplyInput",
    		type : "post",
    		data : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("댓글이 입력되었습니다.");
    				location.reload();
    			}
    			else {
    				alert("댓글 입력 실패~~");
    			}
    		},
    		error : function() {
    			alert("전송오류!!");
    		}
    	});
    }
    
    // 댓글 삭제하기
    function replyDelete(idx) {
    	let ans = confirm("선택한 댓글을 삭제하시겠습니까?");
    	if(!ans) return false;
    	$.ajax({
    		url  : "bulletinBoardReplyDelete",
    		type : "post",
    		data : {idx : idx},
    		success:function(res) {
    			if(res == "1") {
    				alert("댓글이 삭제되었습니다.");
    				location.reload();
    			}
    			else alert("댓글 삭제 실패~~");
    		},
    		error : function() {
    			alert("전송실패");
    		}
    	});
    }
    
 // 신고시 '기타'텍스트항목 보여주기
    function etcShow() {
    	$("#complaintTxt").show();
    }
    
    // 신고화면 선택후 신고사항 전송하기
    function complaintCheck() {
    	if (!$("input[type=radio][name=complaint]:checked").is(':checked')) {
        alert('신고항목을 선택하세요');
        return false;
      }
    	if($("input[type=radio][id=complaint7]:checked").val() == 'on' && $("#complaintTxt").val() == "") {
        alert("기타 사유를 입력해 주세요.");
        return false;
    	}
    	
      let cpContent = modalForm.complaint.value;
      if(cpContent == '기타') cpContent += "/" + $("#complaintTxt").val();
      
      $.ajax({
    	  url  : "bulletinBoardComplaintInput",
    	  type : "post",
    	  data : {
    		  bulletinBoardIdx : ${vo.idx},
    		  mid   : '${sMid}',
    		  content : cpContent
    	  },
    	  success:function(res) {
    		  if(res == "1") {
    			  alert("신고 되었습니다.");
    			  location.reload();
    		  }
    		  else alert('신고 실패~~');
    	  },
    	  error : function() {
    		  alert('전송오류!');
    	  }
      });
    }
    
    $(function(){
    	$(".replyCloseBtn").hide();
    });
    
    // 대댓글 박스 보여주기
    function replyShow(idx) {
    	$("#replyShowBtn"+idx).hide();
    	$("#replyCloseBtn"+idx).show();
    	$("#replyDemo"+idx).slideDown(100);
    }
    
    // 대댓글 박스 감추기
    function replyClose(idx) {
    	$("#replyShowBtn"+idx).show();
    	$("#replyCloseBtn"+idx).hide();
    	$("#replyDemo"+idx).slideUp(300);
    }
    
    // 대댓글(부모글의 답변글) 입력처리
    function replyCheckRe(idx,re_step,re_order) {
    	let content = $("#contentRe"+idx).val();
    	if(content.trim() == "") {
    		alert("답변글을 입력하세요!");
    		$("#contentRe"+idx).focus();
    		return false;
    	}
    	
    	let query = {
    		bulletinBoardIdx  : ${vo.idx},
  			re_step   : re_step,
  			re_order   : re_order,
  			mid				: '${sMid}',
  			nickName	: '${sNickName}',
  			content		: content
    	}
    	
    	$.ajax({
    		url  : "${ctp}/bulletinBoard/boardReplyInputRe",
    		type : "post",
    		data : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("답변글이 입력되었습니다.");
    				location.reload();
    			}
    			else {
    				alert("답변글 입력 실패~~");
    			}
    		},
    		error : function() {
    			alert("전송오류!!");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 style="text-align:center;">게시글 내용 보기</h2>
  <p><br/></p>
   <table class="table table-borderless m-0 p-0" >
  </table>
  <table class="table table-bordered">
    <tr>
      <th>글쓴이</th>
      <td>${vo.nickName}</td>
      <th>글쓴날짜</th>
      <td>${fn:substring(vo.WDate, 0, 10)}</td>
    </tr>
    <tr>
      <th>글제목</th>
      <td colspan="3">${vo.title}</td>
    </tr>
    <tr>
      <th>조회수</th>
      <td>${vo.readNum}</td>
    </tr>
    <tr>
      <th>좋아요</th>
      <td><font color="red"><a href="javascript:goodCheck()">❤</a></font>(${vo.good}) / <a href="javascript:goodCheckPlus()">👍</a></td>
    </tr>
    <tr>
      <th>글내용</th>
      <td colspan="3" style="height:220px">${fn:replace(vo.content, newLine, "<br/>")}</td>
    </tr>
  </table>
  <table class="table table-borderless m-0 p-0">
    <tr>
      <td class="text-left">
        <c:if test="${flag != 'search'}"><input type="button" value="돌아가기" onclick="location.href='bulletinBoardList';" class="btn btn-success"/> &nbsp;</c:if>
        <c:if test="${flag == 'search'}"><input type="button" value="돌아가기" onclick="location.href='bulletinBoardList';" class="btn btn-primary"/> &nbsp;</c:if>
      </td>
      <td class="text-right">
        <%-- <c:if test="${vo.mid != sMid}"><a href="complaintInput.ad" class="btn btn-danger">신고하기</a></c:if> --%>
        <c:if test="${vo.mid != sMid}"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">신고하기</button></c:if>
        <c:if test="${sMid == vo.mid || sLevel == 1}">
        	<input type="button" value="수정하기" onclick="location.href='bulletinBoardUpdate?idx=${vo.idx}';" class="btn btn-info"/> &nbsp;
        	<input type="button" value="삭제하기" onclick="deleteCheck()" class="btn btn-warning"/>
        </c:if>
      </td>
    </tr>
  </table>
  <hr/>
</div>
<br/>

<!-- 댓글 처리 -->
<div class="container">
	<!-- 댓글 리스트 보여주기 -->
  <table class="table table-hover text-center">
    <tr>
      <th>작성자</th>
      <th class="text-left">댓글내용</th>
      <th>댓글일자</th>
    </tr>
    <c:forEach var="vo" items="${rVos}" varStatus="st">
      <tr>
        <td>${vo.nickName}
          <c:if test="${vo.mid == sMid || sLevel == 1}">
            (<a href="javascript:replyDelete(${vo.idx})">x</a>)
          </c:if>
        </td>
        <td class="text-left">${fn:replace(vo.content,newLine,"<br/>")}</td>
        <td>${fn:substring(vo.WDate,0,10)}</td>
      </tr>
      <tr><td colspan="4" class="m-0 p-0"></td></tr>
    </c:forEach>
  </table>
  
  <!-- 댓글 입력창 -->
  <form name="replyForm">
    <table class="table table-center">
      <tr>
        <td style="width:85%" class="text-left">
          글내용 :
          <textarea rows="4" name="content" id="content" class="form-control"></textarea>
        </td>
        <td style="width:15%">
          <br/>
          <p style="font-size:13px">작성자 : ${sNickName}</p>
          <p><input type="button" value="댓글 달기" onclick="replyCheck()" class="btn btn-info btn-sm"/></p>
        </td>
      </tr>
    </table>
  </form>
</div>

<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content modal-sm">
      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">현재 게시글을 신고합니다.</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <b>신고사유 선택</b>
        <hr class="m-2"/>
        <form name="modalForm">
          <div class="form-check"><input type="radio" name="complaint" id="complaint1" value="욕설,비방,차별,혐오" class="form-check-input"/>욕설,비방,차별,혐오</div>
          <div class="form-check"><input type="radio" name="complaint" id="complaint2" value="홍보,영리목적" class="form-check-input"/>홍보,영리목적</div>
          <div class="form-check"><input type="radio" name="complaint" id="complaint3" value="불법정보" class="form-check-input"/>불법정보</div>
          <div class="form-check"><input type="radio" name="complaint" id="complaint4" value="음란,청소년유해" class="form-check-input"/>음란,청소년유해</div>
          <div class="form-check"><input type="radio" name="complaint" id="complaint5" value="개인정보노출,유포,거래" class="form-check-input"/>개인정보노출,유포,거래</div>
          <div class="form-check"><input type="radio" name="complaint" id="complaint6" value="도배,스팸" class="form-check-input"/>도배,스팸</div>
          <div class="form-check"><input type="radio" name="complaint" id="complaint7" value="기타" class="form-check-input" onclick="etcShow()"/>기타</div>
          <div id="etc"><textarea rows="2" name="complaintTxt" id="complaintTxt" class="form-control" style="display:none;"></textarea></div>
          <hr class="m-1"/>
          현재글 제목 : <span class="mb-2">${vo.title}</span><br/>
          신고자 아이디 : <span class="mb-2">${sMid}</span>
          <hr class="m-2"/>
          <input type="button" value="확인" onclick="complaintCheck()" class="btn btn-success form-control" />
          <input type="hidden" name="idx" id="idx" value="${vo.idx}"/>
        </form>
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</div> 
<p><br/></p>
</body>
</html>