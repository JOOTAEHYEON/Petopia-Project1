<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/001_main.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
 <script >location.href="main.do"  </script>
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>
</head>

<body>

	<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");    // 일부파이어폭스버그관련
	response.setDateHeader("Expires", 1L);              //응답결과의만료일지정
	%>
		<!-- ==========================nav============================= -->	
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
		<div class="container-fluid d-flex align-items-center mx-4">
    <a class="navbar-brand mr-3" href="${pageContext.request.contextPath}/main.do">  <img src="${pageContext.request.contextPath}/resources/pic/LOGO1.png" width="140px" height="80px">   </a>
	<div class=" display ml-4"  style="margin-left: 45px;">
    <div class="mr-2" style="margin-right: 15px;"> <a class="nav-link active b jua_nav" aria-current="page" href="#">동물병원 예약</a></div>
	<div class="mr-2" style="margin-right: 15px;"><a class="nav-link active b jua_nav" aria-current="page" href="#">미용실 예약</a></div>
	<div class="mr-2" style="margin-right: 15px;"><a class="nav-link active b jua_nav" aria-current="page" href="#">애견호텔 예약</a></div>
	</div>
	
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

   <div class="collapse navbar-collapse  displaye" style="margin-right: 100px;">
    <ul class="navbar-nav ">
        <li class="nav-item mr-3"><a class="nav-link active b jua_nav" aria-current="page" href="${pageContext.request.contextPath}/login.do">로그인</a></li>
        <li class="nav-item dropdown ">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px">
            </a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/MyInfo.do">내정보</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/BookList.do">예약 내역</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/MyOrders.do">구매 내역</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/cart.do">장바 구니</a></li>
            </ul>
        </li>
    </ul>
</div>

</div> <!-- 1차 nav bar -->
	</nav>
<nav class="navbar navbar-expand-lg bg-body-tertiary2 nav_mt align-items-center"> 
<div class="container-fluid d-flex justify-content-end navbar2">
    <div class="display nav_mr">
        <a class="nav-link active b sejong_nav nav_mr" href="#">스토어</a>
        <a class="nav-link active b sejong_nav nav_mr" href="#">커뮤니터</a>
        <a class="nav-link active b sejong_nav nav_mr" href="#">유기동물 현황 </a>
    </div>
</div>
</nav>

	<!-- ---------------------------------------------------------------------- -->
		<div class="topm_main carousel-inner">		
			<div class="m-4 " style="position: relative; height:120px">
					<form action="# "class=" carousel-item active card-img-overlay d-flex display "  style="position: absolute; bottom: 0px;"role="search">
						<input class="form-control " id="line" type="search" style="border: 3px solid #FFCD00;" placeholder="궁금한 내용을 검색하세요."> 		
						<button type="submit" style="height: 70px; width: 180px; font-size: 20px; font-weight: bold;" class="btn btn-dark">검색 하기</button>
					</form>			
			</div>
		</div>
	
	<!-- ---------------------------------------------------------------------- -->

	<div class="main-mr ">
		<div>
			<div class="display"><h2 class="letter do_nav"> 🐶 강아지 인기예약  </h2></div>
		</div>
		<br>

		<div class="text-center contents">
    			<div class="image-container mt-3">
     		    <a href="#"> <img style="width: 350px; height: 200px;" src="./resources/pic/main_dog.jpg" class="rounded"></a>
       			 <p class="image-text mt-2">[병원] 24시 튼튼 동물 병원</p>
   			 </div>

			
			<div class="image-container mt-3">
				  <a href="#"> <img style="width: 350px; height: 200px;" src="./resources/pic/main_dog2.jpg" class="rounded"></a>			
				<p class="image-text mt-2">[미용] 애견 미용실 </p>
			</div>
			<div class="image-container mt-3">
				  <a href="#"> <img style="width: 350px; height: 200px;" src="./resources/pic/main_dog3.jpg" class="rounded"></a>			
				<p class="image-text mt-2">[호텔] 인천 공항 애견호텔</p>
			</div>
			<div class="image-container mt-3">
				  <a href="#"> <img style="width: 350px; height: 200px;" src="./resources/pic/main_dog4.jpg" class="rounded"></a>	
				<p class="image-text mt-2">[택시] 애견 택시</p>
			</div>
			
		</div>
	</div>

	<div class="main-mr1 ">
		<div class="display"><h2 class="letter do_nav"> 😻 고양이 인기예약  </h2></div>
		<br>

		<div class="text-center contents ">
			<div class="image-container">
				<a href="#"> <img style="width: 350px; height: 200px;" src="./resources/pic/main_cat1.jpg" class="rounded" ></a>		
				<p class="image-text mt-2">[미용]충무로 고양 미용실 </p>
			</div>
			
			<div class="image-container">
				<a href="#"> <img style="width: 350px; height: 200px;" src="./resources/pic/main_cat2.jpg" class="rounded" ></a>		
				<p class="image-text mt-2">[미용]충무로 고양 미용실 </p>
			</div>
			<div class="image-container">
				<a href="#"> <img style="width: 350px; height: 200px;" src="./resources/pic/main_cat3.jpg" class="rounded" ></a>		
				<p class="image-text mt-2">[호텔 ]인천공항 반려동물 HOTEL </p>
			</div>
			<div class="image-container">
				<a href="#"> <img style="width: 350px; height: 200px;" src="./pic/00_03D.jpg" class="rounded" ></a>		
				<p class="image-text mt-2">[미용]충무로 고양 미용실 </p>
			</div>
			
		</div>	
		</div>
	
	
		<div class="main-mr ">
		<div class="display"><h2 class="letter do_nav"> 🔥인기 지식 정보 🔥</h2></div>
		<br>
			<div class="display">
				<div class="card " style="width: 18rem; height:100%; position: relative; margin-right:22px;">
  				<img src="./pic/00_010.jpg" class="card-img-top " style="height:360px;">
  				<div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">  					
   					 <h1 class="card-title tway1">서울</h1>
   					 <p class="card-text tway1"> Best 상품만 모아! </p>
   				</div>
  				<div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
   					 <a href="SeoulListInfo.do" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
  				</div>
				</div>
			
			
			<div class="card mr-2" style="width: 18rem; height:100%; position: relative; margin-right:22px;">
  			<img src="./pic/00_012.jpg" class="card-img-top " style="height:360px;">
  			<div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">  		
   			 <h1 class="card-title tway1">부산</h1>
   			 <p class="card-text tway1"> All Time Legend </p>
   			 </div>
   			<div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
   					 <a href="BusanListInfo.do" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
  			</div>
			</div>
	
			<div class="card" style="width: 18rem; height:100%; position: relative; margin-right:22px;">
  			<img src="./pic/00_011.jpg" class="card-img-top " style="height:360px;">
  			<div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">  		
   			 <h1 class="card-title tway1">제주도</h1>
   			 <p class="card-text tway1">Dynamic Island</p>
   			 </div>
   			<div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
   					 <a href="JejuListInfo.do" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
  			</div>
			</div>
			
			<div class="card shadow" style="width: 18rem; height:100%; position: relative; margin-right:22px;">
  			<img src="./pic/00_013.jpg" class="card-img-top " style="height:360px;">
  			<div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">  		
   			 <h1 class="card-title tway1">대전</h1>
   			 <p class="card-text tway1">Chill and Fun</p>
   			 </div>
   			<div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
   				 <a href="DaejunListInfo.do" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
  			</div>
			</div>
  		</div>	
  		</div>

	<!-- ---------------------------------------------------------------------- -->
	
	<footer>
		<div class="container ">
			<div class="footer-menu">
				<!-- ------------------------------- 상자1 시작-------------------------------- -->
				<div class="first-box">
					<div class="column">
						<div class="sub-title">Category</div>
						<form >
							<input class="menu-item" type="submit" value="병원 예약하기" >
						</form>

						<form >
							<input class="menu-item" type="submit" value="미용실 예약하기" >
						</form>
						
						<form >
							<input class="menu-item" type="submit" value="호텔 & 유치원 예약하" >
						</form>
					</div>


					<div class="column">
						<div class="sub-title">Category</div>
						<form >
							<input class="menu-item" type="submit" value="스토어" >
						</form>
						<form >
							<input class="menu-item" type="submit" value="커뮤니티" >
						</form>
						
						<form >
							<input class="menu-item" type="submit" value="유기동물 통계" >
						</form>
					</div>


					<div class="column">
						<div class="sub-title">Customer Service</div>
						<div class="menu-item-1">운영시간: 09:00~18:00</div>
						<div class="menu-item-1">Tel: 02-1234-5667</div>
						
					</div>
				</div>
				<div class="second-box">
					<div class="icon-box"><img class="icon" src="${pageContext.request.contextPath}/resources/pic/00_insta.png" width="30px" height="24px"></div>
					<div class="icon-box"> <img class="icon" src="./pic/00_twiter.png" width=30px height=24px></div>
					<div class="icon-box"> <img class="icon" src="./pic/00_face.png" width=30px height=24px></div>
				</div>
			</div>

			<div class="second-head">
				<p>Seoul, Korea</p> <br>
				<div class="secon-last">© 2024 😻PET,TopiA🐶</div>
			</div>
		</div>
	</footer>

<!-- ======================================================== -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>