<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>



<select id="price"> 
   <option value="" selected >��ǰ �� ����</option>
   <option value="1" >1��</option>
   <option value="2" >2��</option>
   <option value="3" >3��</option>
   <option value="4" >4��</option>
   <option value="5" >5��</option>
   <option value="6" >6��</option>
   <option value="7" >7��</option>
   <option value="8" >8��</option>
   <option value="9" >9��</option>
   <option value="10">10��</option>
</select>

<select id="point"> 
   <option value="" selected >����Ʈ ����</option>
   <option value="1000" >1000��</option>
   <option value="2000" >2000��</option>
   <option value="3000" >3000��</option>
   <option value="4000" >4000��</option>
   <option value="5000" >5000��</option>
   <option value="6000" >6000��</option>
   <option value="7000" >7000��</option>
   <option value="8000" >8000��</option>
   <option value="9000" >9000��</option>
   <option value="10000" >10000��</option>
</select>

<!-- iamport.payment.js -->
<!-- iamport.payment.js �� IMP ���������� �������  -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script src="resources/js/jquery-3.7.1.min.js"></script>

<script>
	//client-side
	
	
	function requestPay() {

		  var price = document.getElementById("price").value; // ���õ� ��ǰ ����
		  var point = document.getElementById("point").value; // ���õ� ����Ʈ
		  

		  if (price === "") {
	            alert("��ǰ ���� �����ϼ���.");
	            return;
	        }
		  
		  if (point === "") {
	            alert("����Ʈ�� �����ϼ���.");
	            return;
	        }
		       
	
		  
		   var totalAmount = (price * 20000)-point; 
		
		  
		  //3. ��ǰ �� ���� �ؼ� ���� ���� �����ϱ�
		  
		  
	    var IMP = window.IMP;
	    IMP.init('imp18258351') // ��: 'imp00000000a'
	    
		IMP.request_pay({
			 
			pg : 'kakaopay',
			pay_method : "card",
			merchant_uid : 'merchant_uid' + new Date().getTime(),
			//merchant_uid : "57008833-33045",//57008833-33000~45(�����Ϸ�� �ֹ���ȣ) // �������� �����ϴ� �ֹ� ��ȣ�� ����
			name : "10",
			amount : totalAmount,
			buyer_email : "xogus9753@naver.com",
			buyer_name : "������",
			buyer_tel : "010-1234-5678",
			buyer_addr : "����Ư���� ������ �Ｚ��",
			buyer_postcode : "123-456", //�ֹ��� �����ȣ
			

		},

		function(rsp) {//�ݹ� �Լ�

			if (rsp.success) {

				// ���� ���� ��: ���� ���� �Ǵ� ������� �߱޿� ������ ���
				// jQuery�� HTTP ��û

				console.log(rsp);

				alert('������ �����Ͽ����ϴ�');

				jQuery.ajax({
					url : "http://localhost:8099/sawon/payInsert.do",
					//url : "HaevaInsert.do",

					method : "POST",

					/*  headers : {
						"Content-Type" : "application/json" // ���� ������ ����
					}, 

					  data: JSON.stringify({
					       imp_uid: rsp.imp_uid,
					       merchant_uid: rsp.merchant_uid
					       name : rsp.name
					   })  
  */
					 data : {
						imp_uid : rsp.imp_uid, //���� ������ȣ  //��Ʈ�� ������⿡�� �����Ǻ��� �����ϰ� ä���ϴ� ID
						merchant_uid : rsp.merchant_uid, //�ֹ���ȣ //���� ��û�� ���������� ������Ʈ�� ������ ������ ���� �ֹ���ȣ 
						name : rsp.name, //��ǰ��   
                        buyer_name : rsp.buyer_name,  
                        buyer_tel : rsp.buyer_tel,
                        buyer_addr : rsp.buyer_addr,
                        buyer_email : rsp.buyer_email,
                        amount: totalAmount,
                        priceCnt : $("[id=price]").val(), 
                        point : $("[id=point]").val()
                        
					} 
 
				}).done(function(data) {
					// ������ ���� ���� API ������ ����

				});
			} else {
				alert("������ �����Ͽ����ϴ�. ���� ����: " + rsp.error_msg);
			}
		});

	}
</script>
 <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	//client-side

	function requestPay1() {

		  var price = document.getElementById("price").value; // ���õ� ��ǰ ����
		  var point = document.getElementById("point").value; // ���õ� ����Ʈ
		  
	

		  if (price === "") {
	            alert("��ǰ ���� �����ϼ���.");
	            return;
	        }
		  
		  if (point === "") {
	            alert("����Ʈ�� �����ϼ���.");
	            return;
	        }
		       
	
		  
		   var totalAmount = (price * 20000)-point; 
		
		
		var IMP = window.IMP;
		IMP.init('imp18258351') // ��: 'imp00000000a'

		//var name8 = document.getElementById("name8").innerText;

		IMP.request_pay({
			pg : 'tosspay',
			pay_method : "card",
			merchant_uid : 'merchant_uid' + new Date().getTime(),
			//merchant_uid : "57008833-33045",//57008833-33000~45(�����Ϸ�� �ֹ���ȣ) // �������� �����ϴ� �ֹ� ��ȣ�� ����
			name : "7",
			amount : totalAmount,
			buyer_email : "xogus9753@naver.com",
			buyer_name : "������",
			buyer_tel : "010-1234-5678",
			buyer_addr : "����Ư���� ������ �Ｚ��",
			buyer_postcode : "123-456", //�ֹ��� �����ȣ

		},

		function(rsp) {//�ݹ� �Լ�

			if (rsp.success) {

				// ���� ���� ��: ���� ���� �Ǵ� ������� �߱޿� ������ ���
				// jQuery�� HTTP ��û

				console.log(rsp);

				alert('������ �����Ͽ����ϴ�');

				jQuery.ajax({
					url : "http://localhost:8081/sawon/payInsert.do",
					//url : "HaevaInsert.do",

					method : "POST",

					/*  headers : {
						"Content-Type" : "application/json" // ���� ������ ����
					}, 

					  data: JSON.stringify({
					       imp_uid: rsp.imp_uid,
					       merchant_uid: rsp.merchant_uid
					       name : rsp.name
					   })  
  */
					 data : {
						imp_uid : rsp.imp_uid, //���� ������ȣ  //��Ʈ�� ������⿡�� �����Ǻ��� �����ϰ� ä���ϴ� ID
						merchant_uid : rsp.merchant_uid, //�ֹ���ȣ //���� ��û�� ���������� ������Ʈ�� ������ ������ ���� �ֹ���ȣ 
						name : rsp.name, //��ǰ��       
					    buyer_name : rsp.buyer_name,  
                        buyer_tel : rsp.buyer_tel,
                        buyer_addr : rsp.buyer_addr,
                        buyer_email : rsp.buyer_email,
                        amount: totalAmount,
                        priceCnt : $("[id=price]").val(), 
                        point : $("[id=point]").val()

					} 
 
				}).done(function(data) {
					// ������ ���� ���� API ������ ����

				});
			} else {
				alert("������ �����Ͽ����ϴ�. ���� ����: " + rsp.error_msg);
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

	<h1>����������</h1>

	<button onclick="requestPay()">īī������</button>
	<!-- �����ϱ� ��ư ���� -->
	
	<button onclick="requestPay1()">�佺����</button>
	<!-- �����ϱ� ��ư ���� -->

	
	
     <br><a href="paySearch.do?buyer_email=xogus9753@naver.com">[���೻��]</a>
    
  
</body>
</html>