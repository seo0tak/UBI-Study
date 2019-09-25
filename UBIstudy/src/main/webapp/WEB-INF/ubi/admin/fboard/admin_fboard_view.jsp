<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="content">
<table border=1>
	<tr>
		<th>글쓴이</th>
		<th>글 번호</th>
		<th>제목</th>
		<th>내용</th>
	</tr>
	<tr>
		<td>${bean.name }</td>
		<td>${bean.num }</td>
		<td>${bean.title }</td>
		<td>${bean.content }</td>
	</tr>
</table>
야호!.jsp
</section>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>