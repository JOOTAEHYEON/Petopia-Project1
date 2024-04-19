<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/009_Pettaxi.css">

 
<meta charset="UTF-8">
<title>😻PET,TopiA🐶 - 펫택시</title>
</head>
<body>
   <!-- ====================================================== -->
<%   
	response.setDateHeader("Expires", 1L);              
	request.setCharacterEncoding("utf-8");
	%>
		<%
Random random = new Random();
String orderId = String.valueOf(Math.abs(random.nextLong())).substring(0, 10);
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

	<!-- ---------------------------------------------------------------------- -->
	<div class=" row topm_Orderconfirm displayco ">	
		<div class="col-9 " >
				<div class="title_Orderconfirm jua_nav "> 🚕 펫택시 예약 🚕 </div>	
				<div class="mt-3 ">							
			<!-- <div class="subtitle_Orderconfirm do_nav displays"> <img src="./resources/pic/mypage.png" width="30px" height="30px">  예약 예정 상품	</div>	 -->	
			<div class="textmargin_Orderconfirm">  &nbsp;&nbsp; &nbsp;&nbsp; * 탑승 예정일과 세부사항을 확인 부탁드립니다🙏🏻</div>
		
		  
	  <div class="subtitle_Orderconfirm do_nav displays"> <img src="./resources/pic/mypage.png" width="30px" height="30px">  기본 정보
	  	<div class="textmargin_Orderconfirm">  &nbsp;&nbsp; &nbsp;&nbsp; * 예약 정보 요청 </div>	  	
	  </div>
	   <hr>	
	<div class="mb-4 displaycos  ">
	<div class="box_orderconfirm4  "  style="width:900px">
		
		<div class="displays">
			 <div class="displays"><div class="box_orderconfirm6" style="width:110px"> 예약자 성함:</div>  <input class="box_orderconfirm2"  id="tname1"type="text" placeholder="보호자분  성함을 써주세요" value="" oninput="taxi()"> </div>       
        	<div class="displays "><div class="box_orderconfirm6 "  style="width:110px;"> 예약자 연락처:</div><input class="box_orderconfirm2" id ="ttel1" type="text" placeholder="보호자분  전화번호" value="" oninput="taxi()"></div>      
        </div>
        
         <div class="displays " style="margin: 20px 0PX;">
         	 <div class="displays">
         	 	<div class=" box_orderconfirm6" style="width:110px;"> 반려동물 수  :</div>  
         	 	<input class="box_orderconfirm2" type="text" id="tsoo1" placeholder="탑승할 반려견의 수를 적어주세요.." value="" oninput="taxi()">
         	 </div> 
        	<div class="displays ">
        		<div class="box_orderconfirm6"> 반려동물 품종:  </div>  
        		<div class="select" data-role="selectBox" style="margin-left: 10px;">        
        		  <span data-value="optValue" class="selected-option" id="tjong1">  </span>
			          <ul class="hide">
			            <li><i>유기동물을 보호하여 탑승 할 예정입니다.(입양포함)</i></li>   
			            <li><i><img src="./resources/dogpic/golden.png" alt="골든리트리버"></i>골든리트리버</li>
			            <li><i><img src="./resources/dogpic/daks.png" alt="닥스훈트"></i>닥스훈트</li>    
			            <li><i><img src="./resources/dogpic/mol.png" alt="말티즈"/></i>말티즈</li>
			            <li><i><img src="./resources/dogpic/bull.png" alt="불독"/></i>불독</li>   
			            <li><i><img src="./resources/dogpic/bee.png" alt="비숑 프리제"/></i>비숑 프리제</li>   
			            <li><i><img src="./resources/dogpic/shu.png" alt="슈나우저"/></i>슈나우저</li>    
			            <li><i><img src="./resources/dogpic/spitz.png" alt="스피츠"/></i>스피츠</li>    
			            <li><i><img src="./resources/dogpic/shiba.png" alt="시바견"/></i>시바견</li>    
			            <li><i><img src="./resources/dogpic/shichu.png" alt="시츄"/></i>시츄</li>    
			            <li><i><img src="./resources/dogpic/york.png" alt="요크셔테리어"/></i>요크셔테리어</li>    
			            <li><i><img src="./resources/dogpic/well.png" alt="웰시코기"/></i>웰시코기</li>   
			            <li><i><img src="./resources/dogpic/wawa.png" alt="치와와"/></i>치와와</li>    
			            <li><i><img src="./resources/dogpic/poo.png" alt="푸들"/></i>푸들</li>   
			            <li><i>기타</i></li>   
			        </ul>
        	</div>
        </div>
	     </div>
	     
	    <div class="displays">
	    	<div class="box_orderconfirm6"  style="width:110px;"> 출발일시 : </div>  
	    	<input class="text3_Details" type="date" id="tdate1" max="2077-06-20" min="2024-02-08" value="날짜를 선택해주세요" onchange="setDate()"></div>
  	
  	 </div>
	 
	 <div class="ckbox border juckjae">
	 <label for="form-field-field_0560688" class=" do_nav">🚨 적재물품</label>
		<div class="elementor-field-subgroup  elementor-subgroup-inline ">
		<span class="elementor-field-option"><input type="checkbox" value="대형 캐리어 1개" id="form-field-field_0560688-0" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-0">대형 캐리어 1개</label></span>
		<span class="elementor-field-option"><input type="checkbox" value="대형 캐리어 2개" id="form-field-field_0560688-1" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-1">대형 캐리어 2개</label></span>
		<span class="elementor-field-option"><input type="checkbox" value="중형 캐리어 1개" id="form-field-field_0560688-2" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-2">중형 캐리어 1개</label></span>
		<span class="elementor-field-option"><input type="checkbox" value="중형 캐리어 2개" id="form-field-field_0560688-3" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-3">중형 캐리어 2개</label></span><br>
		<span class="elementor-field-option"><input type="checkbox" value="소형 캐리어 1개" id="form-field-field_0560688-4" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-4">소형 캐리어 1개</label></span>
		<span class="elementor-field-option"><input type="checkbox" value="소형 캐리어 2개" id="form-field-field_0560688-5" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-5">소형 캐리어 2개</label></span>
		<span class="elementor-field-option"><input type="checkbox" value="소형 캐리어 3개" id="form-field-field_0560688-6" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-6">소형 캐리어 3개</label></span>
		<span class="elementor-field-option"><input type="checkbox" value="소형 켄넬 1개" id="form-field-field_0560688-7" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-7">소형 켄넬 1개</label></span><br>
		<span class="elementor-field-option"><input type="checkbox" value="소형 켄넬 2개" id="form-field-field_0560688-8" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-8">소형 켄넬 2개</label></span>
		<span class="elementor-field-option"><input type="checkbox" value="중형 켄넬 1개" id="form-field-field_0560688-9" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-9">중형 켄넬 1개</label></span>
		<span class="elementor-field-option"><input type="checkbox" value="중형 켄넬 2개" id="form-field-field_0560688-10" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-10">중형 켄넬 2개</label></span>
		<span class="elementor-field-option"><input type="checkbox" value="대형 켄넬 1개" id="form-field-field_0560688-11" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-11">대형 켄넬 1개</label></span>
		<span class="elementor-field-option"><input type="checkbox" value="대형 켄넬 2개" id="form-field-field_0560688-12" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-12">대형 켄넬 2개</label></span><br>
		<span class="elementor-field-option"><input type="checkbox" value="유모차" id="form-field-field_0560688-13" name="form_fields[field_0560688][]"> <label for="form-field-field_0560688-13">유모차</label></span>					
	 </div>
   
</div>

	</div>	
		
	<div class=" mt-4 ">
	<div class="subtitle_Orderconfirm do_nav"> <img src="./resources/pic/mypage.png" width="30px" height="30px">  방문전 전달 사항
	
	</div>
	<hr>
	<input type="text"  id="tcon1" placeholder="요청사항이 있으면 기재해주세요" style="width:850px; height:250px;" oninput="taxi()">
	<div style="color:gray">* 해당 내용은 예약 상호로 전달 될 예정입니다. </div>
	</div>
	
	<div class="subtitle_Orderconfirm do_nav " style="text-align:left; ">  <img src="./resources/pic/mypage.png" width="30px" height="30px">  예약  정보</div>
	<hr>
	
	<form class="displays " action="inserttaxi.do">
		<div style="width:100%;" class=" displays  paybox_orderconfirm  ">
			<div class="m-4 ">
			
			
			<div style="height:30px;" >예약자 성함: <input class="taxiBookingbox"id="tname" name="tname" type="text" value=""></div>
		 	<div id="soo" style=""> 예약자 전화번호: <input class="taxiBookingbox" id="ttel" name="ttel" type="text" value=""></div>	
			
		
		 	
		 	
			<div style="height:30px;" > 반려동물 수 : <input class="taxiBookingbox" id="tsoo" name="tsoo" type="text" value=""></div> 
			<div style="height:30px;" > 이용 날짜: <input  class="taxiBookingbox"id="tdate" name="tdate" type="text" value=""></div> 
			</div>
			
			
			<div class="m-4">		
			<div style="height:30px;">요청사항: <input  class="taxiBookingbox" id="tcon" name="tcon" type="text" value=""></div>	
			<div style="height:30px;">반려동물 품종: <input   class="taxiBookingbox" id="tjong" name="tjong" type="text" value=""></div>
			<div style="height:30px;">적재물품: <input style="widht:140px;"class="taxiBookingbox" id="tthing" name="tthing" type="text" value=""></div>
			<input type="hidden" id="rorder" name="random" value="<%= orderId %>">
			<input type="hidden" id="email" name="email" value="${result.email}">
		
			</div>
		</div>
		
		<input type="submit" class="btn btn-warning paytext_orderconfirm" style="width:300px; border:none;" value="예약하기">
		
	</form>
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
<script>
function taxi() {
    // 받는 분의 정보 가져오기
    var tname = document.getElementById('tname1').value;
    document.getElementById('tname').value = tname;
    var ttel = document.getElementById('ttel1').value;
    document.getElementById('ttel').value = ttel;
    var tcon = document.getElementById('tcon1').value;
    document.getElementById('tcon').value = tcon;
    var tsoo = document.getElementById('tsoo1').value;
    document.getElementById('tsoo').value = tsoo;
}

function setDate() {
    var tdate = document.getElementById('tdate1').value;
    document.getElementById('tdate').value = tdate;
}

window.onload = function() {
    // 각 리스트 아이템에 클릭 이벤트를 추가
    const listItems = document.querySelectorAll('.select li');
    listItems.forEach(item => {
        item.addEventListener('click', function() {
            const selectedValue = item.innerText.trim(); // 선택된 값 가져오기
            document.getElementById('tjong1').innerText = selectedValue; // span에 선택된 값 표시
            document.getElementById('tjong').value = selectedValue; // 히든 필드에 선택된 값 설정
        });
    });
};
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    var maxChecked = 2;
    var inputField = document.getElementById('tthing');

    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            var checkedCount = 0;
            var checkedValues = [];

            checkboxes.forEach(function(cb) {
                if (cb.checked) {
                    checkedCount++;
                    checkedValues.push(cb.value);
                }
            });

            if (checkedCount > maxChecked) {
                this.checked = false;
                alert("최대 " + maxChecked + "개까지만 선택할 수 있습니다.");
            } else {
                inputField.value = checkedValues.join(', '); // 여기서 ', '를 다른 구분자로 변경할 수 있습니다.
            }
        });
    });
});

</script>



<script src="http://code.jquery.com/jquery-latest.min.js"></script>   
<script>
document.addEventListener('DOMContentLoaded', function() {
    const select = document.querySelector(`[data-role="selectBox"]`);
    const values = select.querySelector(`[data-value="optValue"]`);
    const option = select.querySelector('ul');
    const opts = option.querySelectorAll('li');

    /* 셀렉트 영역 클릭 시 옵션 숨기기, 보이기 */
    function selects(e){
        e.stopPropagation();
        if(option.classList.contains('hide')){
            option.classList.remove('hide');
            option.classList.add('show');
        }else{
            option.classList.add('hide');
            option.classList.remove('show');
        }
        selectOpt();
    }

    /* 옵션 선택 */
    function selectOpt(){
        opts.forEach(opt=>{
            const innerValue = opt.innerHTML;
            function changeValue(){
                values.innerHTML = innerValue;
            }
            opt.addEventListener('click',changeValue)
        });
    }

    /* 렌더링 시 옵션의 첫번째 항목 기본 선택 */
    function selectFirst(){
        const firstValue = opts[0].innerHTML;
        values.innerHTML = `${firstValue}`
    }

    select.addEventListener('click', selects); // 셀렉트 영역 클릭 이벤트 추가
    selectFirst(); // 렌더링 시 옵션의 첫 번째 항목 선택
});
</script>






	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 	crossorigin="anonymous"></script>

</body>
</html>