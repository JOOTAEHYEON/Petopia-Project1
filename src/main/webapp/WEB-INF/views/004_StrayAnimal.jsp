

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
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/004_StrayAnimal.css">

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

	<main class="  topm_StoreList displaypop" style="height:4600px;">
	
	<div>
		<div class="title displays ">
		  <span class="title_s">사</span>
		  <span class="title_s">지</span>
		  <span class="title_s">말</span>
		  <span class="title_s">고</span>
		  <span class="title_s">입</span>
		  <span class="title_s">양</span>
		  <span class="title_s">하</span>
		  <span class="title_s">세</span>
		  <span class="title_s">요</span>
		  <span class="title_s">!</span>
		</div>
	</div>	

	
	<div class="displays selectbtn">
	 <select class="selectcate" id="acenter1" onchange="setSearch()" >
			    <option value=""> 지역  </option>
        		<option value="동대문센터">동대문센터</option>
        		<option value="마포 센터">마포 센터</option>
  				
			</select>	
			
		
				
	 <select class="selectcate" id="acate1"  onchange="setSearch()" >
			    <option value="">유기동물 </option>
			    <option value="DOG">DOG</option>
			    <option value="CAT">CAT</option>
			    <option value="기타">기타</option>
			</select>	
			
	 <select class="selectcate" id="akind1" onchange="setSearch()" >
			    <option value=""> 품종 </option>
			    <option value="믹스">믹스</option>
			    <option value="스피츠">스피츠</option>
			    <option value="웰시코기">웰시코기</option>
			    <option value="푸들">푸들</option>
			    <option value="샴">샴</option>
			    <option value="비숑프리제">비숑프리제</option>
			    <option value="코리안숏헤어">코리안숏헤어</option>
			    <option value="포메라니안">포메라니안</option>
			    <option value="닥스훈트">닥스훈트</option>
			    <option value="말티즈">말티즈</option>
	</select>		
	
			<form action="animalSelect.do" method="post">
			<input type="hidden" name="acenter" id="acenter" value="">
			<input type="hidden" name="acate" id="acate" value="">
			<input type="hidden" name="akind" id="akind" value="">
			 <button type="submit" style="height: 70px; width: 180px; font-size: 20px; font-weight: bold;" class=" btn btn-dark">검색 하기</button>
			</form>			
			 
	</div>
			 	<div class="row display  mt-4"> 
			         	 <c:choose>
			    <c:when test="${empty alist}">
			        <div class="alert alert-warning mt-5"  style="font-size:25px;"role="alert">조건을 만족하는 친구가 없습니다 🐶😻</div>
			    </c:when>
			    <c:otherwise>
			        <c:forEach var="alist" items="${alist}" varStatus="loopStatus">
			            <c:if test="${loopStatus.index % 4 == 0}">
			                <div class="row display mt-4">
			            </c:if>          
			            <a class="card cardsize_StoreList good" href="StrayAnimalDetail.do?asoo=${alist.asoo}">
			                <img src="http://${alist.picurl}" class="photo_StoreList card-img-top" alt="Thumbnail Image">
			                <div class="card-body">
			                    <p class="card-text">  
			                        <div class="displays"> 
			                            <div class="badge text-bg-warning" style="font-size:12px;">${alist.acate}</div> 
			                            <div class="badge text-bg-warning" style="font-size:12px; margin-left:4px;">${alist.akind}</div> 
			                            <div class="badge text-bg-warning" style="font-size:12px; margin-left:4px;">${alist.acenter}</div>        
			                        </div>                                                 
			                        <div class="title2_StoreList">이름: ${alist.aname}</div>                           
			                        <div style="font-size:16px;"> 입소 날짜: ${alist.aenter} </div>
			                        <div style="font-size:16px;"> 보호 센터: ${alist.acenter}</div>                           
			                    </p>
			                </div>
			            </a>
			            <c:if test="${(loopStatus.index + 1) % 4 == 0 or loopStatus.last}">
			                </div>
			            </c:if>
			        </c:forEach>
			    </c:otherwise>
			</c:choose>

       		 
   	</main>	
   		
   		
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
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script>

	var h1 = document.querySelector("h1");

	h1.addEventListener("input", function() {
	  this.setAttribute("data-heading", this.innerText);
	});
	</script>
	<script>
		function setSearch(){
		    // 선택된 옵션의 값을 가져와서 텍스트 입력란에 설정
		    var selectedOption = document.getElementById("acenter1").value;
		    document.getElementById("acenter").value = selectedOption;
		    var selectedOption2 = document.getElementById("acate1").value;
		    document.getElementById("acate").value = selectedOption2;
		    var selectedOption3 = document.getElementById("akind1").value;
		    document.getElementById("akind").value = selectedOption3;		  
		}		
		</script>
	<!-- ======================================================== -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"	crossorigin="anonymous"></script>
</body>
</html>