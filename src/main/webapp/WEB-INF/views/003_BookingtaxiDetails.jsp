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
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/003_BookingDetails.css">
 
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>
</head>
<body>
   <!-- ====================================================== -->
<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");    
	response.setDateHeader("Expires", 1L);              
	request.setCharacterEncoding("utf-8");
	String sid =(String)session.getAttribute("sid");%>
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

	<div class="topm_OrderDetails displaypop  " >
	<div  class="jua_nav Title_orderDetails ">📝  Booking Details</div>	
	
	 <div class="displayco ">
	 <div class="displaycos">
	 	<div class=" textcolor_orderDetails sejong_nav"> 주문 번호 : ${TaxiVO.random } </div>	
	 	<hr class="line_orderDetails">
	 </div>	
	<div class="displayc box_OrderDetails ">
	<div class=" displayb box_OrderDetails2 ">	
		  <div class="textcolor_orderDetails sejong_nav" style="color:gray;"> 주문자 : ${TaxiVO.tname}</div>		 
	 	<form action="taxidelete.do" class="mr-4" style="margin-right:20px;">
	 	    <input type="hidden" class="conDbox"  name ="random" value="${TaxiVO.random}">
	 	       <input type="hidden" class="conDbox"  name ="email" value="${result.email}">
	 		<input type="submit" class="box_OrderDetails3" value="예약 취소">
	 	</form>
         </div>	 
	  <hr class="line2_orderDetails">
	  <div class="displays margin_OrderDetails " >
	  
	  <div class=" displayb " style="width:100%;" id="orderlist">	  	 
	  <div class="margin2_OrderDetails ">
	    <div class="text_orderDetails do_nav"> <span style="font-weight:bold;"></span>${TaxiVO.tname } 님의 택시예약 내역 </div>
		    <div class="displays">
		    	<div style="margin-bottom:8px; font-weight:bold;"> 예약자 전화번호 : </div> <div style="margin-left:9px;">${TaxiVO.ttel } </div>
		    </div>
		    <div class="displays">
		    	<div style="margin-bottom:8px; font-weight:bold;"> 탑승 반려동물 수: </div> <div style="margin-left:9px;">${TaxiVO. tsoo } </div>
		    </div>
		    <div class="displays">
		    	<div style="margin-bottom:8px; font-weight:bold;"> 반려동물 종 : </div> <div style="margin-left:9px;">${TaxiVO. tjong } </div>
		    </div>
		     <div class="displays">
		    	<div style="margin-bottom:8px; font-weight:bold;">탑승일시 : </div> <div style="margin-left:9px;">${TaxiVO. tdate } </div>
		    </div>
		    <div class="displays">
		    	<div style="margin-bottom:8px; font-weight:bold;">적재 물품 : </div> <div style="margin-left:9px;">${TaxiVO. tthing } </div>
		    </div>
		    <div class="displays">
		    	<div style="margin-bottom:8px; font-weight:bold;">요청 사항: </div> <div style="margin-left:9px;">${TaxiVO.tcon }  </div>
		    </div>
	   </div>
	   <div>
	   <img src="./resources/pic/main_dog4.jpg" class="photo_orderdetails">	  
	   </div>  
	   </div>    
	  </div>
	   <hr class="line2_orderDetails">

	
	 </div>
	  <div>
	   <div class="mt-3 displaye" style="width:1000px; padding-right:100px;"> 
		<a href="BookList.do?email=${result.email}" class="btn btn-dark"  >돌아가기</a>
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
	<!-- ---------------------------------------------------------------------- -->

	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 	crossorigin="anonymous"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>  


</body>
</html>