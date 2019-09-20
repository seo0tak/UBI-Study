<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.listOne{
		border: 1px solid #fff;
		padding: 15px;
	}
	.eft1{
		border: 1px solid #fff;
	}
	body{
		background-image: url("<%=request.getContextPath()%>/resources/images/project_img8-3.png");
		/* background-size: 100%;
		background-repeat: no-repeat; */
	}
	#detailCon{
		
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
	.input1{
		resize: none;
		width: 500px;
		font-size: 22px;
		outline-color: #fa1;
		outline-width: 2px;
		border: 1px solid white;
		border-bottom: 1px solid gray;
		background-color: #fafafa;
	}
	.input1[type=password]{
		font-family: initial;
	}
	input{
		outline-color: #fa1;
		outline-width: 2px;
	}
	#divTop{
		z-index: 10;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	
	var pw1="";
	var fid1="";
	
	var name1="";
	var title1="";
	var content1="";
	var ref1=0;
	var re_level1=0;
	
	$('.eft2').hide();
	
	$('.eft1').mouseover(function(){
		$(this).stop().animate({
			color:'#fa1'
		},100);
	}).mouseout(function(){
		$(this).stop().animate({
			color:'black'
		},100);
	}).click(function(){
		fid1=$(this).attr("id");
		$.ajax({
			 	type:"POST",
		        url:"read_count_update.ubi",
		        data : {id : fid1},
		        success: function(){
		            //alert("success");			            
		        },
		        error: function() {
		            //alert("error");
		        }
		    });
		
		var read_count=$('#'+fid1+' input[name=read_count]').val();
		name1=$('#'+fid1+' input[name=name]').val();
		title1=$('#'+fid1+' input[name=title]').val();
		content1=$('#'+fid1+' input[name=content]').val();
		var day=$('#'+fid1+' input[name=day]').val();
		
		pw1=$('#'+fid1+' input[name=pw]').val();
		ref1=$('#'+fid1+' input[name=ref]').val();
		re_level1=$('#'+fid1+' input[name=re_level]').val()*1;
		
		
		
		$('#detailCon #read_count').html("조회수 〔"+(read_count*1+1)+"〕");
		$('#detailCon #name').html(name1);
		$('#detailCon #title').html("◇"+title1);
		$('#detailCon #content').html(content1);
		$('#detailCon #day').html(day);
		
		$('#detailCon').animate({opacity:'1'},0);
		$('#FreeBoardInput').animate({opacity:'1'},0);
		$('#InputPassword').animate({opacity:'1'},0);
		
		
		$('#detailCon').show("fade",100);
		
	});
	
	
	var nowTime=new Date();
	var total=$('#total').val();
	var dbTime="";
	for(var i=1;i<=total;i++){
		dbTime=$('#time'+i).val();
		var y=dbTime.substr(0,4)*1,now_y=nowTime.getFullYear();
		var m=dbTime.substr(5,2)*1,now_m=nowTime.getMonth()+1;
		var d=dbTime.substr(8,2)*1,now_d=nowTime.getDate();
		var h=dbTime.substr(11,2)*1,now_h=nowTime.getHours();
		var mn=dbTime.substr(14,2)*1,now_mn=nowTime.getMinutes();
		
		if(now_y>y){
			$('#timeLook'+i).html((now_y-y)+"년 전");
		}else{
			if(now_m>m){$('#timeLook'+i).html(now_m-m+"달 전");}
			else{
				if(now_d>d){$('#timeLook'+i).html(now_d-d+"일 전");}
				else{
					if(now_h>h){$('#timeLook'+i).html(now_h-h+"시간 전");}
					else{
						if(now_mn>mn&&now_mn-mn>10){$('#timeLook'+i).html(now_mn-mn+"분 전");}
						else{
							$('#timeLook'+i).html("<img src=\"<%=request.getContextPath()%>/resources/images/new1.gif\" width=\"35px\">");
						}
					}
				}
			}
		}
	}
});
</script>
</head>
<body>
<div style="background-color: rgba(255,255,255,0.8); padding: 40px;box-shadow: 0px 10px 8px 8px rgba(255,255,255,0.8);padding-left: 100px;">
<span style="font-size: 50px;">
스터디 모임
</span><br>
<hr color="#ddd">
<span style="font-size: 15px;">
스터디 모임 수 : ${totalCount }
</span>
</div>

<div style="position: absolute;left: 10px; bottom: 10px; position: fixed;"> 
	<input id="inputBut" type="button" value="글쓰기" style="font-size: 25px; background-color: rgba(255,255,255,1); border: 1px solid #ccc; padding: 10px;padding-right: 50px;padding-left: 50px;">
</div>

<div style="margin: 100px;text-align: center;">
	<table style="margin: auto;width: 85%;background-color: rgba(255,255,255,1);box-shadow: 0px 0px 10px 10px rgba(255,255,255,1);text-align:left;border-collapse: collapse;">
		<tr>
			<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: left;padding: 5px;">제목</td>
			<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: center;padding: 5px;">작성자</td>
			<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: center;padding: 5px;">작성일</td>
			<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: center;padding: 5px;">조회수</td>
		</tr>
	</table>
</div>
</body>
</html>
<%@ include file="../bottom.jsp" %>