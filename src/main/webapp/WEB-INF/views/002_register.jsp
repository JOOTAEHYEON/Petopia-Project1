 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- ======================================================== -->
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/002_Login.css">

<script src="${pageContext.request.contextPath}/resources/js/002_register.js"></script>

<!-- ======================================================== -->
<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>

</head>
<body>
	<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store"); // 일부파이어폭스버그관련
	response.setDateHeader("Expires", 1L); //응답결과의만료일지정
	%>
	<!-- ======================================================= -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
		<div class="container-fluid d-flex align-items-center mx-4">
    <a class="navbar-brand mr-3" href="${pageContext.request.contextPath}/main.do">  <img src="${pageContext.request.contextPath}/resources/pic/LOGO1.png" width="210px" height="80px">   </a>
	
	</div>
	</nav>


   <!-- ---------------------------------------------------------------------- -->
   <div class="topm_register ">
   <div class="jua_nav Title_register "> Register</div>
      <br>
 
<form action="userInsert.do" method="post">
  <table>
      <tr>
        <td class="subtitle_register" colspan="2">기본 정보</td>
     </tr>
     <tr>
        <td colspan=2><hr></td>
     </tr>
     
   <tr>
      <td class="text_register sejong_nav">이메일*</td>
      <td>
          <input type="text" name="email" class="input_email text2_register" placeholder="a123@abc.com"  required>
           <span id="checkEmail" style="font-size: 12px;"></span><br>
      </td>
      </tr>
    <tr>
       <td class="text_register sejong_nav">비밀 번호 *</td>
      <td>
          <input type="password"  name="password" class="input_pw text2_register"  minlength = "3" placeholder="password" required>
          <span id="checkPw" style="font-size: 12px;"></span><br>
      </td>
   </tr>
   <tr>
      <td class="text_register sejong_nav">비밀 번호 확인 *</td>
      <td>
          <input type="password"name="password2" class="input_pw2 text2_register"  minlength = "3" placeholder="password" required>
           <span id="checkPw2" style="font-size: 12px;"></span><br>
      </td>
   </tr>

    <tr>
      <td class="text_register sejong_nav" >전화번호</td>
      <td><input class="text2_register sejong_nav input_phone" type="text" minlength = "11"   maxlength = "11" name="tel" required>
      		<span id="checkPhone" style="font-size: 12px;"></span><br>
      		
      </td>
   </tr>
    <tr>
      <td class="text_register sejong_nav">주소 *</td>
      <td><input class="text2_register" type="text" id="sample6_postcode"  name="adp" placeholder="우편번호" required>
      <input class="btn btn-warning text-dark" style="background-color: white; border-color: #ffc107" type="button"  onclick="sample6_execDaumPostcode()" value="우편번호🔎"><br></td>
      </tr>
      
      
      
   <tr>
      <td class="text_register "></td>
      <td><input class="text2_register sejong_nav" id="sample6_address" type="text"
      name="ad" placeholder="주소" required><br></td>
   </tr>

   <tr>
      <td class="text_register"></td>
      <td><input class="text2_register sejong_nav" id="sample6_detailAddress"
      type="text" name="ad1" placeholder="상세주소"><br></td>
   </tr>
            
   
   <tr>
      <td class="text_register"></td>
      <td><input type="hidden" id="sample6_extraAddress" placeholder="참고항목"><br></td>
   </tr>
   
  </table>
  <div style="text-align:center; ">
			<input type="checkbox" id="termsCheckbox"> <label for="termsCheckbox"> 이용약관에 동의합니다.</label>
  <div style="text-align:center; ">
	<input class="btCheck infobox2" type="submit" value="회원 가입" disabled>
   </div>
</div>
		</form>
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
<!-- ---------------------------------------------------------------------- -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>   
<script>
   $('.input_email').focusout(function() {
      let userEmail = $(this).val();   
      let emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

      $.ajax({
         url: 'checkEmail.do',
         type: "post",
         data: { userEmail: userEmail },
         dataType: 'json',
         success: function(result) {
            if (result && emailRegex.test(userEmail) && userEmail.endsWith('.com')) {
               $("#checkEmail").html('사용 가능한 이메일입니다.');
               $("#checkEmail").css('color', 'green');
            } else {
               $("#checkEmail").html('사용 불가능한 이메일입니다.');
               $("#checkEmail").css('color', 'red');
            }
         },
         error: function(e) {
            alert('checkEmail 서버 요청 실패: ' + e);
         }
      });
   });
</script>
<script>
   $('.input_pw, .input_pw2').focusout(function() {
       let password1 = $(".input_pw").val();
       let password2 = $(".input_pw2").val();

       if (password1 !== "" && password2 !== "") { 
           $.ajax({
               url: "checkPw.do",
               type: "post",
               data: {
                   password1: password1,
                   password2: password2
               },
               dataType: 'json',
               success: function(result) {
                   if (result == 1) {
                       $("#checkPw").html("비밀번호가 일치합니다.").css("color", "green");
                       $("#checkPw2").html("비밀번호가 일치합니다.").css("color", "green");
                   } else {
                       $("#checkPw").html("비밀번호가 일치하지 않습니다.").css("color", "red");
                       $("#checkPw2").html("비밀번호가 일치하지 않습니다.").css("color", "red");
                   }
               },
               error: function(e) {
                  alert('checkPw 서버 요청 실패: ' + e);
               }
           });
       }
   });
</script>

<script>
   $('.input_phone').on('input',function() {
      let userPhone = $(this).val();
      let formattedPhone = userPhone.replace(/[^0-9]/g, '');

      if (formattedPhone.length === 11) {
         formattedPhone = formattedPhone.replace(/^(\d{3})(\d{4})(\d{4})$/, '$1-$2-$3');
      }
         $(this).val(formattedPhone);
    });
   $('.input_phone').focusout(function() {
      let userPhone = $(this).val();

   $.ajax({
      url : "checkPhone.do",
      type : "post",
      data : {userPhone : userPhone},
      dataType : 'json',
      success : function(result) {
          if (result && userPhone.startsWith('010')&& userPhone.length === 13) {
             $("#checkPhone").html('사용할 수 있는 전화번호입니다.');
            $("#checkPhone").css('color', 'green');
      } else {
            $("#checkPhone").html('사용할 수 없는 전화번호입니다.');
            $("#checkPhone").css('color', 'red');
             }
      },
      error : function(e) {
            alert('checkPhone 서버 요청 실패: ' + e);
         }
      });
   });
</script>
<script>
$('#termsCheckbox').on('change', function() {
    if ($(this).is(':checked')) {
            var emailColor = $("#checkEmail").css('color');
            var pwColor = $("#checkPw").css('color');
            var phoneColor = $("#checkPhone").css('color');

            $.ajax({
                url: "insetCheck.do", 
                type: "POST",
                data: {
                    emailColor: emailColor,
                    pwColor: pwColor,
                    phoneColor: phoneColor
                }, 
                success: function(result) {

                	if (result == 1) {
                	    $(".btCheck").prop('disabled', false);
                	    $(".btCheck").css('background-color', '#FFCD00');
                	} else {
                	    $(".btCheck").prop('disabled', true);
                	    $(".btCheck").css('background-color', '');
                	}
                   
                },
                error: function(e) {
                    alert('insetCheck 서버 요청 실패: ' + e);
                }
            });
        }else {
           $(".btCheck").prop('disabled', true);
        }
    });
</script>
   
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
function sample6_execDaumPostcode() {
   new daum.Postcode(
         {
            oncomplete : function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수

               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if (data.userSelectedType === 'R') {
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
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
<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>
  

</body>
</html>