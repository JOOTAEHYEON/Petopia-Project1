<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>



<select id="price"> 
   <option value="" selected >상품 수 선택</option>
   <option value="1" >1개</option>
   <option value="2" >2개</option>
   <option value="3" >3개</option>
   <option value="4" >4개</option>
   <option value="5" >5개</option>
   <option value="6" >6개</option>
   <option value="7" >7개</option>
   <option value="8" >8개</option>
   <option value="9" >9개</option>
   <option value="10">10개</option>
</select>

<select id="point"> 
   <option value="" selected >포인트 선택</option>
   <option value="1000" >1000원</option>
   <option value="2000" >2000원</option>
   <option value="3000" >3000원</option>
   <option value="4000" >4000원</option>
   <option value="5000" >5000원</option>
   <option value="6000" >6000원</option>
   <option value="7000" >7000원</option>
   <option value="8000" >8000원</option>
   <option value="9000" >9000원</option>
   <option value="10000" >10000원</option>
</select>

<!-- iamport.payment.js -->
<!-- iamport.payment.js 로 IMP 전역변수가 만들어짐  -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script src="resources/js/jquery-3.7.1.min.js"></script>

<script>
	//client-side
	
	
	function requestPay() {

		  var price = document.getElementById("price").value; // 선택된 상품 수량
		  var point = document.getElementById("point").value; // 선택된 포인트
		  

		  if (price === "") {
	            alert("상품 수를 선택하세요.");
	            return;
	        }
		  
		  if (point === "") {
	            alert("포인트를 선택하세요.");
	            return;
	        }
		       
	
		  
		   var totalAmount = (price * 20000)-point; 
		
		  
		  //3. 상품 수 선택 해서 차감 시켜 결제하기
		  
		  
	    var IMP = window.IMP;
	    IMP.init('imp18258351') // 예: 'imp00000000a'
	    
		IMP.request_pay({
			 
			pg : 'kakaopay',
			pay_method : "card",
			merchant_uid : 'merchant_uid' + new Date().getTime(),
			//merchant_uid : "57008833-33045",//57008833-33000~45(결제완료된 주문번호) // 상점에서 관리하는 주문 번호를 전달
			name : "10",
			amount : totalAmount,
			buyer_email : "xogus9753@naver.com",
			buyer_name : "주태현",
			buyer_tel : "010-1234-5678",
			buyer_addr : "서울특별시 강남구 삼성동",
			buyer_postcode : "123-456", //주문자 우편번호
			

		},

		function(rsp) {//콜백 함수

			if (rsp.success) {

				// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				// jQuery로 HTTP 요청

				console.log(rsp);

				alert('결제에 성공하였습니다');

				jQuery.ajax({
					url : "http://localhost:8099/sawon/payInsert.do",
					//url : "HaevaInsert.do",

					method : "POST",

					/*  headers : {
						"Content-Type" : "application/json" // 값을 보내는 형태
					}, 

					  data: JSON.stringify({
					       imp_uid: rsp.imp_uid,
					       merchant_uid: rsp.merchant_uid
					       name : rsp.name
					   })  
  */
					 data : {
						imp_uid : rsp.imp_uid, //결제 고유번호  //포트원 결제모듈에서 결제건별로 고유하게 채번하는 ID
						merchant_uid : rsp.merchant_uid, //주문번호 //결제 요청시 가맹점에서 아임포트로 전달한 가맹점 고유 주문번호 
						name : rsp.name, //상품명   
                        buyer_name : rsp.buyer_name,  
                        buyer_tel : rsp.buyer_tel,
                        buyer_addr : rsp.buyer_addr,
                        buyer_email : rsp.buyer_email,
                        amount: totalAmount,
                        priceCnt : $("[id=price]").val(), 
                        point : $("[id=point]").val()
                        
					} 
 
				}).done(function(data) {
					// 가맹점 서버 결제 API 성공시 로직

				});
			} else {
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			}
		});

	}
</script>
 <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	//client-side

	function requestPay1() {

		  var price = document.getElementById("price").value; // 선택된 상품 수량
		  var point = document.getElementById("point").value; // 선택된 포인트
		  
	

		  if (price === "") {
	            alert("상품 수를 선택하세요.");
	            return;
	        }
		  
		  if (point === "") {
	            alert("포인트를 선택하세요.");
	            return;
	        }
		       
	
		  
		   var totalAmount = (price * 20000)-point; 
		
		
		var IMP = window.IMP;
		IMP.init('imp18258351') // 예: 'imp00000000a'

		//var name8 = document.getElementById("name8").innerText;

		IMP.request_pay({
			pg : 'tosspay',
			pay_method : "card",
			merchant_uid : 'merchant_uid' + new Date().getTime(),
			//merchant_uid : "57008833-33045",//57008833-33000~45(결제완료된 주문번호) // 상점에서 관리하는 주문 번호를 전달
			name : "7",
			amount : totalAmount,
			buyer_email : "xogus9753@naver.com",
			buyer_name : "주태현",
			buyer_tel : "010-1234-5678",
			buyer_addr : "서울특별시 강남구 삼성동",
			buyer_postcode : "123-456", //주문자 우편번호

		},

		function(rsp) {//콜백 함수

			if (rsp.success) {

				// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				// jQuery로 HTTP 요청

				console.log(rsp);

				alert('결제에 성공하였습니다');

				jQuery.ajax({
					url : "http://localhost:8081/sawon/payInsert.do",
					//url : "HaevaInsert.do",

					method : "POST",

					/*  headers : {
						"Content-Type" : "application/json" // 값을 보내는 형태
					}, 

					  data: JSON.stringify({
					       imp_uid: rsp.imp_uid,
					       merchant_uid: rsp.merchant_uid
					       name : rsp.name
					   })  
  */
					 data : {
						imp_uid : rsp.imp_uid, //결제 고유번호  //포트원 결제모듈에서 결제건별로 고유하게 채번하는 ID
						merchant_uid : rsp.merchant_uid, //주문번호 //결제 요청시 가맹점에서 아임포트로 전달한 가맹점 고유 주문번호 
						name : rsp.name, //상품명       
					    buyer_name : rsp.buyer_name,  
                        buyer_tel : rsp.buyer_tel,
                        buyer_addr : rsp.buyer_addr,
                        buyer_email : rsp.buyer_email,
                        amount: totalAmount,
                        priceCnt : $("[id=price]").val(), 
                        point : $("[id=point]").val()

					} 
 
				}).done(function(data) {
					// 가맹점 서버 결제 API 성공시 로직

				});
			} else {
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			}
		});

	}
</script>

<meta charset="UTF-8">
<title>Sample Payment</title>

</head>
<body>

	<%-- <%
	String id1 = request.getParameter("id1");
	String pw1 = request.getParameter("pw1");
	%> --%>


	<!-- <div id="name8"> aaaa</div> -->

	<h1>결제페이지</h1>

	<button onclick="requestPay()">카카오페이</button>
	<!-- 결제하기 버튼 생성 -->
	
	<button onclick="requestPay1()">토스페이</button>
	<!-- 결제하기 버튼 생성 -->

	
	
     <br><a href="paySearch.do?buyer_email=xogus9753@naver.com">[예약내역]</a>
    
  
</body>
</html>