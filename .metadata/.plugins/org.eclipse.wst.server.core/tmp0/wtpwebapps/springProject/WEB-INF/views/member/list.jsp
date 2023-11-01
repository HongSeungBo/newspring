<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../common/nav.jsp"></jsp:include>
	<table class="table">
		<tr>
			<th>이메일</th>
			<th>닉네임</th>
			<th>가입 날짜</th>
			<th>마지막 로그인</th>
		</tr>
		<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.email }</td>
				<td>${list.nickName }</td>
				<td>${list.regAt }</td>
				<td>${list.lastLogin }</td>
			</tr>
		</c:forEach>
	</table>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>