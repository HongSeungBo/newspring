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
<form action="/member/login" method="post">
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">이메일</label>
		<input type="text" class="form-control" name="email" placeholder="이메일">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">비밀번호</label>
		<input type="text" class="form-control" name="pwd" placeholder="비밀번호">
	</div>
	<c:if test="${not empty param.errMsg }">
		<div class="mb-3 text-danger">
			<c:choose>
				<c:when test="${errMsg eq 'Bad credentials' }">
					<c:set var="errText" value="비밀번호가 일치하지 않습니다."></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="errText" value="이메일을 확인해주세요."></c:set>
				</c:otherwise>
			</c:choose>
			${errText }
		</div>
	</c:if>
	<button type="submit" class="btn btn-outline-primary">로그인</button>
	<a href="/"><button type="button" class="btn btn-outline-info">취소</button></a>
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>