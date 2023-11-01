<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<!-- 검색 -->
   <div class="input-group mb-3">
<form class="d-flex" role="search" action="/board/list" method="get">
<c:set value="${ph.pgvo.type }" var="typed"></c:set>
<select name="type" class="form-control me-2" id="inputGroupSelect01">
    <option ${typed eq null ? 'selected':'' }>Choose...</option>
    <option value="t" ${typed eq 't' ? 'selected':'' }>제목</option>
    <option value="w" ${typed eq 'w' ? 'selected':'' }>작성자</option>
    <option value="c" ${typed eq 'c' ? 'selected':'' }>내용</option>
    <option value="twc" ${typed eq 'twc' ? 'selected':'' }>All</option>
  </select>
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword" value="${ph.pgvo.keyword }">
        <input type="hidden" name="pageNo" value="1">
        <input type="hidden" name="qty" value="${ph.pgvo.qty }">
        <button class="btn btn-primary position-relative" type="submit">Search
        	<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">${ph.totalCount }<span class="visually-hidden">unread messages</span></span>
        </button>
      </form>
</div>
<table class="table">
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>조회수</th>
		<th>댓글수</th>
		<th>첨부파일수</th>
		<th>작성일</th>
	</tr>
	<c:forEach items="${list }" var="list">
		<tr>
			<td><a href="/board/detail?bno=${list.bno }">${list.bno }</a></td>
			<td><a href="/board/detail?bno=${list.bno }">${list.writer }</a></td>
			<td><a href="/board/detail?bno=${list.bno }">${list.title }</a></td>
			<td>${list.readCount }</td>
			<td>${list.cmtQty }</td>
			<td>${list.hasFile }</td>
			<td>${list.regAt }</td>
		</tr>
	</c:forEach>
</table>
<a href="/board/register"><button type="button" class="btn btn-dark">글쓰기</button></a>

<!-- 페이징 -->
<nav aria-label="Page navigation example">
  <ul class="pagination">
  <!-- 이전 -->
    <li class="page-item ${(ph.prev eq false) ? 'disabled' : '' }">
      <a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty }&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
    	<li class="page-item"><a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty }&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword }">${i }</a></li>
    </c:forEach>
    <!-- 다음 -->
    <li class="page-item ${(ph.next eq false) ? 'disabled' : '' }">
      <a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty }&type=${ph.pgvo.type }&keyword=${ph.pgvo.keyword }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>