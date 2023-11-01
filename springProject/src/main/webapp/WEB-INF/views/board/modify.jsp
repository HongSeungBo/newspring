<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보</title>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<form action="/board/modify" method="post" enctype="multipart/form-data">
<c:set value="${BoardDTO.bvo }" var="detail"></c:set>
<table class="table">
	<tr>
		<th>글번호</th>
		<td>
			<input type="text" name="bno" value="${detail.bno }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" name="writer" value="${detail.writer }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="title" value="${detail.title }">
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea rows="5" cols="50" name="content">${detail.content }</textarea>
		</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${detail.readCount }</td>
	</tr>
	<tr>
		<th>댓글수</th>
		<td>${detail.cmtQty }</td>
	</tr>
	<c:forEach items="${BoardDTO.flist }" var="file">
	<tr>
		<th>첨부파일</th>
		<td>
			${file.fileName }
		<button type="button" class="fileDelBtn btn btn-outline-danger" data-uuid="${file.uuid }">X</button>
		</td>
	</tr>
	</c:forEach>
</table>
<div class="mb-3" id="fileZone">
	여기에 표시 되어야 함
</div>
<input type="file" id="files" name="files" multiple="multiple" style="display:none;">
<button type="button" id="trigger" class="btn btn-outline-secondary">첨부파일</button>
<button type="submit" class="btn btn-primary" id="regBtn">수정</button>
<a href="/board/detail?bno=${detail.bno }"><button type="button" class="btn btn-light">취소</button></a>
</form>
<jsp:include page="../common/footer.jsp"></jsp:include>
<script>
let bnoVal = `<c:out value="${detail.bno}" />`;
console.log(bnoVal);
</script>
<script type="text/javascript" src="/resources/js/BoardFile.js"></script>
<script type="text/javascript" src="/resources/js/BoardRegister.js"></script>
</body>
</html>