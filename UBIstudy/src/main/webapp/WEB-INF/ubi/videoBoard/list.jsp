<%@page import="ubi.model.Fav_VideoBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		background-image: url("<%=request.getContextPath()%>/resources/images/project_img8-3.png");
	}
	.vidClick{
		cursor: pointer;
	}
	.eft2{
		position:absolute;
		z-index: 15;
		min-width: 100%;
		min-height: 100%;
		background-color: rgba(0,0,0,0.5);
		left: 0px;
		top: 0px;
		position: fixed;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	<%int k=0;%>
	<%ArrayList<Fav_VideoBean> fav=(ArrayList<Fav_VideoBean>)request.getAttribute("fav");%>
	var ln=1;
	$('.hiddenContents').hide(0,function(){
		<%for(int i=0;i<4;i++){%>
		$("#a<%=k+1+i%>").show();
		$("#b<%=k+1+i%>").show();
		<%}%>
	});
	
	$('.moreVideo').click(function(){
		ln=ln+4;
		var i=0;
		<%
		for(int i=0;i<4;i++){
		%>
		i=i+1;
		$("#a"+(ln+i)).show();
		$("#b"+(ln+i)).show();
		<%}%>
	});
	
	$('.vidClick').click(function(){
		var loginId=localStorage.getItem("loginId");
		if(loginId==null){
			alert("회원만 영상을 볼 수 있습니다.");
		}else{	
			var urlCode=$(this).attr("id");
			var urlTitle=$(this).attr("alt");
			
			$("#videoDiv_Video").attr("src",urlCode);
			$("#videoDiv_Title").html(urlTitle);
			$("#videoDiv").animate({opacity:'1'},0).show("fade",50);
		}
		
	}).mouseover(function(){
		$(this).stop().animate({opacity:'1'},100);
	}).mouseout(function(){
		$(this).stop().animate({opacity:'0.2'},100);
	});
	
	$('.closeX2').click(function(){
		$('.eft2').hide("fade",100);
	});
	
	var tot=${totalCount};
	var fav_tot=${favCount};
	
	var jbAry = new Array();
	
	for(var i=0;i<fav_tot;i++){
		jbAry[i]=$('#f'+i).val();
		//alert(jbAry[i]);
	}
	
	var loginId=localStorage.getItem("loginId");
	if(loginId==null){
		
	}else{		
	for(var i=0;i<tot;i++){
		
		for(var j=0;j<fav_tot;j++){
			var vid=$('#a'+(i+1)+" .favSpan").attr("id");
			var vidnum=jbAry[j];
			if(vid==vidnum){
				var vid=$('#a'+(i+1)+" .favSpan").html('<img src="<%=request.getContextPath()%>/resources/images/project_img9.png" width="30px">');
			}
		}
	}
	}
	
});
</script>
</head>
<body>
<%@ include file="../top.jsp" %>

<c:forEach items="${fav }" var="fa" varStatus="i">
<input type="hidden" value="${fa.videonum }" id="f${i.index}">
</c:forEach>

<div style="background-color: rgba(255,255,255,0.8); padding: 40px;box-shadow: 0px 10px 8px 8px rgba(255,255,255,0.8);padding-left: 100px;">
<span style="font-size: 50px;">
영상 게시판
</span><br>
<hr color="#ddd">
<span style="font-size: 15px;">
조회된 게시물 수 : ${totalCount }
</span>
</div>


<div style="text-align: center;padding: 50px;">

<div style="background-color: white;box-shadow: 0px 0px 10px 10px white;width: 70%;margin: auto;">
<input type="button" class="button1" value="전체보기" onclick="location.href='videoboard_list.ubi'">
<input type="button" class="button1" value="C" onclick="location.href='videoboard_key.ubi?key=c'">
<input type="button" class="button1" value="Java" onclick="location.href='videoboard_key.ubi?key=java'">
<input type="button" class="button1" value="Python" onclick="location.href='videoboard_key.ubi?key=python'">
</div>
</div>


<div style="text-align: center;margin: auto;width: 70%;margin-bottom: 50px;">
<table style="margin: auto;width: 100%;background-color: rgba(255,255,255,1);box-shadow: 0px 0px 10px 10px white;">

<c:forEach items="${lists }" var="list">
<%k+=1; %>

<tr id="a<%=k%>" class="hiddenContents">
<td style="text-align: left;">
<!-- 
 	<iframe width="320" height="180" src="${list.url }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 -->
 <img src="<%=request.getContextPath()%>/resources/images/default2.png" width="320" height="180" style="opacity: 0.2;" id="${list.url }" class="vidClick" alt="${list.title }">
</td>
<td style="text-align: left;width: 80%;vertical-align: top;">
<br>
<span style="font-size: 35px;margin-left: 10px;">${list.title }<span id="${list.num }" class="favSpan" style="color:rgba();"></span>
</span><br>
<span style="font-size: 20px;color: rgba(0,0,0,0.3);margin-left: 10px;">${list.day }</span><br><br>
<span style="margin-left: 10px;">${list.content }</span>
</td>
<td style="padding: 20px;">
가격<hr>
<span style="font-size: 30px;">${list.price }</span>
</td>
</tr>
<tr><td colspan="3"  id="b<%=k%>" class="hiddenContents"><br><hr><br></td></tr>

</c:forEach>
</table>
</div>


<div style="text-align: center;margin-bottom: 200px;cursor: pointer;" class="moreVideo">
	<div style="text-align: center;background-color: rgb(255,255,255);box-shadow: 0px 0px 10px 10px white;width: 20%;margin: auto;padding: 30px;">
<span style="font-size: 30px; color: rgba(0,0,0,0.5);">영상 더보기</span><br>
<span style="font-size: 18px; color: rgba(0,0,0,0.3);">
UBI-STUDY
<br>
▼</span>
	</div>
</div>



<div class="eft2" id="videoDiv" style="opacity: 0;">
	<div style="width:60%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 10px;padding: 50px;padding-top: 10px;font-size: 20px;color: black;">
		<p style="text-align: right;font-size: 30px;cursor: pointer;">
			<span class="closeX2">X</span> 
		</p>
		<span style="font-size: 40px;" id="videoDiv_Title">
			
		</span>
		<hr>
		<div style="text-align: center;height:;"> 
		<iframe id="videoDiv_Video" width="100%" height="500px;"  src="" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		
		
		
		
	</div>
</div>







<%@ include file="../bottom.jsp" %>
</body>
</html>