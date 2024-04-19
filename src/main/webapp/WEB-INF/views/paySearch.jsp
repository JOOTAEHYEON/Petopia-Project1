<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상품 예약내역</h1><hr>
<form action="paySearch.do">

	<table>
		<tr>
			<td>imp_uid</td>
			<td><input type="text" name="imp_uid" value="${payVO.imp_uid}"></td>
		</tr>
		<tr>
			<td>merchant_uid</td>
			<td><input type="text" name="merchant_uid" value="${payVO.merchant_uid}"></td>
		</tr>
		<tr>
			<td>name</td>
			<td><input type="text" name="name" value="${payVO.name}"></td>
		</tr>		
		<tr>
			<td>buyer_name</td>
			<td><input type="text" name="buyer_name" value="${payVO.buyer_name}"></td>
		</tr>		
		<tr>
			<td>buyer_tel</td>
			<td><input type="text" name="buyer_tel" value="${payVO.buyer_tel}"></td>
		</tr>		
		<tr>
			<td>buyer_addr</td>
			<td><input type="text" name="buyer_addr" value="${payVO.buyer_addr}"></td>
		</tr>		
		<tr>
			<td>buyer_email</td>
			<td><input type="text" name="buyer_email" value="${payVO.buyer_email}"></td>
		</tr>		
		<tr>
			<td>amount</td>
			<td><input type="text" name="amount" value="${payVO.amount}"></td>
		</tr>		
		<tr>
			<td>priceCnt</td>
			<td><input type="text" name="priceCnt" value="${payVO.priceCnt}"></td>
		</tr>		
		<tr>
			<td>point</td>
			<td><input type="text" name="point" value="${payVO.point}"></td>
		</tr>		
	</table>
</form>
	
	<div>

  <a href="payDelete.do?buyer_email=${payVO.buyer_email }">[삭제]</a>
	</div>
	
</body>
</html>