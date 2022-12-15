<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - Brand Information</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap) -->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 	해당 페이지 추가 스타일 -->
	<link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/carousel/">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
    <link href="../css/carousel.css" rel="stylesheet">
</head>
<script>
	<!-- 메인 이미지 슬라이드 -->
	var index = 0;   //이미지에 접근하는 인덱스
	window.onload = function(){
	slideShow();
	}
	function slideShow() {
	var i;
	var x = document.getElementsByClassName("img-fluid rounded mb-4 mb-lg-0");  //slide1에 대한 dom 참조
	for (i = 0; i < x.length; i++) {
	   x[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
	}
	index++;
	if (index > x.length) {
	    index = 1;  //인덱스가 초과되면 1로 변경
	}   
	x[index-1].style.display = "block";  //해당 인덱스는 block으로
	setTimeout(slideShow, 2000);   //함수를 2초마다 호출
	}
</script>
<style>
  .bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
  }
  @media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
  }
  .b-example-divider {
    height: 3rem;
    background-color: rgba(0, 0, 0, .1);
    border: solid rgba(0, 0, 0, .15);
    border-width: 1px 0;
    box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
  }
  .b-example-vr {
    flex-shrink: 0;
    width: 1.5rem;
    height: 100vh;
  }
  .bi {
    vertical-align: -.125em;
    fill: currentColor;
  }
  .nav-scroller {
    position: relative;
    z-index: 2;
    height: 2.75rem;
    overflow-y: hidden;
  }
  .nav-scroller .nav {
    display: flex;
    flex-wrap: nowrap;
    padding-bottom: 1rem;
    margin-top: -1px;
    overflow-x: auto;
    text-align: center;
    white-space: nowrap;
    -webkit-overflow-scrolling: touch;
  }
</style>	
<body class="d-flex flex-column min-vh-100"> 
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 본문 시작 -->
		<main class="container-sm" style="margin-top: 50px;">
			<h3 style="margin-bottom: 30px;">브랜드 소개</h3>
			<!-- 상단 메인이미지 (슬라이드 4장) -->
			<div style="display: flex; justify-content: center;">
				<img class="img-fluid rounded mb-4 mb-lg-0" src="../images/brandInfo_main_1.jpg" >
				<img class="img-fluid rounded mb-4 mb-lg-0" src="../images/brandInfo_main_2.jpg">
				<img class="img-fluid rounded mb-4 mb-lg-0" src="../images/brandInfo_main_3.jpg">
			</div>
			<!-- 이미지 아래 텍스트 -->
			<div style="margin-left: 100px; margin-top: 30px;">
				<h1 style="font-weight:500;">대한민국 아파트 역사가 <br>바로 아이티 힐스테이트 아파트 역사 입니다.</h1>
				<p class="lead" style="line-height:1.8;">
				아이티 힐스테이트가 추구하는 브랜드의 가치를 실현하기 위해 동종업계 최초로 주거공간을 <br>
				‘라이프스타일 플랫폼(Lifestyle Platform)’으로 규정하고 다양해진 고객들의 삶의 면면을 담아,<br> 
				고객 니즈(Needs)와 원츠(Wants)에 맞춘 새로운 삶의 방식을 창조하고자 합니다.<br>
				남다른 삶을 제공하는 라이프스타일 플랫폼, 아이티 힐스테이트에서 한 차원 높은 생활과 만족을 경험해 보세요.</p>		
			</div>
			<hr class="featurette-divider">
			<!-- 강점 소개 -->
			<div class="container marketing">
				<div class="row">
					<div class="col-lg-4">
						<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-mortarboard" viewBox="0 0 16 16">
							<path d="M8.211 2.047a.5.5 0 0 0-.422 0l-7.5 3.5a.5.5 0 0 0 .025.917l7.5 3a.5.5 0 0 0 .372 0L14 7.14V13a1 1 0 0 0-1 1v2h3v-2a1 1 0 0 0-1-1V6.739l.686-.275a.5.5 0 0 0 .025-.917l-7.5-3.5ZM8 8.46 1.758 5.965 8 3.052l6.242 2.913L8 8.46Z"/>
							<path d="M4.176 9.032a.5.5 0 0 0-.656.327l-.5 1.7a.5.5 0 0 0 .294.605l4.5 1.8a.5.5 0 0 0 .372 0l4.5-1.8a.5.5 0 0 0 .294-.605l-.5-1.7a.5.5 0 0 0-.656-.327L8 10.466 4.176 9.032Zm-.068 1.873.22-.748 3.496 1.311a.5.5 0 0 0 .352 0l3.496-1.311.22.748L8 12.46l-3.892-1.556Z"/>
						</svg>
						<br><br>
						<h3>No.1 교육</h3>
						<p>우리아이 위한 교육환경 좋은 아파트<br>전포초등학교, 부전도서관 등 다수의 교육시설</p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
						<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-fingerprint" viewBox="0 0 16 16">
							<path d="M8.06 6.5a.5.5 0 0 1 .5.5v.776a11.5 11.5 0 0 1-.552 3.519l-1.331 4.14a.5.5 0 0 1-.952-.305l1.33-4.141a10.5 10.5 0 0 0 .504-3.213V7a.5.5 0 0 1 .5-.5Z"/>
							<path d="M6.06 7a2 2 0 1 1 4 0 .5.5 0 1 1-1 0 1 1 0 1 0-2 0v.332c0 .409-.022.816-.066 1.221A.5.5 0 0 1 6 8.447c.04-.37.06-.742.06-1.115V7Zm3.509 1a.5.5 0 0 1 .487.513 11.5 11.5 0 0 1-.587 3.339l-1.266 3.8a.5.5 0 0 1-.949-.317l1.267-3.8a10.5 10.5 0 0 0 .535-3.048A.5.5 0 0 1 9.569 8Zm-3.356 2.115a.5.5 0 0 1 .33.626L5.24 14.939a.5.5 0 1 1-.955-.296l1.303-4.199a.5.5 0 0 1 .625-.329Z"/>
							<path d="M4.759 5.833A3.501 3.501 0 0 1 11.559 7a.5.5 0 0 1-1 0 2.5 2.5 0 0 0-4.857-.833.5.5 0 1 1-.943-.334Zm.3 1.67a.5.5 0 0 1 .449.546 10.72 10.72 0 0 1-.4 2.031l-1.222 4.072a.5.5 0 1 1-.958-.287L4.15 9.793a9.72 9.72 0 0 0 .363-1.842.5.5 0 0 1 .546-.449Zm6 .647a.5.5 0 0 1 .5.5c0 1.28-.213 2.552-.632 3.762l-1.09 3.145a.5.5 0 0 1-.944-.327l1.089-3.145c.382-1.105.578-2.266.578-3.435a.5.5 0 0 1 .5-.5Z"/>
							<path d="M3.902 4.222a4.996 4.996 0 0 1 5.202-2.113.5.5 0 0 1-.208.979 3.996 3.996 0 0 0-4.163 1.69.5.5 0 0 1-.831-.556Zm6.72-.955a.5.5 0 0 1 .705-.052A4.99 4.99 0 0 1 13.059 7v1.5a.5.5 0 1 1-1 0V7a3.99 3.99 0 0 0-1.386-3.028.5.5 0 0 1-.051-.705ZM3.68 5.842a.5.5 0 0 1 .422.568c-.029.192-.044.39-.044.59 0 .71-.1 1.417-.298 2.1l-1.14 3.923a.5.5 0 1 1-.96-.279L2.8 8.821A6.531 6.531 0 0 0 3.058 7c0-.25.019-.496.054-.736a.5.5 0 0 1 .568-.422Zm8.882 3.66a.5.5 0 0 1 .456.54c-.084 1-.298 1.986-.64 2.934l-.744 2.068a.5.5 0 0 1-.941-.338l.745-2.07a10.51 10.51 0 0 0 .584-2.678.5.5 0 0 1 .54-.456Z"/>
							<path d="M4.81 1.37A6.5 6.5 0 0 1 14.56 7a.5.5 0 1 1-1 0 5.5 5.5 0 0 0-8.25-4.765.5.5 0 0 1-.5-.865Zm-.89 1.257a.5.5 0 0 1 .04.706A5.478 5.478 0 0 0 2.56 7a.5.5 0 0 1-1 0c0-1.664.626-3.184 1.655-4.333a.5.5 0 0 1 .706-.04ZM1.915 8.02a.5.5 0 0 1 .346.616l-.779 2.767a.5.5 0 1 1-.962-.27l.778-2.767a.5.5 0 0 1 .617-.346Zm12.15.481a.5.5 0 0 1 .49.51c-.03 1.499-.161 3.025-.727 4.533l-.07.187a.5.5 0 0 1-.936-.351l.07-.187c.506-1.35.634-2.74.663-4.202a.5.5 0 0 1 .51-.49Z"/>
						</svg>
						<br><br>
						<h3>No.1 보안</h3>
						<p>세대, 공동현관에 적용된 얼굴인식 출입 시스템으로<br>편리하고 안전하게 출입</p>
					</div><!-- /.col-lg-4 -->
					<div class="col-lg-4">
						<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-truck-front" viewBox="0 0 16 16">
							<path d="M5 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm8 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0Zm-6-1a1 1 0 1 0 0 2h2a1 1 0 1 0 0-2H7Z"/>
							<path fill-rule="evenodd" d="M4 2a1 1 0 0 0-1 1v3.9c0 .625.562 1.092 1.17.994C5.075 7.747 6.792 7.5 8 7.5c1.208 0 2.925.247 3.83.394A1.008 1.008 0 0 0 13 6.9V3a1 1 0 0 0-1-1H4Zm0 1h8v3.9c0 .002 0 .001 0 0l-.002.004a.013.013 0 0 1-.005.002h-.004C11.088 6.761 9.299 6.5 8 6.5s-3.088.26-3.99.406h-.003a.013.013 0 0 1-.005-.002L4 6.9c0 .001 0 .002 0 0V3Z"/>
							<path fill-rule="evenodd" d="M1 2.5A2.5 2.5 0 0 1 3.5 0h9A2.5 2.5 0 0 1 15 2.5v9c0 .818-.393 1.544-1 2v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5V14H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2a2.496 2.496 0 0 1-1-2v-9ZM3.5 1A1.5 1.5 0 0 0 2 2.5v9A1.5 1.5 0 0 0 3.5 13h9a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 12.5 1h-9Z"/>
						</svg>
						<br><br>
						<h3>No.1 교통</h3>
						<p>지하철 도보 1분 거리로 초역세권 아파트<br>1가구 3차량 주차 가능</p>
					</div>
				</div>
			<hr class="featurette-divider">
			 <!-- 아파트 내 공원 소개 -->
			<div class="row featurette" style="display: flex; justify-content: center;">
				<div class="col-md-5">
					<img alt="" src="../images/brandInfo_side_1.jpg">
				</div>
				<div class="col-md-5 order-md-1">
					<img alt="" src="../images/brandInfo_side_2.jpg">
				</div>
			</div>
			<div style="margin-left: 100px; margin-top: 30px;">
				<div>
					<h4>왕벚가로길</h4>
					<p class="lead">단지를 가로지르는 곡선형 축선을 따라 형성된 왕벚나무 특화 가로길</p>
				</div>		
				<div>
					<h4>센트럴가든</h4>
					<p class="lead">푸른 잔디와 수경시설이 어우러져 가족이 함께 할 수 있는 휴게공간</p>
				</div>
			</div>
			<hr class="featurette-divider">
			</div>
	 	</main>           
	<!-- 푸터 -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>