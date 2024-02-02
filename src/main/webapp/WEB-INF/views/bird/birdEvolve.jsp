<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>새의 진화</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script>
	  //var topButton = document.getElememtbyId("topButton");
		
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
	<div class="nav_tab">
		<a href="birdFeature?idx=${vo.idx}" class="btn btn-success"><span>새의 특징(일반론)</span></a>
		<a href="birdEvolve?idx=${vo.idx}" class="btn btn-success"><span>새의 진화</span></a>
		<c:forEach var="vo" items="${vos}" varStatus="st">
  			<a href="javascript:birdTitleSearch('${vo.title}','${vo.photo}')" class="btn btn-success"><span>${vo.title}</span></a>
		</c:forEach>
  </div>
  <hr/>
  <p><br/></p>
	<h2>새의 진화</h2>
	<div>
		<h4><b>조류의 진화</b></h4>
	</div>
	<div>
		<p>진화 단계에서 조류의 위치 - 조류와 파충류, 포유류의 비교</p>
	</div>
	<div>
		조류를 분류단계에 따라 분류해 보면, 동물(계), 척추동물(문), 조류(강)에 속한다.<br/> 
		척추동물은 척추(등뼈)가 있는 동물을 말하며, 진화 단계에 따라 어류, 양서류, 파충류, 조류, 포유류로 분류한다.<br/>
		조류의 위치는 파충류와 포유류의 사이로써 파충류보다는 더 진화되었고, 포유류보다는 덜 진화된 것으로 본다.<br/> 
		파충류, 조류, 포유류의 특징을 비교해봄으로써 조류의 진화적 위치를 살펴보고자 한다.<br/> 
		파충류는 육지와 바다에 골고루 분포하며, 몸의 표면이 각질의 비늘로 덮여있어서 건조한 육상 생활에 잘 견딘다.<br/> 
		외부온도에 따라 체온이 변하는 변온동물이며, 체내수정을 하고 폐로 호흡한다.<br/> 
		알을 낳아 번식하는데 이를 난생이라 한다.<br/> 
		알은 단단한 껍질로 쌓여있어서 건조한 육상 생활에 잘 견딜 수 있다.<br/> 
		조류는 몸의 피부가 깃털로 덮여있으며 날개가 있어서 날 수 있다.<br/> 
		외부온도가 변하여도 체온을 일정하게 유지하는 정온동물이며, 체내수정을 하고 폐로 호흡한다.<br/> 
		파충류처럼 알을 낳아 번식한다.<br/> 
		파충류나 포유류는 이가 있는 반면 조류는 이가 없고 뼈 속이 비어있으며 기낭이라 불리는 공기주머니가 있어 날기에 유리하다.<br/> 
	</div>
	<p><br/></p>
	<table class="table table-bordered" style="text-align:center;">
		<tr class="text-dark" style="background-color:#f2f2f2">
			<th></th>
			<th>파충류</th>
			<th>조류</th>
			<th>표유류</th>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">수정 장소</td>
			<td>체내 수정</td>
			<td>체내 수정</td>
			<td>체내 수정</td>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">호흡기관</td>
			<td>폐</td>
			<td>폐</td>
			<td>폐</td>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">심장 구조</td>
			<td>심방 불완전 2심실<br/> 2심방 2심실(악어류)</td>
			<td>2심방 2심실</td>
			<td>2심방 2심실</td>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">체온 변화</td>
			<td>변온</td>
			<td>정온</td>
			<td>정온</td>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">출산 방식</td>
			<td>난생<br/>난태생(살무사)</td>
			<td>난생</td>
			<td>태생</td>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">척색 유무</td>
			<td>척색→척추</td>
			<td>척색→척추</td>
			<td>척색→척추</td>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">골격(뼈)</td>
			<td>단단하고 속이 꽉 차 있음</td>
			<td>속이 비어있음(날기에 유리)</td>
			<td>단단하고 속이 꽉 차 있음</td>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">이빨</td>
			<td>있음</td>
			<td>없음, 부리 발달</td>
			<td>있음</td>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">질소 배설물</td>
			<td>요산</td>
			<td>요산</td>
			<td>요소</td>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">몸표면</td>
			<td>각잘의 표피(비늘)</td>
			<td>날개와 깃털(다리, 발은 비늘로 덮여있음)</td>
			<td>털로 덮여있음</td>
		</tr>
		<tr>
			<td style="background-color:#f2f2f2">다리</td>
			<td>일반적으로 2쌍이나 일부는 퇴화하거나 없음</td>
			<td>1쌍 (앞다리는 일반적으로 날개로서 나는데 사용)</td>
			<td>2쌍</td>
		</tr>	
	</table>
	<p><br/></p>
	<div>
		<h3>새의 진화(새의 조상은?)</h3>
	</div>
	<p><br/></p>
	<div class="box_bird">
		<h4><b>1)시조새</b></h4>
		<div class="img_bird">
			<div class="img_bird2">
		  	<img src="${ctp}/resources/images/7.jpg" /><br/>
		  	[시조새 화석]
	  	</div>
		<p>
		조류의 진화에 대한 대표적인 것이 공룡 같은 파충류로부터 진화했다는 것이다.<br/> 
		현재까지 알려진 가장 오래된 조류 화석은 1861년 8월 15일 <br/>H. Von Meyer가 Solnhofen의 채석장에서 발견한 것이다.<br/>
		이 화석을 ‘오래된 날개’라는 뜻의 시조새(Archaeopteryx)라 부르며,<br/> 이 시조새는 약 1억 5천만 년 전에 살았으리라 추정된다.<br/> 
		시조새는 몸길이가 40cm 정도로 날개와 꼬리 깃이 있고 머리가 작고 눈이 크며, <br/>부리에 날카로운 이빨이 나 있다.<br/> 
		날개의 끝에 붙어있는 3개의 발가락에는 발톱이 달려있어 시조새가<br/> 나무와 관목에서 살았고, 나뭇가지 위로 기어오를 수 있었으리라 추측할 수 있다.<br/>
		시조새는 날개의 구조상 자유로이 날 수 없었을 것이며,<br/> 언덕이나 높은 곳에서 뛰어내려 공중을 활주했었을 것으로 여겨진다.<br/> 
		발달된 발과 다리는 새들이 뒷발로 걷거나 뛰는 것이 수각아목 공룡들로부터 <br/>진화했다는 설을 뒷받침 해주고 있다.<br/> 
		시조새는 새의 특징인 깃털을 가지고 있고 파충류의 특징인 <br/>긴 꼬리뼈, 날카로운 이빨, 앞 발톱 등을 가지므로 파충류와 조류의 중간형에 해당한다고 생각한다.<br/> 
		시조새 화석은 조류가 파충류(익룡 등)에서 진화했음을 보여 주는 진화의 고리로, <br/>지금까지 발견된 가장 중요한 화석 중 하나로 평가받고 있다.<br/>
		</p>
	 </div>
	</div>
	<p><br/></p>
	<div class="box_bird">
		<h4><b>2)간수스</b></h4>
		<div class="img_bird">
			<div class="img_bird2">
		  	<img src="${ctp}/resources/images/8.jpg" /><br/>
		  	[간수스 화석]<br/>
		  	<img src="${ctp}/resources/images/9.jpg" /><br/>
		  	[간수스 화석을 이용한 간수스 모형]
	  	</div>
		<p>
			파충류와 조류의 중간형태를 띠고 있어 조류의 조상으로 여겨지고 있는 시조새보다,<br/> 현재의 새와 더 가까운 조상으로 생각되는 조류('간수스 위머너시스(Gansus yumenesis)') 화석이 25년 전 중국 간쑤성 위먼 지역에서 처음 발견되었으며 최근에도 새 화석이 발견되었다.<br/>
			'간수스 위머너시스(Gansus yumenesis)' 화석을 근거로 간수스가 오늘날 새와 보다 더 가까운 조상일 수 있다는 연구결과는 미국 과학저널 ‘사이언스’(A Nearly Modern Amphibious Bird from the Early Cretaceous of Northwestern China.)에도 소개되었다.<br/> 
			사이언스는 간수스가 오리나 물새와 아주 비슷하게 생겼으며 약 1억 500만∼1억 1500만 년 전에 살았고, 상체의 뼈들을 볼 때 오늘날의 오리와 마찬가지로 물을 박차고 오를 수 있었을 것이라고 설명했다.<br/> 
			또한 간수스는 헤엄칠 수 있을 것이라 생각하였는데, 이는 발가락 사이의 물갈퀴 막과 질긴 근육으로 둘러싸인 단단한 정강이뼈를 갖고 있기 때문이다.<br/> 
			이러한 면에서 간수스는 현재의 새들과 가까운 오래 전 조류들의 대부분은 물속이나 물가에서 살았다는 사실도 보여주고 있다.<br/> 
			간수스는 발목과 윗다리 뼈들이 서로 합쳐져 있는데 이것은 시조새와는 다른 골격구조이다.<br/> 
			간수스는 조류의 시조로 여겨지는 시조새에서 현재의 새에 이르는 조류의 진화 단계의 한 부분이라 볼 수 있다.<br/>
			[출처] A Nearly Modern Amphibious Bird from the Early Cretaceous of Northwestern ChinaHai-lu You, 
			Matthew C. Lamanna, Jerald D. Harris, Luis M. Chiappe, Jingmai O'Connor, Shu-an Ji, Jun-chang Lu, Chong-xi Yuan, Da-qing Li, Xing Zhang, Kenneth J. Lacovara, Peter Dodson, and Qiang Ji Science 16 June 2006 312: 1640-1643 [DOI: 10.1126/science.1126377] (in Reports)
		</p>
	  </div>
	</div>
	<div class="text-center"> 
  	<img src="${ctp}/resources/images/10.jpg" class="m-3"/><br/>
  	[출처] 미국과학진흥협회(AAAS:American Association for the Advancement of Science) 홈페이지 2006년 6월 15일 뉴스
	</div>
	<div style="text-align:center">
		<input type="button" onclick="location.href='${ctp}/h';" value = "이전으로 돌아가기" class="btn btn-danger m-3"/>
	</div>
  <div>
		<input type="button" id="topButton" onclick="topCheck();" class="btn btn-primary inline-block fixed" style="margin-left:1300px" value="TOP">
	</div>
</div> 
<p><br/></p>
</body>
</html>