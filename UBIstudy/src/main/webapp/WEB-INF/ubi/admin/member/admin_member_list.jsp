<%@ page session="false"%>
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
	<table border=1 align="center">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>폰번호</th>
			<th>가입날짜</th>
		</tr>
		<c:forEach items="${lists }" var="am">
			<tr>
				<td>${am.num }</td>
				<td>${am.id }</td>
				<td>${am.name }</td>
				<td>${am.email }</td>
				<td>${am.pnum }</td>
				<td>${am.day }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
<%@include file="../footer.jsp"%>