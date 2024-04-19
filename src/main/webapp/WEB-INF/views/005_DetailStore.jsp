
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"   rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"   crossorigin="anonymous">
<link rel="stylesheet"   href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/005_DetailStore.css">
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
   <div class="topm_Details ">
      <div class="  displays innertop_Details">
         <div class="displaycos ">
            <div class="innerbox_Details">productID:${StoreVO.productID}</div>
            <div class=""><img src="./resources/picStore/${StoreVO.productID}.jpg" class="img-fluid img_Details"></div>
         </div>
         <div class="innerbox3_Details col-5 ">
            <div class="displays">
                <h5><span class="badge text-bg-secondary "> 당일 배송 </span></h5>
                <h5><span class="badge text-bg-secondary"> 강아지 </span></h5>
                <h5><span class="badge text-bg-secondary"> HOT </span></h5>
            </div>    
               <hr>
         <div class="boxtop text_Details">[${StoreVO.category}]${StoreVO.name} </div>           
          <div class="text_Details sejong_nav" style="margin-top:20px">상품 가격 : <span class="text_Details">${StoreVO.price}원</span></div>
            <div class="displays " style="width:600px;" >                  
               <div class="detailbox2_Details">                                 
                  <div class="text2_Details sejong_nav">배송비 : <span  class="text3_Details">${StoreVO.shippingFee}원</span></div>   
                  <div class="text2_Details sejong_nav" > 제조사 :  <span class="text3_Details">${StoreVO.seller}</span></div>
            </div>         
               <div  class=" detailbox_Details ">   
                   <div class=" displays">
                  <div class="text2_Details sejong_nav"> 수량: </div>
                    <input type="button" value="-" class="minus button" onclick="decrement()">
                    <input type="number" id="quantityInput" step="1" min="1" max="99" name="soo" value="1" class="text4_Details input-text quantity text" size="6" pattern="[0-9]*" inputmode="numeric" onchange="updateQuantity()">
                    <input type="button" value="+" class="plus button" onclick="increment()">
                    </div>
                  
                  <div class=" displays">
                  <div class="text2_Details sejong_nav" style="width:60px;">옵션: </div>                     
                  <select class="form-select form-select-sm"  id="option1" style="width:90%" aria-label="Small select exampl" onchange="updateOption()">          
                       <option selected>옵션 사항을 선택해주세요.</option>
                       <option value="${StoreVO.option1}">${StoreVO.option1}</option>
                       <option value="${StoreVO.option2}">${StoreVO.option2}</option>
                       <option value="랜덤">랜덤</option>
                  </select>
                  </div>
                   
               </div>
            
            </div>
               <div class=" displaye  detailbox3_Details">                  
                     <form method="post" action="Cart.do">
                      <input type="hidden" id="email" name="email" value="${result.email}">
                      <input type="hidden" id="name" name="name" value="${StoreVO.name}">
                      <input type="hidden" id="price" name="price" value="${StoreVO.price}">                  
                     <input type="hidden" id="option3" name="option3" value="">
                     <input type="hidden" id="priceCnt" name="priceCnt" value="1"> 
                     <input type="submit" id="Button" class="btn btn-dark btnbox_Details" value="장바구니" >
                     </form>
                     
                     
                     <form name="form2" id="form2" method="post" action="Orderconfirm.do" onsubmit="return validateForm()">
                          <input type="hidden" id="productID" name="productID" value="${StoreVO.productID}">                           
                          <input type="hidden" id="category" name="category" value="${StoreVO.category}">
                          <input type="hidden" id="name" name="name" value="${StoreVO.name}">
                          <input type="hidden" id="price" name="price" value="${StoreVO.price}">
                          <input type="hidden" id="shippingFee" name="shippingFee" value="${StoreVO.shippingFee}">
                          <input type="hidden" id="option" name="option" value="">                  
                         <input type="hidden" id="quantity" name="quantity" value="1"> 
                        <input type="submit" id="purchaseButton" class="btn btn-dark btnbox_Details" value="구매하기">
                     </form>
                  </div>
         </div>               
         </div>
      </div>
      
      
      <!-- ==============================이미지============================================================= -->
  <!--  <br class="br mt-4">
      <div class=" row swiper mySwiper lowm_Details ">
         <div class="m-4 text_Details do_nav"> 함께 보면 좋은상품</div>
         <div class="swiper-wrapper" style=" position: relative;" >
            
            <div class="swiper-slide display" style="width: 360px;">
               <a href=""><img style="width: 360px;height:250px;" src="./resources/pic/dog1.jpg"></a>
            </div>                        
            <div class="swiper-slide  display" style="width: 360px; margin-left:5px;">
               <a href=""><img style="width: 360px;height:250px;" src="./resources/pic/swiperdog.jpg"></a>
            </div>            
            <div class="swiper-slide  display" style="width: 360px; margin-left:5px;">
               <a href=""><img style="width: 360px;height:250px;" src="./resources/pic/swiperdog2.jpg"></a>
            </div>            
            <div class="swiper-slide  display" style="width: 360px; margin-left:5px;">
               <a href=""><img style="width: 360px;height:250px;" src="./resources/pic/main_cat1.jpg"></a>
            </div>            
            <div class="swiper-slide  display" style="width: 360px; margin-left:5px;">
             <a href=""><img style="width: 360px;height:250px;" src="./resources/pic/main_cat2.jpg"></a>    </div>            
            <div class="swiper-slide  display" style="width: 360px;margin-left:5px;">
               <a href=""><img style="width: 360px;height:250px;" src="./resources/pic/main_cat3.jpg"></a>
            </div>
            </div>
         <div class="swiper-pagination"></div>
      </div> -->
   <br class="br mt-4">   
   <div class=" displaycos lowm_Details">
   <div class="m-4 text_Details do_nav"> 🔎 상세 보기</div>
   <img src="./resources/picStore/Detail.png">
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

<!-- ======================================================== -->
 <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/006_DetailPage.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"   integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<script>
function updateOption() {
    // 선택된 옵션의 값을 가져와서 텍스트 입력란에 설정
    var selectedOption = document.getElementById("option1").value;
    document.getElementById("option").value = selectedOption;
     document.getElementById("option3").value = selectedOption;
}

function increment() {
    var quantityInput = document.getElementById("quantityInput");
    var quantity = parseInt(quantityInput.value);
    if (quantity < 99) {
        quantityInput.value = quantity + 1;
        document.getElementById("quantity").value = quantityInput.value;
        document.getElementById("priceCnt").value = quantityInput.value;
    }
}

function decrement() {
    var quantityInput = document.getElementById("quantityInput");
    var quantity = parseInt(quantityInput.value);
    if (quantity > 1) {
        quantityInput.value = quantity - 1;
        document.getElementById("quantity").value = quantityInput.value;
        document.getElementById("priceCnt").value = quantityInput.value;
    }
} 

function validateForm() {
    var option = document.getElementById("option").value.trim();

    if (option !== "랜덤" && option !== "소프트" && option !== "건식") {
        alert("옵션을 선택해주세요.");
        return false; // 폼 제출을 막음
    }
    return true; // 폼 제출을 허용
}

</script>
</body>
</html>