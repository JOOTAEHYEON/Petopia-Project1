<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/007_Orderconfirm.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>   
 
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>
</head>
<body>
   <!-- ====================================================== -->
<%   
	response.setDateHeader("Expires", 1L);              
	request.setCharacterEncoding("utf-8");
  	
	
	%>
	
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


	<!-- ---------------------------------------------------------------------- -->

	<!-- ---------------------------------------------------------------------- -->
	<div class=" row topm_Orderconfirm displayco ">	
		<div class="col-9 " >
				<div class="title_Orderconfirm jua_nav "> 🚨 구매 전 필수 확인   </div>	
				<div class="mt-3 ">							
					<div class="subtitle_Orderconfirm do_nav displays"> <img src="./resources/pic/mypage.png" width="30px" height="30px">  결제예정 상품	
					<div class="textmargin_Orderconfirm">  &nbsp;&nbsp; &nbsp;&nbsp; * 수량 및 상품 가격을 다시 확인 부탁드립니다🙏🏻</div>
					</div>			
				
		     	  
			  <div class=" displayb " style="width:800px;">	  	 
	 			 <div class="margin2_Orderconfirm ">
	    		<div class="sejong_nav subtitle_Orderconfirm" > <span style="font-weight:bold;">[${ConrimVO.category}]</span> ${ConrimVO.name}</div>
	    		<div style="margin-bottom:8px;"> 구매 수량 : ${ConrimVO.quantity}개 </div>
	  	 		<div style="margin-bottom:8px;">상품 가격 : ${ConrimVO.price}원 </div>	  	
	  	 		<div style="margin-bottom:8px;">배송비 : ${ConrimVO.shippingFee}원 </div>	  
	  	  		<div style="margin-bottom:8px;"> 선택 옵션 : ${ConrimVO.option} </div>	
	  	  		<div style="margin-bottom:8px;">총 상품 : ${totalprice}원 </div>	
	  			 </div>
	  		 <div>
	   <img src="./resources/picStore/${ConrimVO.productID}.jpg" class="photo_Orderconfirm">	  
	   </div>  
	   </div> 
	   <hr>
	   
   
		
		
	<div class="mt-5">
	<div class="subtitle_Orderconfirm do_nav"> <img src="./resources/pic/mypage.png" width="30px" height="30px">  보유 포인트</div>
	  <hr>
	<div>사용 가능 마일리지: &nbsp;<input class="box_orderconfirm" type="text" readonly value=1,000></div>
	<div>사용 희망 마일리지: &nbsp;&nbsp;<input class="box_orderconfirm2" id="mileage" type="text" placeholder="사용을 원하는 마일리지를 써주세요" value=""></div>
	</div>
	
	 
	  
	  <div class="subtitle_Orderconfirm do_nav displays"> <img src="./resources/pic/mypage.png" width="30px" height="30px">  기본 정보
	  	<div class="textmargin_Orderconfirm">  &nbsp;&nbsp; &nbsp;&nbsp; *배송요청 정보 </div>
	  	
	  </div>
	   <hr>
	 
	
	<div class="mb-4 displays ">
	<div class="box_orderconfirm4 ">
        <div class="displays"><div class="box_orderconfirm6"> 받는 분: </div>  <input id="buyer_name1" class="box_orderconfirm2" type="text" placeholder="수령인 성함을 써주세요" value="" required oninput="displayOrderInfo()"> </div>       
        <div class="displays"><div class="box_orderconfirm6"> 연락처: </div>  <input id="phone1" class="box_orderconfirm2" type="text" placeholder="수령인 전화번호" value="" oninput="displayOrderInfo()"></div>       
        <div class="displays"><div class="box_orderconfirm6"> 공동현관 비밀번호 :  </div>  <input class="box_orderconfirm2" type="text" placeholder="예:종 1234" value="" oninput="displayOrderInfo()"></div>   
	 </div>
	 
   <div class="box_orderconfirm4 ">
       <div class="displays"><div class="box_orderconfirm6"> 배송지  </div> 
        <input class="box_orderconfirm5" type="text" id="sample6_postcode" name="adp" placeholder="우편번호" required oninput="displayOrderInfo()">
        <input class="btn btn-warning text-dark btn_orderconfirm" type="button" onclick="sample6_execDaumPostcode()" value="우편번호🔎"><br>
    </div>
      <div class="displays "><div class="box_orderconfirm6">  </div> 
        <input class="box_orderconfirm2" id="sample6_address" type="text" name="ad" placeholder="주소" required oninput="displayOrderInfo()">
    </div>
       <div class="displays"><div class="box_orderconfirm6">  </div> 
     <input class="box_orderconfirm2" id="sample6_detailAddress" type="text" name="ad1" placeholder="상세주소" oninput="displayOrderInfo()">
     <input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
    </div>
    </div>
</div>

	</div>	
		
	<div class=" mt-4 ">
	<div class="subtitle_Orderconfirm do_nav"> <img src="./resources/pic/mypage.png" width="30px" height="30px">  배송 요청 사항
	
	</div>
	<hr>
	<textarea  class="requestbox_Orderconfirm" placeholder="요청사항이 있으면 기재해주세요"></textarea>
	<div style="color:gray">* 해당 내용은 택배사로 전달 될 예정입니다. </div>
	</div>
	
	<div class="subtitle_Orderconfirm do_nav " style="text-align:left; ">  <img src="./resources/pic/mypage.png" width="30px" height="30px">  결제 정보</div>
	<hr>
	
	<div class="displays ">
		<div style="width:800px;" class=" displays  paybox_orderconfirm ">
			<div class="m-4">
			<div style="height:30px;"> 결제 아이디 :<span id ="email">${result.email} </span></div>	
			<div style="height:30px;" > 주문 상품  : ${ConrimVO.category} <span id ="name">${ConrimVO.name}</span></div>	
		 	<div style="height:30px;" > 선택 옵션  :<span id ="option">${ConrimVO.option}</span></div>	
			<div style="height:30px;" > 주문 수량: <span id ="price">${ConrimVO.quantity}</span>개 </div> 
			<div style="height:30px;" > 배송비: ${ConrimVO.shippingFee}원</div> 
			<div style="height:30px;" > 주문 금액  : <span>${totalprice}</span> 원 </div>
			</div> 
			<div class="m-4">
			<div style="height:30px;"> 받는 분: <span id="buyer_name"></span></div>	
			<div style=" height:30px;" > 사용 포인트 : <span id="realMileage"></span> 원  </div>
			<div style=" height:30px;" > 결제 금액 : <span id="realtotprice"></span> 원 </div>
			<div style="height:30px;" > 연락처 : <span id="phone"></span> </div>
			<div style="height:30px;" > 배송지 : <span id="address"></span> </div>
			<input type="hidden" id="productID"value="${ConrimVO.productID }">
			
			</div>
		</div>
		<div class="displaycos">

			<button class="btn btn-warning paytext_orderconfirm" style="width:250px; border:1px solid blue; height:100px; background-image: url('./resources/pic/tosspay.jpeg'); background-size: 100% 100%;" onclick="requestPay1()"></button>
			<button class="btn btn-warning paytext_orderconfirm" style="width:250px; border:none; height:100px; background-image: url('./resources/pic/kakaopay.jpeg'); background-size: 100% 100%;" onclick="requestPay()"></button>
			
		
		
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
	<!-- ---------------------------------------------------------------------- -->
	

	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 	crossorigin="anonymous"></script>
	<script>
	 function sample6_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                  
                     var addr = ''; // 주소 변수
                     var extraAddr =
                    	 ''; // 참고항목 변수

                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                     }

                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                     if (data.userSelectedType === 'R') {
                     
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                           extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                     } else {
                        document.getElementById("sample6_extraAddress").value = '';
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('sample6_postcode').value = data.zonecode;
                     document.getElementById("sample6_address").value = addr;
                     // 커서를 상세주소 필드로 이동한다.
                     document.getElementById("sample6_detailAddress")
                           .focus();
                  }
               }).open();
      }
 
</script>
<script>
    function displayOrderInfo() {
   
    var buyerName = document.getElementById('buyer_name1').value; //사는사람 
    document.getElementById('buyer_name').innerText = buyerName;
    var phone = document.getElementById('phone1').value;//사는사람전번
    document.getElementById('phone').innerText = phone;

    // 배송지 정보 가져오기
    var postcode = document.getElementById('sample6_postcode').value;
    var address = document.getElementById('sample6_address').value;
    var detailAddress = document.getElementById('sample6_detailAddress').value;
    var orderInfo =  postcode + " " + address + " " + detailAddress;  //사는 사람 주소 
    document.getElementById('address').innerText = orderInfo; 
 
}
    
    
   function checkM() {
    var userMileage = document.getElementById('mileage').value; //마일리지 
    var availableMileage = 1000; // 사용 가능한 마일리지;
    var totprice = ${totalprice}; // 총;
    
    // 사용자 마일리지와 사용 가능 마일리지를 숫자로 변환합니다.
    var userMileageNum = parseInt(userMileage);
    var availableMileageNum = parseInt(availableMileage);

    // 사용자 마일리지가 사용 가능 마일리지보다 큰지 확인합니다.
    if (userMileageNum > availableMileageNum) {
        alert('사용 희망 마일리지는 현재 사용 가능한 마일리지보다 작아야 합니다.');
        document.getElementById('mileage').value = ""; // 입력 필드를 비웁니다.
    } else {
        // 사용자 마일리지가 유효하면 결과를 표시합니다.
        document.getElementById('realMileage').innerText = userMileageNum;

        // 총 가격에서 사용자 마일리지를 차감하여 결과적인 총 가격을 계산합니다.
        var realtotprice = totprice - userMileageNum;      
        document.getElementById('realtotprice').innerText = realtotprice;
    }
}

// 입력 필드에 텍스트가 입력될 때마다 checkM 함수를 호출합니다.
document.getElementById('mileage').addEventListener('input', checkM);
</script> 

 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
function requestPay() {
	var totalAmount = document.getElementById('realtotprice').innerText; //1총비용		 
	var buyerName = document.getElementById('buyer_name').innerText;  //2사는 사람 이름
	var price =  document.getElementById('price').innerText;  // 3선택된 상품 수량
	var point = document.getElementById('realMileage').innerText; // 4선택된 포인트		 
	var phone = document.getElementById('phone').innerText;//  5사는 핸드폰
	var email = document.getElementById('email').innerText; //6이메일 
	var orderInfo = document.getElementById('address').innerText; //7사는 사람 주소 		    
	var name =document.getElementById('name').innerText ;//8
	var current_time = new Date();

	var year = current_time.getFullYear();
	var month = ("0" + (current_time.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더하고, 두 자리 숫자로 만듭니다.
	var day = ("0" + current_time.getDate()).slice(-2); // 일을 두 자리 숫자로 만듭니다.

	var paydate = year + "-" + month + "-" + day;
	console.log("Current time: " + paydate);
	
	  
	var IMP = window.IMP;
	IMP.init('imp18258351') // 예: 'imp00000000a'
	
	IMP.request_pay({
		pg : 'kakaopay',
		pay_method : "card",
		merchant_uid : 'merchant_uid' + new Date().getTime(),	
		name : name,
		amount : totalAmount,
		buyer_email : email,
		buyer_name : buyerName,
		buyer_tel : phone,
		buyer_addr : orderInfo,
		buyer_postcode : "123-456", //주문자 우편번호		
	},
	
	function(rsp) {//콜백 함수
	
		if (rsp.success) {
	
			// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
			// jQuery로 HTTP 요청
	
			console.log(rsp);	
			alert('결제에 성공하였습니다');
	
			
			jQuery.ajax({
			url : "http://localhost:8080/payInsert.do",
			//url : "payInsert.do",
	
				method : "POST",
	

				data : {
					imp_uid : rsp.imp_uid, //결제 고유번호  //포트원 결제모듈에서 결제건별로 고유하게 채번하는 ID
					merchant_uid : rsp.merchant_uid, //주문번호 //결제 요청시 가맹점에서 아임포트로 전달한 가맹점 고유 주문번호 
					name : rsp.name, //상품명       
				    buyer_name : rsp.buyer_name,  
                    buyer_tel : rsp.buyer_tel,
                    buyer_addr : rsp.buyer_addr,
                    buyer_email : rsp.buyer_email,
                    amount: totalAmount,
                    priceCnt : $("[id=price]").text(), 
                    point : $("[id=realMileage]").text(),
                    option1 : $("[id=option]").text(),
                    productID: $("[id=productID]").val(),
                    paydate : paydate                   
					} 
		
			//location= "MyOrders.do?email="+email;
			}).done(function(data) {
				// 가맹점 서버 결제 API 성공시 로직
				
			});
			location= "MyOrders.do?email="+email;
		} else {
			alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
		}
	});
		
	}
		
	function requestPay1() {

		var totalAmount = document.getElementById('realtotprice').innerText; //총비용		 
		var buyerName = document.getElementById('buyer_name1').value;  //사는 사람 이름
		 var price =  document.getElementById('price').innerText;  // 선택된 상품 수량
		  var point = document.getElementById('realMileage').innerText; // 선택된 포인트		 
		  var phone = document.getElementById('phone1').value;//  사는 핸드폰
		  var email = document.getElementById('email').innerText; //이메일 
		  var postcode = document.getElementById('sample6_postcode').value; // 
		  var address = document.getElementById('sample6_address').value;
		  var detailAddress = document.getElementById('sample6_detailAddress').value;
		  var orderInfo =  postcode + " " + address + " " + detailAddress;  //사는 사람 주소 		    
		   var name =document.getElementById('name').innerText ;
		
		  
	    var IMP = window.IMP;
	    IMP.init('imp18258351') // 예: 'imp00000000a'
	    
	    IMP.request_pay({
			pg : 'tosspay',
			pay_method : "card",
			merchant_uid : 'merchant_uid' + new Date().getTime(),		
			name : name,
			amount : totalAmount,
			buyer_email : email,
			buyer_name : buyerName,
			buyer_tel : phone,
			buyer_addr : orderInfo,
			buyer_postcode : "123-456", //주문자 우편번호
			

		},

		function(rsp) {//콜백 함수

			if (rsp.success) {

				// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				// jQuery로 HTTP 요청

				console.log(rsp);

				alert('결제에 성공하였습니다');

				jQuery.ajax({
				url : "http://localhost:8080/payInsert.do",
				//url : "payInsert.do",

					method : "POST",

					data : {
						imp_uid : rsp.imp_uid, //결제 고유번호  //포트원 결제모듈에서 결제건별로 고유하게 채번하는 ID
						merchant_uid : rsp.merchant_uid, //주문번호 //결제 요청시 가맹점에서 아임포트로 전달한 가맹점 고유 주문번호 
						name : rsp.name, //상품명       
					    buyer_name : rsp.buyer_name,  
	                    buyer_tel : rsp.buyer_tel,
	                    buyer_addr : rsp.buyer_addr,
	                    buyer_email : rsp.buyer_email,
	                    amount: totalAmount,
	                    priceCnt : $("[id=price]").text(), 
	                    point : $("[id=realMileage]").text(),
	                    option1 : $("[id=option]").text(),
	                    productID: $("[id=productID]").val(),
	                    paydate : paydate         
					} 
				
				//location= "MyOrders.do?email="+email;
				}).done(function(data) {
					// 가맹점 서버 결제 API 성공시 로직
					
				});
				location= "MyOrders.do?email="+email;
			} else {
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			}
		});
				
		}
</script>


</body>
</html>