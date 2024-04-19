
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ page import="java.text.NumberFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/004_Hospital.css">

<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>

</head>
<!-- ---------------------------------------------------------------------- -->
<body>
	<%
   response.setHeader("pragma", "No-cache");  
   response.setHeader("Cache-Control", "no-cache");  
   response.addHeader("Cache-Control", "no-store");   
   response.setDateHeader("Expires", 1L);              
    request.setCharacterEncoding("utf-8");	
%>
	<!-- ======================================================= -->
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

	<div class="topm_hospital " style="height:2700px;">
	
		 <div class="do_nav title_hospital">
		 	<img  class="photo_hospital" src="./resources/pic/Hospital_img.png">동물병원 예약
		 </div>
		 	
		 <div class="displayco mt-4 " >
		<c:forEach var="imsi" items="${hosalist}">	
		<div class="displays box_hospital m-3 ">				
		 <a  href="${pageContext.request.contextPath}/detailhospital.do?hname=${imsi.hname}">
			<img class="photo_hospital2"  src="./resources/hospic/${imsi.hsoo}.jpg" >
		</a>
		
		<div class="displayc" style="margin-left:30px;">
	
			<div class="displays">	

				 <div class="box2_hospital">${imsi.hhuemoo}</div>
				 <div class="box2_hospital">${imsi.haddress2}</div>
			 </div>	
			 <a class=" subtitle_hospital"  href="${pageContext.request.contextPath}/detailhospital.do?hname=${imsi.hname}" style="font-weight:bold;">
			 		[동물병원 예약 서비스]  ${imsi.hname}</a>
			 <div class="text_hospital">  ${imsi.harea}|  ${imsi.htime} | ${imsi.hname} </div>			  
			  	<img class="photo_hospital3"  src="./resources/pic/005_star.png">(4.5)
			  <div class="text2_hospital"> 펫토피아 커뮤니티 인기 동물 병원 🔥</div>	
			</div>		
			<hr>
		</div>
		  </c:forEach>
			
			  <div class="pagination justify-content-center" style="margin-top: 30px;">
	               <button  class="btn btn-outline-secondary" onclick="onPage('first')"> << </button>
             <button  class="btn btn-outline-secondary mx-2 onclick="onPage('prev')"> < </button>
         
             <c:forEach begin="${startPage}" end="${endPage}" var="pageNumber">
                 <button class="btn btn-outline-secondary mx-1" onclick="onPage(${pageNumber})" value="${pageNumber}">${pageNumber}</button>
             </c:forEach>
         
               <button class="btn btn-outline-secondary mx-2"  onclick="onPage('next')"> > </button>
               <button class="btn btn-outline-secondary"  onclick="onPage('last')"> >> </button>
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
	<script>
   // 페이지 로드 시 실행되는 함수
   window.onload = function() {
      const nowPage = ${pageNumber};
      var num = 1;
      
      // 이전에 active 클래스를 가진 버튼에서 클래스 제거
      var activeBtn = document.querySelector('.pagination .btn.active');
      if (activeBtn) {
          activeBtn.classList.remove('active');
      }
      
      // 현재 페이지에 해당하는 버튼에 active 클래스 추가
      var currentPageBtn = document.querySelector('.pagination .btn[value="' + nowPage + '"]');
      if (currentPageBtn) {
          currentPageBtn.classList.add('active');
      }
   };
   
   function onPage(type) {
      const nowPage = ${pageNumber}; 
      var num = 1;
      
      // 이전에 active 클래스를 가진 버튼에서 클래스 제거
      var activeBtn = document.querySelector('.pagination .btn.active');
      if (activeBtn) {
          activeBtn.classList.remove('active');
      }
      
      switch (type) {
          case 'first': num = 1; break;
          case 'prev': num = nowPage === 1 ? nowPage : nowPage - 1; break;
          case 'next': num = nowPage === ${totalPages} ? nowPage : nowPage + 1; break;
          case 'last': num = ${totalPages}; break;
          default: num = type; break;
      }    
      
      // 클릭된 버튼에 active 클래스 추가
      var clickedBtn = document.querySelector('.pagination .btn[value="' + num + '"]');
      if (clickedBtn) {
          clickedBtn.classList.add('active');
      }
         
	       location = 'hospital.do?pageNumber=' + num;
	   }
</script>   
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<!-- ======================================================== -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"	crossorigin="anonymous"></script>
</body>
</html>