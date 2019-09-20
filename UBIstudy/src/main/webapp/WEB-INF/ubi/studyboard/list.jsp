<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.button2{
		padding: 15px;
		border: 1px solid #ccc;
		background-color: white;
		padding-right:40px;
		padding-left:40px;
		font-size: 20px;
		cursor: pointer;
	}
	.button2:hover{
		border: 1px solid #fa0;
		color:#fa0;
	}
</style>
</head>
<body>
<div id="div2" class="smallTitle1" style="margin-top: 60px;">
<%for(int i=0;i<3;i++){ %>
	<div style="margin: auto;border-bottom:1px solid black;width: 1000px;height: 200px;margin-top: 50px;text-align: left;">
		<img src="<%=request.getContextPath()%>/resources/images/default1.png" style="float: left;margin-right: 20px;" width="190px" height="190px;">
		<span style="font-size:30px;">title<%=i %></span>
		<br>
		<br>
		<span style="font-size: 20px;">contents/memo/<%=i %></span><br>
		<p style="text-align: right;"><input type="button" value="참여" class="button2" id="<%=i%>"></p> 
	</div>
<%}%>
</div>
</body>
</html>
<%@ include file="../bottom.jsp" %>