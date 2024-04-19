<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/004_AllList.css">

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

<main class="topm_StoreList displaypop" style="height:2500px;">

<!-- 강&고 --> 
<div class="row display   mt-4"> 
         	 	<!-- for문 --> 
         	 	<c:forEach var="store" items="${alist}" varStatus="loopStatus">
       		 	<c:if test="${loopStatus.index % 4 == 0}">
           			 <div class="row  display  mt-4">
       			 </c:if>
          		<a class="card cardsize_StoreList good" href="DetailPage.do?productID=${store.productID}">
         		  <img src="./resources/picStore/${store.productID}.jpg" class="photo_StoreList card-img-top">
          		  <div class="card-body">
                        <p class="card-text">
                            <div class="title2_StoreList">[${store.category}]</div>
                            <div style="font-size:16px;">${store.name}</div>
                            <div id="price" style="vertical-align: middle;">${store.price} 원</div>
                        </p>
                    </div>
        		</a>
        			 <c:if test="${(loopStatus.index + 1) % 4 == 0 or loopStatus.last}">
            </div>
       		</c:if>
   			</c:forEach> 
        		
			         <!-- 강아지 고양이 페이지 버튼 -->
			       <c:if test="${not empty alist}">
			    <!-- 버튼 페이징 부분 -->
			    <div class="pagination justify-content-center" style="margin-top: 30px;">
			        <button class="btn btn-outline-secondary" onclick="onPage('first')"> << </button>
			        <button class="btn btn-outline-secondary" onclick="onPage('prev')"> < </button>
			
			        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
			            <button class="btn btn-outline-secondary mx-1" onclick="onPage(${pageNumber})" value="${pageNumber}">${pageNumber}</button>
			        </c:forEach>
			        
			        <button class="btn btn-outline-secondary mx-2" onclick="onPage('next')"> > </button>
			        <button class="btn btn-outline-secondary" onclick="onPage('last')"> >> </button>
			
			        <input type="hidden" id="area" value="${area}">
			    </div>
			</c:if>
			
               <!-- 호텔  병원 -->
            <div class="row display  mt-4"> 
         	 	<!-- for문 --> 
         	 <c:forEach var="hotel" items="${alist2}" varStatus="loopStatus">
       		 	<c:if test="${loopStatus.index % 4 == 0}">
           			 <div class="row  display  mt-4">
       			 </c:if>		  
          		<a class="card cardsize_StoreList good" href="${pageContext.request.contextPath}/detailhotel.do?htname=${hotel.htname}">
         		  <img src="./resources/hotpic/${hotel.htsoo}.jpg"  class="photo_StoreList card-img-top">
          		  <div class="card-body">
                        <p class="card-text">
                            <div class="title2_StoreList">[동물 호텔]</div>
                            <div style="font-size:16px;">${hotel.htname}</div>
                            <div id="price" style="vertical-align: middle;"> ${hotel.htarea}|   | ${hotel.htname}</div>
                        </p>
                    </div>
        		</a>
        		 <c:if test="${(loopStatus.index + 1) % 4 == 0 or loopStatus.last}">
            </div>
       		</c:if>
   			</c:forEach>
		<!-- 호텔 페이징 -->
		
		  <c:if test="${not empty alist2}">
		<div class="pagination justify-content-center" style="margin-top: 30px;">
			   <button  class="btn btn-outline-secondary" onclick="onPage('first')"> << </button>
			      <button  class="btn btn-outline-secondary" onclick="onPage('prev')"> < </button>
			
			    <c:forEach begin="1" end="${totalPages2}" var="pageNumber">
			          <button class="btn btn-outline-secondary mx-1"onclick="onPage(${pageNumber2})" value="${pageNumber2}">${pageNumber2}</button>
			    </c:forEach>
			<button class="btn btn-outline-secondary mx-2" onclick="onPage('next')"> > </button>
			     <button class="btn btn-outline-secondary" onclick="onPage('last')"> >> </button>
			 
			   <input type="hidden" id="hotelArea" value="${area}">
			</div>
			</c:if>

		</div>
        
        
           <!-- 동물 병원 -->
            <div class="row display mt-4"> 
         	 	<!-- for문 --> 
         	<c:forEach var="hospital" items="${alist3}" varStatus="loopStatus">
       		 	<c:if test="${loopStatus.index % 4 == 0}">
           			 <div class="row  display  mt-4">
       			 </c:if>		  
          		<a class="card cardsize_StoreList good"  href="${pageContext.request.contextPath}/detailhospital.do?hname=${hospital.hname}">
         		  <img src="./resources/hospic/${hospital.hsoo}.jpg" class="photo_StoreList card-img-top">
          		  <div class="card-body">
                        <p class="card-text">
                            <div class="title2_StoreList"></div>
                            <div style="font-size:16px;">[동물병원 예약 서비스]  ${hospital.hname}</div>
                            <div id="price" style="vertical-align: middle;"> ${hospital.harea}|  ${hospital.htime} | ${hospital.hname} </div>
                        </p>
                    </div>
        		</a>
        		 <c:if test="${(loopStatus.index + 1) % 4 == 0 or loopStatus.last}">
            </div>
       		</c:if>
   			</c:forEach>

		<!-- 동물 병원 페이징 -->

		  <c:if test="${not empty alist3}">
		<div class="pagination justify-content-center" style="margin-top: 30px;">
			   <button  class="btn btn-outline-secondary" onclick="onPage('first')"> << </button>
			      <button  class="btn btn-outline-secondary" onclick="onPage('prev')"> < </button>
			
			    <c:forEach begin="1" end="${totalPages3}" var="pageNumber">
			          <button class="btn btn-outline-secondary mx-1"onclick="onPage(${pageNumber3})" value="${pageNumber3}">${pageNumber3}</button>
			    </c:forEach>
			<button class="btn btn-outline-secondary mx-2" onclick="onPage('next')"> > </button>
			     <button class="btn btn-outline-secondary" onclick="onPage('last')"> >> </button>
			 
			   <input type="hidden" id="hospitalArea" value="${area}">
			</div>
			</c:if>
		</div>
        
            
            
            <!-- 동물 미용실 -->
            <div class="row display  mt-4"> 
         	 	<!-- for문 --> 
         	 		<c:forEach var="salon" items="${alist4}" varStatus="loopStatus">
       		 	<c:if test="${loopStatus.index % 4 == 0}">
           			 <div class="row  display  mt-4">
       			 </c:if>		  
          		<a class="card cardsize_StoreList good" href="${pageContext.request.contextPath}/detailsalon.do?lsname=${salon.lsname}">
         		  <img src="./resources/hotpic/${salon.lssoo}.jpg"  class="photo_StoreList card-img-top">
          		  <div class="card-body">
                        <p class="card-text">
                            <div class="title2_StoreList">[동물 미용실]</div>
                            <div style="font-size:16px;">[동물 미용실 예약 서비스]  ${salon.lsname}</div>
                            <div id="price" style="vertical-align: middle;"> ${salon.lsarea}|  ${salon.lstime} | ${salon.lsname}</div>
                        </p>
                    </div>
        		</a>
        		 <c:if test="${(loopStatus.index + 1) % 4 == 0 or loopStatus.last}">
            </div>
       		</c:if>
   			</c:forEach>

		<!-- 동물 미용실 페이징 -->
	
		
		 <c:if test="${not empty alist4}">
		<div class="pagination justify-content-center" style="margin-top: 30px;">
			   <button  class="btn btn-outline-secondary" onclick="onPage('first')"> << </button>
			      <button  class="btn btn-outline-secondary" onclick="onPage('prev')"> < </button>
			
			    <c:forEach begin="1" end="${totalPages4}" var="pageNumber">
			          <button class="btn btn-outline-secondary mx-1"onclick="onPage(${pageNumber4})" value="${pageNumber4}">${pageNumber4}</button>
			    </c:forEach>
			<button class="btn btn-outline-secondary mx-2" onclick="onPage('next')"> > </button>
			     <button class="btn btn-outline-secondary" onclick="onPage('last')"> >> </button>
			 
			 <input type="hidden" id="salonArea" value="${area}">
			</div>
			</c:if>

		</div>
        


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

<script>
   function onPage(type) {
      const nowPage = ${pageNumber}; 
      var area = document.getElementById('area').value;
      var num = 1;
       
       switch (type) {
           case 'first': num = 1; break;
           case 'prev': num = nowPage === 1 ? nowPage : nowPage - 1; break;
           case 'next': num = nowPage === ${totalPages} ? nowPage : nowPage + 1; break;
           case 'last': num = ${totalPages}; break;
           default: num = type; break;
       } 
       /* location = 'AllList.do?pageNumber=' + num + '&area=' + encodeURIComponent(area); */
      location = 'AllList.do?pageNumber=' + num + '&pageNumber2=' + ${pageNumber2} + '&pageNumber3=' + ${pageNumber3} + '&pageNumber4=' + ${pageNumber4} + '&area=' +  encodeURIComponent(area);
   }
</script> 




<script>
function onHotelPage(type) {
	const nowPage = ${pageNumber2};
    var area = document.getElementById('hotelArea').value;
    var num = 1; 
    switch (type) {
         case 'first': num = 1; break;
         case 'prev': num = nowPage === 1 ? nowPage : nowPage - 1; break;
         case 'next': num = nowPage === ${totalPages2} ? nowPage : nowPage + 1; break;
         case 'last': num = ${totalPages2}; break;
         default: num = type; break;
     }    
     /* location = 'AllList.do?pageNumber2=' + num + '&area=' + encodeURIComponent(area); */
     location = 'AllList.do?pageNumber=' + ${pageNumber} + '&pageNumber2=' + num + '&pageNumber3=' + ${pageNumber3} + '&pageNumber4=' + ${pageNumber4} + '&area=' + encodeURIComponent(area);
 }
</script> 
<script>
function onHospitalPage(type) {
	const nowPage = ${pageNumber3};
    var area = document.getElementById('hospitalArea').value;
    var num = 1; 
    switch (type) {
         case 'first': num = 1; break;
         case 'prev': num = nowPage === 1 ? nowPage : nowPage - 1; break;
         case 'next': num = nowPage === ${totalPages3} ? nowPage : nowPage + 1; break;
         case 'last': num = ${totalPages3}; break;
         default: num = type; break;
     }    
     /* location = 'AllList.do?pageNumber3=' + num + '&area=' + encodeURIComponent(area); */
     location = 'AllList.do?pageNumber=' + ${pageNumber} + '&pageNumber2=' + ${pageNumber2} + '&pageNumber3=' + num + '&pageNumber4=' + ${pageNumber4} + '&area=' + encodeURIComponent(area);
 }
</script> 
<script>
function onSalonPage(type) {
	const nowPage = ${pageNumber4};
    var area = document.getElementById('salonArea').value;
    var num = 1; 
    switch (type) {
         case 'first': num = 1; break;
         case 'prev': num = nowPage === 1 ? nowPage : nowPage - 1; break;
         case 'next': num = nowPage === ${totalPages4} ? nowPage : nowPage + 1; break;
         case 'last': num = ${totalPages4}; break;
         default: num = type; break;
     }    
     /* location = 'AllList.do?pageNumber4=' + num + '&area=' + encodeURIComponent(area); */
     location = 'AllList.do?pageNumber=' + ${pageNumber} + '&pageNumber2=' + ${pageNumber2} + '&pageNumber3=' + ${pageNumber3} + '&pageNumber4=' + num + '&area=' + encodeURIComponent(area);
 }
</script> 
 
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<!-- ======================================================== -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"	crossorigin="anonymous"></script>
</body>
</html>