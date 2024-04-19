<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">

<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/001_main2.css">
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
		<div class="  container-fluid d-flex align-items-center mx-4">
    <a class="navbar-brand mr-3" href="${pageContext.request.contextPath}/main.do">  <img src="${pageContext.request.contextPath}/resources/pic/LOGO1.png" width="210px" height="80px">   </a>
	<div class=" display"  style="margin-left: 4px;">
    <div class="mr-2" style="margin-right: 15px;"> <a class="nav-link active b jua_nav" aria-current="page" href="hospital.do">동물병원 예약</a></div>
	<div class="mr-2" style="margin-right: 15px;"><a class="nav-link active b jua_nav" aria-current="page" href="salon.do">미용실 예약</a></div>
	<div class="mr-2" style="margin-right: 15px;"><a class="nav-link active b jua_nav" aria-current="page" href="hotel.do">애견호텔 예약</a></div>
	<div class="mr-2" style="margin-right: 15px;"><a class="nav-link active b jua_nav" aria-current="page" href="StrayAnimal.do">유기 동물 입양</a></div>
	</div>
	
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

   <div class="collapse navbar-collapse  displaye" style="margin-right: 100px;">
    <ul class="navbar-nav">
    <c:choose>
        <c:when test="${empty result.email}">
            <li class="nav-itm mr-3"><a class="nav-link active b jua_nav" aria-current="page" href="${pageContext.request.contextPath}/login.do">로그인</a></li>
        </c:when>
        <c:otherwise>
            <li class="nav-itm mr-3 nav-link active b jua_nav">${result.email}</li> 
          
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px">
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="MyInfo.do?email=${result.email}">내정보</a></li>
                    <li><a class="dropdown-item" href="BookList.do?email=${result.email}">예약 내역</a></li>
                    <li><a class="dropdown-item" href="MyOrders.do?email=${result.email}">구매 내역</a></li>
                    <li><a class="dropdown-item" href="Cartmain.do?email=${result.email}">장바 구니</a></li>
                </ul>
            </li>
               <a class="nav-link active b jua_nav" aria-current="page" href="${pageContext.request.contextPath}/logout.do" onclick="showLogoutAlert()">로그아웃</a>
        </c:otherwise>
    </c:choose>
</ul>

</div>

</div> <!-- 1차 nav bar -->
	</nav>
<nav class="navbar navbar-expand-lg bg-body-tertiary2 nav_mt align-items-center"> 
<div class="container-fluid d-flex justify-content-end navbar2">
    <div class="display nav_mr">
        <a class="nav-link active b sejong_nav nav_mr" href="${pageContext.request.contextPath}/storeList.do">스토어</a>
        <a class="nav-link active b sejong_nav nav_mr" href="${pageContext.request.contextPath}/board.do">커뮤니티</a>
        <a class="nav-link active b sejong_nav nav_mr" href="${pageContext.request.contextPath}/Lovedog.do">유기동물 현황 </a>
       
    </div>
</div>
</nav>

	<!-- ---------------------------------------------------------------------- -->
		<div class="topm_main  carousel-inner">		
    <div class=" m-4 displayco " style="position: relative; height:110px">
		    
		    <div class="display">
		    <img class="search-image " src="./resources/pic/dogbar.png" alt="검색 이미지">
		    <img class="search-image2" src="./resources/pic/neko.png" alt="검색 이미지" >
		    </div>
		    
		    <form action="AllList.do" class="carousel-item  active card-img-overlay d-flex display" style="position: absolute; top: 0px;" role="search">
		        <input class="form-control" id="line" name="area" type="search" style="border: 3px solid #FFCD00;" placeholder="궁금한 내용을 검색하세요.">     
		        <button type="submit" style="height: 80px; width: 180px; font-size: 20px; font-weight: bold;" class="btn btn-dark">검색 하기</button>
		    </form>
		</div>
		</div>
	
	<!-- ---------------------------------------------------------------------- -->
	
	<div class="main-mr1 ">
		<div class="display"><h2 class="letter do_nav">  👨‍👩‍👧‍👦 ‍가족이 되어주세요🐾  </h2></div>
		<br>

		<div class="flip">
		<div class="text-center contents ">
			<div class="image-container">
				<a href="StrayAnimalDetail.do?asoo=1121"> <img style="width: 350px; height: 200px;" src="./resources/pic/maru.jpg" class="rounded" ></a>		
				<p class="image-text mt-2">[마포센터] 마루 (말티즈) </p>
			</div>
			
			<div class="image-container">
				<a href="StrayAnimalDetail.do?asoo=3381"><img style="width: 350px; height: 200px;" src="./resources/pic/potato.jpg" class="rounded" ></a>		
				<p class="image-text mt-2">[동대문센터]감자 (푸들) </p>
			</div>
			<div class="image-container">
				<a href="StrayAnimalDetail.do?asoo=3481"> <img style="width: 350px; height: 200px;" src="./resources/pic/tamama.jpg" class="rounded" ></a>		
				<p class="image-text mt-2">[마포센터]타마마 (샴) </p>
			</div>
			<div class="image-container">
				<a href="StrayAnimalDetail.do?asoo=3442"> <img style="width: 350px; height: 200px;" src="./resources/pic/rani.jpg" class="rounded" ></a>		
				<p class="image-text mt-2">[동대문센터]라니 (닥스훈트) </p>
			</div>
			
		</div>	
		
		</div>
		</div>
	
	<div class="main-mr ">
		<div>
			<div class="display"><h2 class="letter do_nav"> 🐶인기예약 서비스😻  </h2></div>
		</div>
		<br>

		<div class="text-center contents">
    			<div class="image-container mt-3">
     		    <a  href="${pageContext.request.contextPath}/detailhospital.do?hname=청평동물병원"> <img style="width: 350px; height: 200px;" src="./resources/hospic/H3.jpg" class="rounded"></a>
       			 <p class="image-text mt-2">[동물병원 예약] 청평동물병원</p>
   			 </div>

			
			<div class="image-container mt-3">
				 <a class=" subtitle_hospital" href="${pageContext.request.contextPath}/detailsalon.do?lsname=달이네애견미용실"><img style="width: 350px; height: 200px;" src="./resources/salpic/S003.jpg" class="rounded"></a>			
				<p class="image-text mt-2">[미용 예약] 달이네애견미용실 </p>
			</div>
			<div class="image-container mt-3">
				 <a class=" subtitle_hospital" href="${pageContext.request.contextPath}/detailhotel.do?htname=캣틀리에"><img style="width: 350px; height: 200px;" src="./resources/hotpic/HT001.jpg" class="rounded"></a>			
				<p class="image-text mt-2">[동물 호텔 예약] 캣틀리에</p>
			</div>
			<div class="image-container mt-3">
				  <a href="Taxi.do"> <img style="width: 350px; height: 200px;" src="./resources/pic/main_dog4.jpg" class="rounded"></a>	
				<p class="image-text mt-2">[ 택시 예약] 반려 동물 동반 택시 탑승 </p>
			</div>
			
		</div>
	</div>

	
	
		<!--======================= 커뮤니티 인기글 ===================================-->   
      <div class="main-mr ">
      <div class="display"><h2 class="letter do_nav"> 🔥커뮤니티 인기글🔥</h2></div>
      <br>
         <div class="display">
            <div class="card " style="width: 18rem; height:100%; position: relative; margin-right:22px;">
              <img src="./resources/boardpic/1.jpg" class="card-img-top " style="height:360px;">
              <div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">                 
                   <h1 class="card-title tway1">  </h1>
                   <p class="card-text tway1">  </p>
               </div>
              <div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
                   <a href="viewboard.do?bbsid=1" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
              </div>
            </div>
         
         
         <div class="card mr-2" style="width: 18rem; height:100%; position: relative; margin-right:22px;">
           <img src="./resources/boardpic/2.jpg" class="card-img-top " style="height:360px;">
           <div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">        
             <h1 class="card-title tway1">  </h1>
             <p class="card-text tway1">  </p>
             </div>
            <div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
                   <a href="viewboard.do?bbsid=2" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
           </div>
         </div>
   
         <div class="card" style="width: 18rem; height:100%; position: relative; margin-right:22px;">
           <img src="./resources/boardpic/3.jpg" class="card-img-top " style="height:360px;">
           <div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">        
             <h1 class="card-title tway1"></h1>
             <p class="card-text tway1"> </p>
             </div>
            <div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
                   <a href="viewboard.do?bbsid=341" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
           </div>
         </div>
         
         <div class="card shadow" style="width: 18rem; height:100%; position: relative; margin-right:22px;">
           <img src="./resources/boardpic/4.jpg" class="card-img-top " style="height:360px;">
           <div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">        
             <h1 class="card-title tway1"></h1>
             <p class="card-text tway1"></p>
             </div>
            <div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
                <a href="viewboard.do?bbsid=342" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
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
							<input class="menu-item" type="submit" value="호텔 & 유치원 예약하기" >
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
	<script>
    function showLogoutAlert() {
        // 사용자에게 안녕히가세요 알림을 표시합니다.
        alert("안녕히가세요!");

        // 이 링크를 클릭한 후에도 로그아웃 동작을 계속합니다.
        // 만약 로그아웃 후에 페이지를 다른 곳으로 이동하려면 여기에 추가적인 동작을 구현해야 합니다.
    }
    
</script>

  <script>
  function showImage() {
      var searchImages = document.querySelectorAll('.search-image, .search-image2');
      searchImages.forEach(function(searchImage) {
          searchImage.style.display = 'block';
          setTimeout(function() {
              searchImage.style.transform = 'translate(-70%, -100%)';
          }, 500); // 0.5초 후에 이미지가 위로 올라가는 애니메이션 시작
      });
  }

  function hideImage() {
      var searchImages = document.querySelectorAll('.search-image, .search-image2');
      searchImages.forEach(function(searchImage) {
          searchImage.style.transform = 'translate(-70%, 0)';
          setTimeout(function() {
              searchImage.style.display = 'none';
          }, 500); // 0.5초 후에 이미지가 사라지는 애니메이션 시작
      });
  }

  document.addEventListener('DOMContentLoaded', function() {
      showImage(); // 페이지 로드 시 이미지를 보이게 함
      setInterval(function() {
          showImage(); // 일정 시간마다 이미지를 보이게 함
          setTimeout(hideImage, 1500); // 일정 시간 후에 이미지를 사라지게 함
      }, 3000); // 3초 간격으로 반복
  });
</script>

</body>
</html>