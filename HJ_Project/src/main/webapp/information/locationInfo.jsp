<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>IT HILLSTATE - Location Information</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap) -->
	<link href="../css/styles.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed499ab304d53c50b6ef30665fbdf6bd"></script>
</head>
<body class="d-flex flex-column min-vh-100"> 
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 본문 시작 -->
		<main class="container-sm" style="margin-top: 50px;">
		<h3 style="margin-bottom: 30px;">오시는 길</h3>       
			<div class="container text-center" style="margin-bottom: 30px;"> 
				<div class="row">
					<div class="col">
						<!-- 카카오맵 -->
						<div id="map" style="width:500px;height:500px;"></div>
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng(35.1571, 129.0631), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						// 마커가 표시될 위치입니다 
						var markerPosition  = new kakao.maps.LatLng(35.1571, 129.0631); 
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
						// marker.setMap(null);    
						</script>	 
					</div>
					<!-- 길 안내 -->
					<div class="col" style="padding-top: 120px;">
						<div style="margin-top: 10px; margin-bottom: 10px;">
							<svg style="float: left;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
								<path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"></path>
								<path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"></path>
							</svg>
							<h4> 부산 부산진구 동천로 92</h4><br>
						</div>
						<div style="margin-top: 10px; margin-bottom: 10px;">
							<svg style="float: left;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-train-lightrail-front" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M6.5 0a.5.5 0 0 0 0 1h1v1.011c-1.525.064-3.346.394-4.588.655C1.775 2.904 1 3.915 1 5.055V13.5A2.5 2.5 0 0 0 3.5 16h9a2.5 2.5 0 0 0 2.5-2.5V5.055c0-1.14-.775-2.15-1.912-2.39-1.242-.26-3.063-.59-4.588-.654V1h1a.5.5 0 0 0 0-1h-3ZM8 3c-1.497 0-3.505.356-4.883.644C2.464 3.781 2 4.366 2 5.055V13.5a1.5 1.5 0 0 0 1.072 1.438c.028-.212.062-.483.1-.792.092-.761.2-1.752.266-2.682.038-.531.062-1.036.062-1.464 0-1.051-.143-2.404-.278-3.435a52.052 52.052 0 0 0-.07-.522c-.112-.798.42-1.571 1.244-1.697C5.356 4.199 6.864 4 8 4c1.136 0 2.645.2 3.604.346.825.126 1.356.9 1.244 1.697-.022.16-.046.335-.07.522C12.643 7.596 12.5 8.949 12.5 10c0 .428.024.933.062 1.464.066.93.174 1.92.266 2.682.038.31.072.58.1.792A1.5 1.5 0 0 0 14 13.5V5.055c0-.69-.464-1.274-1.117-1.41C11.505 3.354 9.497 3 8 3Zm3.835 11.266c.034.28.066.53.093.734H4.072a62.692 62.692 0 0 0 .328-3h2.246c.36 0 .704-.143.958-.396a.353.353 0 0 1 .25-.104h.292a.35.35 0 0 1 .25.104c.254.253.599.396.958.396H11.6c.068.808.158 1.621.236 2.266ZM6 13.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0Zm0 0a.5.5 0 1 1 1 0 .5.5 0 0 1-1 0Zm3.5.5a.5.5 0 0 0 .5-.5.5.5 0 1 0 1 0 .5.5 0 0 0-1 0 .5.5 0 1 0-.5.5Zm-5.03-3h2.176a.353.353 0 0 0 .25-.104c.254-.253.599-.396.958-.396h.292c.36 0 .704.143.958.396a.353.353 0 0 0 .25.104h2.177c-.02-.353-.031-.692-.031-1 0-.927.104-2.051.216-3H4.284c.112.949.216 2.073.216 3 0 .308-.011.647-.03 1Zm-.315-5h7.69l.013-.096a.497.497 0 0 0-.405-.57C10.495 5.188 9.053 5 8 5s-2.495.188-3.453.334a.497.497 0 0 0-.405.57L4.155 6Z"/>
							</svg>					
							<h4> 부산 지하철 1호선 서면역 인근</h4><br>
						</div>
						<div style="margin-top: 10px; margin-bottom: 10px;">
							<svg style="float: left;" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
								<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
							</svg>
							<h4> 051-000-0000</h4>
						</div>
					</div>
				</div>
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