<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>새의 특징</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<script>
		'use strict';
		function birdTitleSearch(title, photo) {
			let str = '';
			if(title == "해부학적특징") {
				str += '<span class="btn btn-info mr-3">해부학적 이해</span>';
				str += '<span class="btn btn-info" onclick="birdAnatomy()">골격의 이해</span><hr/>';
			}
		  str += '<img src="${ctp}/bird/'+photo+'" />';
			$("#demo").html(str);
		}
		
		function birdAnatomy() {
			let str = '';
			str += "<span class='btn btn-info mr-3' onclick=\"birdTitleSearch('해부학적특징'),'202402515726854_info3-2.jpg')\">해부학적 이해</span>";
			str += '<span class="btn btn-info">골격의 이해</span><hr/>';
		  str += '<img src="${ctp}/bird/birdInfo3-1.jpg" />';
			$("#demo").html(str);
		}
		
		function birdTitleOut(title,photo) {
			
			let str = '';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㄱ\',\'info6-1.jpg\')">ㄱ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㄴ\',\'info6-2.jpg\')">ㄴ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㄷ\',\'info6-3.jpg\')">ㄷ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㅁ\',\'info6-4.jpg\')">ㅁ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㅂ\',\'info6-5.jpg\')">ㅂ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㅅ\',\'info6-6.jpg\')">ㅅ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㅇ\',\'info6-7.jpg\')">ㅇ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㅈ\',\'info6-8.jpg\')">ㅈ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㅊ\',\'info6-9.jpg\')">ㅊ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㅌ\',\'info6-10.jpg\')">ㅌ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㅍ\',\'info6-11.jpg\')">ㅍ</span>';
			str += '<span class="btn btn-info mr-3" onclick="birdTitleOut(\'ㅎ\',\'info6-12.jpg\')">ㅎ</span>';
			str += '<hr/>';
		  str += '<img src="${ctp}/bird/'+photo+'" />';
			$("#demo").html(str);
		}
		
		var topButton = document.getElememtbyId("topBtn");
		
		window.onscroll = function () {
			scrollFunction();
	  }
	    
    function scrollFunction() {
        // 현재 문서의 body 부분의 스크롤 위치
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            // 만약 스크롤 위치가 20px 이상이면 버튼을 보이게 함
            topButton.style.display = "block";
        } else {
            // 그렇지 않으면 버튼을 숨김
            topButton.style.display = "none";
        }
    }
	    
    function topCheck() {
        document.documentElement.scrollTop = 0; // For Chrome and IE  
    }
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<a href="birdFeature?idx=${vo.idx}" class="btn btn-success"><span>새의 특징(일반론)</span></a>
	<a href="birdEvolve?idx=${vo.idx}" class="btn btn-success"><span>새의 진화</span></a>
	<a href="javascript:birdTitleOut('ㄱ','info6-1.jpg')" class="btn btn-success"><span>외부 명칭</span></a>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<a href="javascript:birdTitleSearch('${vo.title}','${vo.photo}')" class="btn btn-success"><span>${vo.title}</span></a>
	</c:forEach>
  <p><br/></p>
  <hr/>
  <p><br/></p>
  <div id="demo">
	  <div>
	  	<h1>새의 특징(일반론)</h1>
	  </div>
	  <div>
	  	<p>
	  		1억 6천만 년 전 파충류로부터 갈라져 나온 조류는 지구상의 그 어떤 동물보다도 신비롭고 아름다우며 자유로운 존재이다.<br/> 
	  		하늘을 자유롭게 날 수 있다는 것은 조류의 가장 큰 특징이자, 조류가 인류의 추앙과 흠모의 대상이 된 이유였다.<br/> 
	  		고구려 이전부터 신성시했던 태양숭배사상 속의 삼족오를 비롯하여, 매의 머리를 가진 고대 이집트의 신 호루스(Horus), 그리스 신화 속 이카루스의 날개 등<br/> 조류와 새의 날개는 인류가 동경한 자유의 상징이었다.<br/> 
	  		인류가 지구상에 나타나기 이전부터 번성한 조류는 남극, 고산지대, 대양, 물속과 사막은 물론이고 도심의 한 복판에서조차 적응하여 모든 곳에 살고 있으며,<br/> 현재 약 9,000종으로 분화되었다.<br/> 
	  		그러나 새들은, 다른 동물들과 구분되는, 다음과 같은 공통적인 특징들을 가진다.
	  	</p>
	  </div>
	  <p><br/></p>
	  <div>
	  	<h2>조류의 특성</h2>
	  </div>
	  <div>
	  	다른 동물과 달리 새가 가진 특성은 다음과 같이 정의할 수 있다.
	  </div>
	  <p><br/></p>
	  <div style="border:1px solid">
	  	<h4><b>가.깃털을 가지고 있다.</b></h4>
	  	<p>
	  		깃털을 가진 동물은 새가 유일하다.<br/>
				깃털은 파충류의 비늘이 변형된 것으로, 가볍고 구조적으로 강하며 다양한 구조와 형태를 지녀 보온과 방수를 가능하게 하며 날 수 있도록 도와준다.<br/> 
				포유류인 박쥐의 날개막은 피부의 연장이므로 보온에 도움이 되지 못하며, 손상되면 복구가 어렵다.<br/>
				그러나 깃털은 주기적으로 빠지고 다시 자라나므로 영구히 재생된다.<br/>
	  	</p>
	  </div>
	  <p><br/></p>
	  <div class="box_bird" style="border:1px solid">
	  	<h4><b>나. 날개를 이용해 하늘을 날 수 있다.</b></h4>
	  	<table class="table table-borderless">
		    <tr>
		      <td><img src="${ctp}/resources/images/2.jpg" style="margin-right:5px;"/></td>
		      <td>
		        [하늘을 나는 재두루미]<br/>
		  	    몸이 너무 무겁거나 날 필요가 없는 몇몇 종을 제외하고 모든 새는 하늘을 날 수 있다.<br/> 
	  				날개는 앞다리의 변형인데, 여기에 돋아있는 날개깃을 이용하여 하늘에서 자유로이 날아다닐 수 있는 것이다.
			  	</td>
			  </tr>
		  </table>	
	  </div>
	  <p><br/></p>
	  <div class="box_bird" style="border:1px solid">
	  	<h4><b>다. 뛰어난 시력과 가벼운 뼈를 지녔다.</b></h4>
	  	<div class="img_bird">
  		  <table class="table table-borderless">
  		    <tr>
  		      <td><img src="${ctp}/resources/images/3.jpg" style="margin-right:5px;"/></td>
  		      <td>
			  	    [큰 눈을 가진 금눈쇠올빼미]<br/>
				  		빠른 속도로 하늘을 날아다니기 위해서는 뛰어난 시각을 가질 필요가 있다.<br/> 
				  		새는 머리무게의 15%나 되는 커다란 눈을 가지고 있으며, 빠른 판단을 내림으로써 충돌을 피한다.<br/> 
				  		몸이 무거우면 날아다닐 때 많은 에너지를 소모하게 되므로, 새의 뼈는 속이 비어 있다.<br/>
				  	</td>
				  </tr>
			  </table>
		  </div>
	  </div>
	  <p><br/></p>
	  <div class="box_bird" style="border:1px solid">
	  	<h4><b>라. 몸은 유선형이며, 날기 위해 완강한 골조(骨組)</b></h4>
	  	<table class="table table-borderless">
	  	  <tr>
	  	    <td>
	  	      <img src="${ctp}/resources/images/4.jpg" style="margin-right:5px;"/><br/>
			  	  [나는 새 중 가장 무거운 큰고니]<br/>
			  	</td>
			  	<td rowspan="2">
			  	  <img src="${ctp}/resources/images/5.jpg" style="margin-right:5px;"/><br/>
			  	  [날지 못하는 새 타조]
			  	</td>
			  </tr>
	  	  <tr>
	  	    <td class="p-5">
			  		공기의 저항을 줄일수록 날기 쉬우므로 조류의 몸은 유선형으로 진화하였다.<br/> 
			  		몸의 돌출부는 깃털로 감싸져 있어 공기 저항을 최소화하며 더욱 쉽게 날 수 있다.<br/>
			  		날기 위해서 체중을 줄여야만 하므로 뼈 속이 비워졌듯이, 무거운 이빨 대신 가벼운 부리를 발달시켰으며 꼬리뼈를 축합시켜 몸무게를 줄였다.<br/> 
			  		새의 뼈는 얇고 가볍지만, 강하고 단단한 구조를 가지고 있다. 가장 무거운 새는 큰고니로 최대 14kg의 몸무게를 가진다.<br/> 
			  		그러나 그보다 훨씬 몸이 무거운 타조는 나는 것을 버리고 빠르게 달릴 수 있는 다리를 발달시켰다.<br/>
	  		  <td>
	  	  </tr>
	  	</table>
	  </div>
	  <p><br/></p>
	  <div class="box_bird" style="border:1px solid">
	  	<h4><b>마. 둥지를 짓고 알을 낳는다.</b></h4>
	  	<div class="img_bird">
	  		<table class="table table-borderless">
	  			<tr>
		  	    <td><img src="${ctp}/resources/images/6.jpg" style="margin-right:5px;"/></td>
		  	    <td>
				  	[검은머리갈매기 둥지]
			  		후손을 위해 둥지를 짓는다.<br/> 
			  		묵은 둥지는 벌레나 균이 번성하기 쉽기 때문에 대부분 매년 새로 짓거나, <br/>옛날 둥지를 새로이 보수하여 사용한다.<br/> 
			  		알은 어미가 키울 수 있을 만큼 낳아 품는데 독수리는 1개, 오리류는 15개 안팎의 알을 낳는다.<br/>
		  			</td>
	  			</tr>
	  		</table>	
		  </div> 
	  </div>
	  <p><br/></p>
	  <div class="box_bird" style="border:1px solid">
	  	<h4><b>바. 먼 거리를 이동한다.</b></h4>
	  	<p>
	  		도요류는 시베리아 북부에서 호주와 뉴질랜드까지 4,000km 이상을 매년 왕복하며 생활한다.<br/> 
	  		도요류의 크기는 18cm에서부터 60cm 까지 다양하지만, 거의 모든 도요류는 먹이가 부족한 겨울을 피해 해마다 먼 거리를 비행한다.<br/> 
	  		그러므로 이들에게는 춥고 배고픈 겨울이 없다.<br/>
	  	</p>
	  </div>
	  <p><br/></p>
	  <div class="box_bird" style="border:1px solid">
	  	<h4><b>사. 체온이 높다.</b></h4>
	  	<p>
	  		포유동물의 체온은 대체로 36도 내외이지만, 조류는 40도 안팎의 비교적 높은 체온을 가지고 있다.<br/> 
	  		높은 체온은 깃털에 의해 유지되고, 보호되는 항온동물이다.
	  	</p>
	  </div>
	  <div style="text-align:center">
	  	<input type="button" onclick="location.href='${ctp}/h';" style="margin-top:20px;" value = "이전으로 돌아가기" class="btn btn-danger"/>
	  </div>
	</div>
</div>
<div>
	<input type="button" id="topBtn" onclick="topCheck()';" class="btn btn-primary inline-block fixed" style="margin-left:1450px" value="TOP">
</div>
<p><br/></p>
</body>
</html>