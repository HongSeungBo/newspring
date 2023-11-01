<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/board/list">리스트</a>
        </li>
        <sec:authorize access="isAuthenticated()">
        	<!-- 사용자 정보는 principal -->
        	<sec:authentication property="principal.mvo.email" var="authEmail"/>
        	<sec:authentication property="principal.mvo.nickName" var="authNick"/>
        	<sec:authentication property="principal.mvo.authList" var="auths"/>
        	
        	<c:choose>
        		<c:when test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get() }">
        			<li class="nav-item">
        				<a class="nav-link" href="/member/list">ADMIN > ${authEmail }</a>
        			</li>
        		</c:when>
        		<c:otherwise>
        			<li class="nav-item">
        				<a class="nav-link" href="/member/detail?email=${authEmail }">${authNick }</a>
        			</li>
        		</c:otherwise>
        	</c:choose>
			<li class="nav-item">
			   <a class="nav-link" href="/board/register">글쓰기</a>
			</li>
	        
	    	<li class="nav-item">
	    	    <a class="nav-link" href="/member/logout" id="logoutLink">로그아웃</a>
		    </li>
	    	<li class="nav-item">
	    	    <a class="nav-link" href="/member/modify?email=${authEmail }" id="memmodify">회원정보 수정</a>
		    </li>
	        <form action="/member/logout" method="post" id="logoutForm">
	    	    <input type="hidden" name="email" value="${authEmail }">
	        </form>
        </sec:authorize>
	    
	    <sec:authorize access="isAnonymous()">
	        <li class="nav-item">
	          <a class="nav-link" href="/member/login">로그인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/member/register">회원가입</a>
	        </li>
	    </sec:authorize>
      </ul>
    </div>
  </div>
</nav>
	</header>
<script type="text/javascript">
document.getElementById('logoutLink').addEventListener('click',function(e){
	e.pr	eventDefault();
	document.getElementById('logoutForm').submit();
})
</script>
</body>
</html>