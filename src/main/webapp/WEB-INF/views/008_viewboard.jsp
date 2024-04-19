<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
 <head>
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>

<!-- 게시글 삭제시 alert창 -->

 <script>
        function deleteConfirmation() {
            if (confirm("게시글을 삭제하시겠습니까?")) {
            	window.location.href = "deleteBoard.do?bbsid=${bto.bbsid}";
               /*  window.location.href = "deleteBoard.do?bbsid=${bto.bbsid}"; */
            }
        }

        function deleteError() {
            alert("삭제에 실패했습니다.");
        }

        // 삭제 성공 시 메인 페이지로 이동하는 함수
        function deleteSuccess() {
            alert("삭제가 성공했습니다.");
            window.location.href = "008_board.jsp";
        }
</script>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- =================================================================== --><!-- =================================================================== -->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/swiper.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/008_viewboard.css">


</head>

<!-- =========================  header   ====================================== --><!-- =================================================================== -->
<body>
<c:choose>
    <c:when test="${empty result.email}">
        <!-- result.email이 비어있을 때 -->
        <script>
            // JavaScript를 사용하여 alert 창을 띄우고 login.do로 리다이렉트합니다.
            alert("로그인 후 이용 가능합니다.");
            window.location.href = "${pageContext.request.contextPath}/login.do";
        </script>
    </c:when>
    <c:otherwise>
        <!-- result.email이 비어있지 않을 때 -->
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

    </c:otherwise>
</c:choose> 

<!-- ========================= 상단 스와이퍼 ====================================  -->
<div class="displayco ">
<div class="topm_viewboard ">
  <div class="display  ">
   <div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner photo_board2">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/resources/pic/dogexample.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item photo_board2">
      <img src="${pageContext.request.contextPath}/resources/pic/dogexample2.jpg"class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item photo_board2">
      <img src="${pageContext.request.contextPath}/resources/pic/dogexample3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
  </div>
  
 
<!--================================ 게시글 상세 조회  ====================================--> 
 
 <!-- form -->
 
	<div class=" secondm_viewboard   displaycos ">
	<div class="displayb ">
	
	<div class="thirddm_viewboard  displays" >
		<div class=" do_nav " style="width:130px;">  <img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px"> 카테고리  </div>
			<div class=" displays"  id="catebtn">
				  <input class="btn_board" type="button" value= "${bto.bbscategory}" >&nbsp;&nbsp;&nbsp;
				  		
				  <!-- 견종 이미지 -->
				  <div style="width:150px; margin-top:10px"><img class="photo_board" src="./resources/dogpic/${bto.bbsdog}.png" width="30px" height="30px" alt="${bto.bbsdog}"> ${bto.bbsdog}</div>	
				 
				  <!--  <div style="width:260px;"><img  class="photo_viewboard"src="./resources/dogpic/golden.png" alt="골든리트리버">골든리트리버</div>	 -->			
			</div>			
	</div>
	
	<!-- 게시글 삭제 수정 버튼 -->
	<div class="displaye  box6_viewwrite ">		
		    <!-- 게시글 수정 버튼 -->
			<a href="boardrewrite.do?bbsid=${bto.bbsid}"  class="jua_nav btn3_viewdwrite"> 게시글 수정 하기</a> 			
			<!-- 게시글 삭제 버튼 -->
			 <a href = "deleteBoard.do?bbsid=${bto.bbsid}" class="btn3_viewdwrite jua_nav"> 게시글 삭제 하기 </a>		
	</div>
	
	</div>
	</div>
	
	<hr style="width:90%;">
	
	<div class="secondm_viewboard  displaycos  ">
		<div class="displayb box4_viewwrite">
		 <div class="text3_viewdwrite do_nav ">  
		 <img src="./resources/pic/mypage.png" width="30px" height="30px"> 글쓴이 : <span class="text2_viewdwrite"> ${bto.userid} </span>  </div>
		 <div class="text2_viewdwrite text_comment " style="width:193px; white-space: nowrap; overflow:hidden;" > 작성 시간:  ${bto.bbsdate}</div>		
		</div>
			
			<div class="displaycos  box3_viewwrite" >
				
				<input type="text" class="box_viewwrite" value="${bto.bbstitle}" readonly>
				<input type="text" class="box2_viewwrite" value="${bto.bbscontent}" readonly>				
			</div>		
			
			<!--첨부 이미지 -->
			<div class="text3_viewdwrite do_nav">  
			<img src="./resources/pic/mypage.png" width="30px" height="30px"> 이미지:  
			<img src= "/display.do?filename=${bto.bbsavailable}" style="width: 300px;heith: 300px;"> 
			</div>
		</div>
	
	<!--============================= 댓글 ===============================-->
	
		 
	<!-- ============ 댓글목록 ================ -->	 
	 <hr>
	 
 		<div class="displaycos  thirddm_viewboard   box4_viewwrite">
 			
 		 <c:forEach var="reply" items="${replyList}">	
			<div class="thirddm_viewboard do_nav ">  
			<img src="${pageContext.request.contextPath}/resources/pic/mypage.png" width="30px" height="30px"> 🐶의견  </div>
			<div class=" thirddm_viewboard displays ">
			<div class="">
			<div class="sejong_nav  " style="width:260px; margin-top:10px;"> 작성자: ${reply.rpywriter} </div>
			<div class="sejong_nav  " style="width:198px;margin-top:10px; white-space: nowrap; overflow:hidden;">작성 시간: ${reply.rpydate}</div>
			</div>
			<input type="text" class="box5_viewwrite" value="${reply.rpycontent}" readonly >
		
			</div>
		  </c:forEach>
		</div>
		 
		 
	<!-- ============= 댓글 작성  ===============-->	
	<hr>
	
	
 		<div class="displaycos  thirddm_viewboard   box4_viewwrite">	
 		<form action = "writeReply.do"  method="post">
			<div class="thirddm_viewboard do_nav"> ✏️의견 남기기  </div>
			
			<div class="displays">
			<input type="hidden" name="bbsid" value="${bto.bbsid}" />
			<input type="hidden" name="rpywriter" class="box_viewwrite"  placeholder="작성자 이름을 입력하세요" />
			<input type="text" name="rpycontent" class="box_viewwrite" placeholder=" * 따뜻한 말을 남겨주세요" >
			<!-- <form class="displays"> -->
			<button type="submit" class="btn3_boardwrite"> 댓글 등록 </button>
		
			</div>
  </form>	
	</div>
		</div>
			</div>

  
 <!------------------ footer ------------------------------------------------------------------ -->
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

<!-- ========================================== -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!— ========================================== —>
 <!— Swiper JS —>
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  <!— Initialize Swiper —>
  <script>
    var swiper = new Swiper(".mySwiper", {
      pagination: {
        el: ".swiper-pagination",
      },
    });
  </script>

</body>

</html>