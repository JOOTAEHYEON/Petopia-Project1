![header](https://capsule-render.vercel.app/api?type=waving&color=timeGradient&text=Petopia-Project%20%20&animation=twinkling&fontSize=50&fontAlignY=40&fontAlign=50&height=250)



<h1>기획의도</h1>
 2023년 기준 국내 반려동물 양육 인구 비율이 28.2%인 것으로 나타났습니다. 그러나 현존하는 사이트는 반려동물 상품을 판매하거나, 혹은 병원 예약 가능 등 통합사이트가 부족했습니다. 펫토피아는 30%에 육박하는 반려인들을 위한 웹사이트를 구축하는 것이 목표입니다.
 펫토피아에서는 사용자들에게 “병원, 미용실, 호텔, 택시” 예약 서비스를 제공합니다. 병원, 미용실, 호텔의 경우 공공데이터를 이용하여 상호에 대한 주소, 운영 시간 , 전화 번호 등 주요 정보를 고객에게 제공합니다. 택시는 데이터 부족으로 직접 예약을 받고, 택시회사에 전달하도록 기획하였습니다.
 추가로, 업체들의 상품을 등록하여, 반려동물 상품 구매 플랫폼을 역할을 합니다. 또한 커뮤니티 페이지를 제공하여, 반려인들 끼리 정보를 주고받고 소통할 수 있습니다. 커뮤니티 기능을 통해 사용자들의 유입을 유도하려고 합니다.
 마지막으로, 펫토피아는 “유기 동물 입양” 소식을 전하고, 유기 동물 통계 정보를 공유하여 반려동물에 대한 사회적 책임을 다하는 것을 목표로 합니다.

<h2>프로젝트 시연영상</h2>
 프로젝트 동영상 링크 : https://youtu.be/IC2owr85Muw

<h2>개발기간</h2>
 2024.03.07 ~ 2024.04.03 (총 28일)

<h2>참여인원</h2>
5명

<h2>개발환경</h2>
STS3(Spring Tool Suite 3) ,Windows 10 , JDK11(Java Development Kit) , Rstudio , Mac OS 

<h2>사용도구</h2>
Oracle , SQLDeveloper , Apache Tomcat 8.5 

<h2>사용기술</h2>
네이버 간편 로그인 API , 카카오(토스)페이  간편 결제 API , 카카오 주소 API
Mybatis , Java , JavaScript , HTML/CSS ,  jQuery , JSP, Ajax , Json , JSTL , XML ,  스와이퍼 , 페이징 

<h2>목표 및 설계</h2>

![펫토피아](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/c16de581-415c-4633-9819-808b85385964)

<h2>팀 공통 목표</h2>
-스프링 3 프레임워크 원리를 이용하고 활용할 수 있도록 합니다.<br>
-공공데이터를 활용하여, 사용자들에게 유용한 정보를 전달합니다.<br>
-웹 페이지 구현에는 사용자가 중도 이탈하지 않도록, 불필요한 이동을 최소화합니다.<br>
-개인정보 보호를 위해 암호 변경 시 이메일 인증을 받도록 합니다.<br>
-사진 업로드, 게시글 작성, 댓글 기능을 통해 커뮤니티를 활성화합니다.<br>
-수업 시작 전 회의를 통해 자신의 진도를 공유하고, 화면 설계서 및 기능 명세서를 통해 프로젝트 현황을 확인합니다.<br><br>

프로젝트 진행 현황 체크<br>

![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/11ea9725-f6b6-4228-8e69-aec134ba02d4)

<h2>개인목표</h2>

	상품 상세 페이지
목표: 고객이 상품에 대해 확인하며 장바구니 담기 및 구매 확인 페이지 이동할 수 있습니다. <br> 
구현계획: 상품 이름, 상품 가격, 상품 품번 등 공공데이터를 DB에 저장 후 출력하고 상품 옵션 및 상품 수량 선택 기능 있습니다. 장바구니 클릭 시 장바구니 페이지로 이동할 수 있으며, 구매하기 클릭 시 구매 확인 페이지로 이동할 수 있습니다.  <br>

	구매 확인 페이지
목표: 고객이 구매 확인 페이지에서 선택한 내용을 재확인할 수 있으며 상품을 결제할 수 있습니다. <br>
구현계획: 상품 정보를 확인할 수 있으며, 고객명, 연락처, 배송지를 입력해야 합니다. 그리고 고객이 상품에 대해 마일리지를 사용할 수 있습니다. 이러한 고객의 정보를 통해 구매하기 버튼을 이용해 구매창을 연결합니다. <br>



    상품 구매
목표: 고객이 원하는 상품을 골라 구매 할수 있습니다. <br>
구현계획: 포트원 결제 API를 사용하였으며, jQuery.ajax 기능을 통해 결제 성공 시 고객의 정보, 상품의 정보를 Sql DB에 저장하도록 하였습니다. 또한, 간편결제인 카카오페이, 토스 페이를 구현하였습니다.  <br>
 

    구매 내역 페이지
목표: 고객이 구매한 상품들을 구매 내역 페이지에서 확인할 수 있습니다. <br> 
구현계획: 고객이 로그인 후 이메일을 통해 구매 내역 페이지로 접근 가능하며, 구매 내역이 없을 경우 “구매한 상품이 없습니다.”를 확인할 수 있습니다. 또한, 구매내역이 있을 경우 DB에 PAY 테이블에서 주문번호, 상품명, 결제 완료일을 조회할 수 있습니다. <br>

	구매 상세 내역 페이지
목표: 고객이 구매한 상품들의 구매 상세 내역을 구매 상세 내역 페이지에서 확인할 수 있습니다. <br>
구현계획: 고객이 구매 내역 페이지에서 구매한 상품 내역 중 상세보기를 클릭하였을 때 구매 상세 내역 페이지로 이동합니다.
구매내역을 포함하고 DB에 PAY 테이블에서 구매 수량, 상품 가격, 선택 옵션, 마일리지 등을 조회할 수 있습니다. 또한, 내역 삭제를 클릭하면 구매 내역 페이지에서 상품 구매내역이 삭제되며 DB에 PAY 테이블에서도 상품 구매내역이 삭제되는 것을 확인할 수 있습니다. 그리고 돌아가기를 클릭 시 구매 내역 페이지로 이동할  수 있습니다. <br>

	장바구니 페이지
목표: 고객이 구매할 상품을 장바구니에 담을 수 있으며 장바구니에 담긴 상품을 구매할 수 있습니다. <br>
구현계획: 고객이 로그인 후 이메일을 통해 장바구니로 접근 가능하며, 상품 상세 페이지에서 옵션과 수량을 선택하여 장바구니에 상품을 담을 수 있습니다. 또한, 동일한 상품과 옵션을 장바구니에 담았을 때 수량만 증가 되도록 하였으며 DB에 CART 테이블에서 수량만 업데이트 되도록 하였습니다. 그리고 구매하기를 클릭하였을 때 구매 확인 페이지로 이동하며 상품 정보를 조회 할 수 있습니다.장바구니 페이지에서 삭제 버튼을 클릭 시 상품이 삭제가 되며 DB에 CART 테이블에서 상품이 삭제가 됩니다. <br>

<h2>디자인</h2>

[상품 상세 페이지]<br>

![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/83258dc3-0981-4ad8-b617-9caee9b38bc3)

[장바구니 페이지]<br>

![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/2eafe566-7352-46ad-ae95-26ecedd712ee)

[구매 확인 페이지]<br>

![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/e43e11cc-8d4c-43f9-83dd-c44abe11b667)

[상품구매]<br>

![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/f25afbcf-4624-4577-a54a-d0ad0379eadf)

[토스페이 간편결제]<br>
![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/91bf670a-f6d4-4fe6-9f54-4804c8284c91)

[카카오페이 간편결제]<br>
![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/69570930-2564-4603-a538-3db96a2b0b83)
![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/04b65770-5798-4b75-bb88-a5194ca45a06)
![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/07b8a6d0-e717-40bf-97c2-8e5c76865246)

[주문 내역 페이지]<br>
![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/6ca9c1f1-3829-4bc3-8727-b950d0655e7e)

[구매 상세 내역 페이지]<br>

![image](https://github.com/JOOTAEHYEON/Petopia-Project1/assets/161558492/e2bb1705-0f29-4ea6-9a1e-b5562211938d)








