 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://www.youtube.com/iframe_api"></script>
<!-- ======================================================== -->

 <link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">

<!-- ======================================================== -->
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_nav.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/000_footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/005_StrayAnimalDetail.css">

<meta charset="UTF-8">
<title>😻PET,TopiA🐶</title>
</head>

<body>

	<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");    // 일부파이어폭스버그관련
	response.setDateHeader("Expires", 1L);  //응답결과의만료일지정
	
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
	<div class="topm_Details displayco ">
		<div class="  displays innertop_Details  ">
			<div class="displaycos ">
				<div class="  innerbox_Details">productID:${alist.asoo}</div>
				<div class="  img_Details"><img src="http://${alist.picurl}" class="  img-fluid img_Details "></div>
			</div>
			<div class="innerbox3_Details col-5 ">
				<div class="displays">
					 <h5><span class="badge text-bg-secondary "> ${alist.acenter} </span></h5>
					 <h5><span class="badge text-bg-secondary"> 입양 가능 </span></h5>
					  <h5><span class="badge text-bg-secondary">  ${alist.acate} </span></h5>
					
					
				</div>	 
					<hr style="width:400px;">
			<div class="boxtop text_Details"> 이름 : ${alist.aname}(${alist.acenter}) </div>		     
			 <div class="text_Details sejong_nav" style="margin-top:20px">품종: <span class="text_Details">${alist.akind}</span></div>
				<div class="displays " >					   
					<div class="detailbox2_Details ">				
												
						<div class="text2_Details sejong_nav">입소 날짜:  <span  class="text3_Details">${alist.aenter}</span></div>	
						<div class="text2_Details sejong_nav" > 성별:  <span class="text3_Details">${alist.agender}</span></div>
						
						<div class="displays" style="width:600px;" >				
   							<div class="text2_Details sejong_nav " > 추정 나이: <span class="text3_Details" >${alist.aage}</span></div>
   								<div class="text2_Details sejong_nav " > 몸무게: <span class="text3_Details" >${alist.aweight} Kg</span></div>
   						 </div>
   						
   						 
   						 <div class="displays" style="width:600px;" >				
   							<div class="text2_Details sejong_nav " > 입양 상태 : <span class="text3_Details" >${alist.astatus1}</span></div>
   							<div class="text2_Details sejong_nav " > 임시 보호 : <span class="text3_Details" >${alist.astatus2}</span></div>
   							<input type="hidden" id="aurl" value="${alist.aURL}">
   						 </div>
   						 
   						  <div class="displays   text5_Details sejong_nav" style="width:400px;" >				
   						서울동물복지지원센터내의 입양대기동물들은 입양 전 교육 이수 후 첫만남이 가능합니다. 
   								나이는 추정나이로써 실제 나이와 일치하지 않을 수 있으며, 성격 또한 입양 후 생활패턴이나 환경, 시간 등 변화에 따라 달라질 수 있으니 충분히 고려해보신 후 입양신청 해주세요. 
   						 </div>
   						 

					</div>
				 </div>	
					
			</div>					
			</div>
			
			<button class="custom-button" onclick="window.open('https://animal.seoul.go.kr/adoptstep', '_blank')">입양절차 안내</button>

			
		</div>
		<!-- ==============================이미지============================================================= -->
	<br class="br1 ">
	  <div class="lowm_Details ">
	  <div class="m-4 text_Details do_nav"> 🛍${alist.aname} 소개  </div>
	  
	 <div id="player"></div>
		<div style="text-decoration:none; widht:50%">${alist.aintroduce}</div>
	 <script>
        // YouTube API로 비디오를 삽입할 함수
        function onYouTubeIframeAPIReady() {
            var videoID =document.getElementById("aurl").value; // 유튜브 동영상의 고유 ID

            // 플레이어를 생성하고 지정된 ID에 삽입
            var player = new YT.Player('player', {
                height: '315',
                width: '560',
                videoId: videoID,
                playerVars: {
                    'autoplay': 1, // 자동 재생
                    'controls': 1, // 재생 컨트롤러 표시
                    'showinfo': 0, // 제목 및 소개 표시
                    'rel': 0 // 관련 동영상 표시
                },
                events: {
                    'onReady': onPlayerReady
                }
            });
        }

        function onPlayerReady(event) {
            event.target.playVideo(); // 플레이어가 준비되면 비디오를 자동으로 재생
        }
    </script>
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
<script>

function setDate() {
    // 선택된 옵션의 값을 가져와서 텍스트 입력란에 설정
    var selectedDdate = document.getElementById("Ddate").value;
    document.getElementById("hDate").value = selectedDdate;
}
window.onload = function() {
    // 각 리스트 아이템에 클릭 이벤트를 추가
    const listItems = document.querySelectorAll('.select li');
    listItems.forEach(item => {
        item.addEventListener('click', function() {
            const selectedValue = item.innerText.trim(); // 선택된 값 가져오기
            document.getElementById('setCate').innerText = selectedValue; // span에 선택된 값 표시
            document.getElementById('hCate').value = selectedValue; // 히든 필드에 선택된 값 설정
        });
    });
};
</script>



<script>
const body = document.querySelector('body');
const select = document.querySelector(`[data-role="selectBox"]`);
const values = select.querySelector(`[data-value="optValue"]`);
const option = select.querySelector('ul');
const opts = option.querySelectorAll('li');

/* 셀렉트영역 클릭 시 옵션 숨기기, 보이기 */
function selects(e){
    e.stopPropagation();
    option.setAttribute('style',`top:${select.offsetHeight}px`)
    if(option.classList.contains('hide')){
        option.classList.remove('hide');
        option.classList.add('show');
    }else{
        option.classList.add('hide');
        option.classList.remove('show');
    }
    selectOpt();
}

/* 옵션선택 */
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

/* 옵션밖의 영역(=바디) 클릭 시 옵션 숨김 */
function hideSelect(){
    if(option.classList.contains('show')){
        option.classList.add('hide');
        option.classList.remove('show');
    }
}

selectFirst();
select.addEventListener('click',selects);
body.addEventListener('click',hideSelect);


 function getImageFiles(e) {
      const uploadFiles = [];
      const files = e.currentTarget.files;
      const imagePreview = document.querySelector('.image-preview');
      const docFrag = new DocumentFragment();


      // 파일 타입 검사
      [...files].forEach(file => {
        if (!file.type.match("image/.*")) {
          alert('이미지 파일만 업로드가 가능합니다.');
          return
        }

        // 파일 갯수 검사
        if ([...files].length < 6) {
          uploadFiles.push(file);
          const reader = new FileReader();
          reader.onload = (e) => {
            const preview = createElement(e, file);
            imagePreview.appendChild(preview);
          };
          reader.readAsDataURL(file);
        }
      });
    }

    function createElement(e, file) {
      const li = document.createElement('li');
      const img = document.createElement('img');
      img.setAttribute('src', e.target.result);
      img.setAttribute('data-file', file.name);
      li.appendChild(img);

      return li;
    }

    const realUpload = document.querySelector('.real-upload');
    const upload = document.querySelector('.upload');

    upload.addEventListener('click', () => realUpload.click());

    realUpload.addEventListener('change', getImageFiles);

</script>

<script>
    var swiper = new Swiper('.swiper', {
      slidesPerView: 3,
      direction: getDirection(),
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      on: {
        resize: function () {
          swiper.changeDirection(getDirection());
        },
      },
    });

    function getDirection() {
      var windowWidth = window.innerWidth;
      var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';

      return direction;
    }

    function validateForm() {
        var hDate = document.getElementById("hDate").value;
        var hCate = document.getElementById("hCate").value;

        if (hDate === "" || hCate === "") {
            alert("날짜와 카테고리를 선택하세요.");
            return false; // 제출 중지
        }

        // 만약에 모든 조건이 충족되면 폼을 제출
        return true;
    }
    
</script>
 <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


</body>
</html>