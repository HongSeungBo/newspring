<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<form action="/member/modify" method="post">
<c:set value="${my }" var="my"></c:set>
	<table class="table">
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email" value="${my.email }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pwd" value="${my.pwd }">
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>
				<input type="text" name="nickName" value="${my.nickName }">
			</td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td>
				<input type="text" name="ragAt" value="${my.regAt }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>마지막로그인날짜</th>
			<td>
				<input type="text" name="lastLogin" value="${my.lastLogin }" readonly="readonly">
			</td>
		</tr>
	</table>
	<button type="submit" class="btn btn-primary">수정</button>
	<a href="/member/remove?email=${my.email }"><button type="button" class="btn btn-danger">회원탈퇴</button></a>
	<a href="/"><button type="button" class="btn btn-outline-info">홈으로</button></a>
</form>
</body>
</html>