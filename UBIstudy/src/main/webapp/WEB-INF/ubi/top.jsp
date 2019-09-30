<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=request.getContextPath() %>/resources/sweetalert/js/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sweetalert/css/sweetalert2.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sweetalert/css/animate.css">
<title>Insert title here</title>
<style type="text/css">
	@font-face{
		font-family: 'NIXGONFONTS';
		src: url("<%=request.getContextPath()%>/resources/font/NIXGONFONTS M 2.0.ttf") format('truetype');
	}
	body{
		font-family: NIXGONFONTS;
		 margin: 0;
    	padding: 0;
	}
	input{
		font-family: NIXGONFONTS;
	}
	#divTop{
		min-width: 100%;
		
		height: 50px;
		background-color: rgba(0,0,0,1);
		/* border-bottom: 1px solid rgba(133,119,105,1); */
		box-shadow: 0px 0px 5px 5px rgba(0,0,0,0.2);
	}
	#divTop_in{
		min-width: 100%;
	}
	#top_mid span{
		color: rgba(217,217,217,1);		
	}
	#top_top{
		position: absolute;
		left: 50px;
		top: 0px;
	}
	#top_mid{
		text-align: center;
		padding: 14px;
	}
	#top_bot{
		position: absolute;
		right:10px;
		top: 7px;
	}
	.topBut1{
		font-size: 18px;
		cursor:pointer;		
	}
	.button1{
		cursor:pointer;		 
		border-radius: 3px 3px 3px 3px;
		border: 1px solid rgb(150,150,150);
		background-color: black;
		font-size:18px;
		color: rgb(170,170,170);
		padding:6px;
		padding-left: 30px;
		padding-right: 30px;
	}
	#gotoTop{
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
	
/* 바운스 로딩 */
.shadow{
  z-index:100;
  width:60px;
  height:4px;
  background-color:rgba(0,0,0,.1);
  border-radius:3px;
  animation:shadow 5s ease-in-out infinite;
  margin:auto;
  position:absolute;
  bottom:-4px;
  left:0;
  right:0;
}

@keyframes shadow{
  0%{
    width:60px;
  }
  10%{
    width:10px;
  }
  20%{
    width:60px;
  }
  30%{
    width:10px;
  }
  40%{
    width:60px;
  }
  50%{
    width:10px;
  }
  60%{
    width:60px;
  }
  70%{
    width:10px;
  }
  92%{
    width:10px;
  }
  100%{
    width:60px;
  }
}


.logo{ 
  z-index:100;
  position:absolute;
  bottom:0;
  text-algin:center;
  color:#3498db;
  font-size:25px;
  margin-left:-5px;
  opacity:0;
  animation: logo 5s ease-in-out infinite;
}

@keyframes logo{
  0%{
    transform:translateY(0);opacity:0;
  }
  59%{
    transform:translateY(0);opacity:0;
  }
  60%{
    opacity:1;
  }
  70%{
    transform:translateY(-95px);
  }
  92%{
    transform:translateY(-95px);
  }
  100%{
    transform:translateY(0);opacity:1;
  }
}

.loading{
  display:block;
  z-index:100;
  width:60px;
  height:250px;
  position:Relative;
  margin: auto;
  position: absolute;
  top: 50%; left: 50%;
  -webkit-transform: translate(-50%,-50%);
      -ms-transform: translate(-50%,-50%);
          transform: translate(-50%,-50%);
}

.circle{
  z-index:100;
  width:55px;
  height:55px;
  border:2px solid #2ecc71;
  /* background-color:#FFFFFF; */
  border-radius:50%;
  position:absolute;
  bottom:0;
  animation: circle 5s ease-in-out infinite;
}

@keyframes circle{
  0%{
    transform:translateY(0);
  }
  10%{
    transform:translateY(-190px);
  }
  20%{
    transform:translateY(0) scaleY(1.2);opacity:1;
  }
  20.1%{
    opacity:0;
  }
  100%{opacity:0;}
}

.square{
  z-index:100;
  width:55px;
  height:55px;
  border:2px solid #f1c40f;
  /* background-color:#FFFFFF; */
  position:absolute;
  bottom:0;
  opacity:0;
  animation: square 5s ease-in-out infinite;
}

@keyframes square{
  0%{
    transform:translateY(0);opacity:0;
  }
  19%{
    transform:translateY(0);opacity:0;
  }
  20%{
    opacity:1;
  }
  30%{
    transform:translateY(-190px) rotate(90deg);
  }
  40%{
    transform:translateY(0) rotate(180deg);opacity:1;
  }
  40.1%{
    transform:translateY(0);opacity:0;
  }
  100%{opacity:0;}
}

.triangle{
  z-index:100;
  width:0;
  height:0;
  border-left:30px solid transparent;
  border-right:30px solid transparent;
  border-bottom:50px solid #9b59b6;
  position:absolute;
  bottom:0;
  animation: triangle 5s ease-in-out infinite;
  opacity:0;
}

.triangle::after{
  z-index:100;
  content:"";
  width:0;
  height:0;
  border-left:26px solid transparent;
  border-right:26px solid transparent;
  border-bottom:44px solid white;
  position:absolute;
  bottom:-48px;
  left:-26px;
}


@keyframes triangle{
  0%{
    transform:translateY(0);opacity:0;
  }
  39%{
    transform:translateY(0);opacity:0;
  }
  40%{
    opacity:1;
  }
  50%{
    transform:translateY(-190px) rotate(60deg);
  }
  60%{
    transform:translateY(0) rotate(120deg);opacity:1;
  }
  60.1%{
    transform:translateY(0);opacity:0;
  }
  100%{opacity:0;}
}
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%
	String[] util={"스터디 그룹","동영상 강의","자유 게시판","공지"};
	String[] ubi={"studyboard_list.ubi","videoboard_list.ubi","freeboard_list.ubi","notiboard_list.ubi"};
	session.setMaxInactiveInterval(24*60*60);
%>
<script type="text/javascript">
	$(function(){
		
		//esc키누르면 x클릭함
		$(document).keyup(function(key) {
			if (key.keyCode == 27) {
				$('.closeX').click();
			}
		});
		
		$(window).load(function() {
			    $('.loading').hide();  
		});
		
		var animationSpeed=300;
		$('.topBut1').mouseover(function(){
			$(this).stop().animate({
				color:'rgb(255,217,102)'
			},animationSpeed);
		}).mouseout(function(){
			$(this).stop().animate({
				color:'rgb(217,217,217)'
			},animationSpeed);
		});
		$('.button1').mouseover(function(){
			$(this).stop().animate({
				backgroundColor:'rgb(255,255,255)',
				color:'black'
			},animationSpeed);
		}).mouseout(function(){
			$(this).stop().animate({
				backgroundColor:'rgb(0,0,0)',
				color:'rgb(170,170,170)'
			},animationSpeed);
		});

		$('#gotoTop').mouseover(function(){
			$(this).stop().animate({
				color:'rgba(255,192,0,1)'
			},animationSpeed);
		}).mouseout(function(){
			$(this).stop().animate({
				color:'rgba(0,0,0,0.2)'
			},animationSpeed);
		}).click(function(){
			$('html, body').animate({
				 scrollTop : 0
			}, 400);
		});
		
		$('.studyboardDiv').hide();
		$('.topBut1').click(function(){
			var topId=$(this).attr("id");
			if(topId=="studyboard_list.ubi"){
				//스터디그룹
				$('#studyboardDiv').animate({
					opacity:1
				},0);
				$('#studyboardDiv').show(200);
				$('.closeX').click(function(){
					$('.eft2').hide("fade",1,function(){
						location.reload();					
					});
				});
			}
			else{
				location.href=topId;
			}
		});
		$('.loginDiv').hide();
		
		$('#login').click(function(){
			$('#loginDiv').animate({
				opacity:1
			},0);
			$('#loginDiv').show(200);
			
		});
		$('.eft2').hide();
		
		$('.closeX').click(function(){
			$('.eft2').hide("fade",1,function(){
				location.reload();					
			});
		});
		
		//회원가입
		$('#join').click(function(){
			location.href="register.ubi";
		});
		
		$('#loginBut').click(function(){
			$('#idMs').html("");
			$('#idPw').html("");
			var input_id=$('#loginId').val().trim();
			var input_pw=$('#loginPw').val().trim();
			
			$.ajax({
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        url:"login.ubi",
		        data : {id : input_id},
		        success: function(cnt){
		            //alert("success");
		            //alert("su : "+cnt);
					var strArray=cnt.split('/');
		            var c=strArray[0];
		            var nt=strArray[1];
		            var proof=strArray[2];
		            var nick=strArray[3];
		            //var countchk=strArray[4];
		            //alert(cnt);
		            //alert(nick);
		            //alert(proof);
		            if(input_id==""){
		            	$('#idMs').html("※아이디를 입력하세요.※");
		            }
		            else if(input_pw==""){
		            	$('#idPw').html("※비밀번호를 입력하세요.※");
		            }
		            else if(c==0){
		            	$('#idMs').html("※이딴 아이디는 존재하지 않습니다.※");
		            }else if(c==1){
		            	$('#idMs').html("");
		            	$('#idPw').html("");
		            	if(input_pw==nt){
		            		//로그인에 성공하였으니 이메일 인증이 되었는지 확인해야 한다.
		            		if(proof=="o"){
		            			$('.eft2').hide();
		            			localStorage.setItem("loginId", input_id);
		            			localStorage.setItem("nick", nick);
		            			/* localStorage.setItem("today_count", today_count); */
		            			loginId=localStorage.getItem("loginId");
		            			nick=localStorage.getItem("nick");
		            			/* if(countchk!="o"){
		            				localStorage.setItem("today_count", today_count+1);
		            				$.ajax({
		            					url:"countCheck.ubi",
		            					data: {id : loginIxd},
		            					success:function(){
		            						alert("countCheck변경성공");
		            					}
		            				})
		            			} */
		            			$('.logoutDiv').hide();
		            			$('.loginDiv').show();
		            			$('.loginDiv #nicknameLine').html(nick+"님 환영한다");
		            			location.reload();
		            		}
		            		else{
		            			Swal.fire({
									 title: '이메일 인증이 필요합니다!!',
								  	 type: 'warning',
									 confirmButtonText: '확인',
									 width: '50%',
								})
		            		}
		            		
		            	}else{
		            		$('#idPw').html("※비밀번호가 틀렸습니다.※");
		            	}
		            	
		            }
		            
		        },
		        error: function(cnt) {
		            //alert("error");
		            var cnt=JSON.stringify(cnt);
		            alert("er : "+cnt);
		        	location.reload();
		        }
		    });
			
		});
		var loginInfo=$('#loginInfo').val();
		if(loginInfo==0){
		}else{
			$('#loginDiv').animate({
				opacity:1
			},0);
			$('#loginDiv').show(200);
		}
		
		$('.loginDiv').hide();
		
		//localStorage.setItem("loginId", "");
		//var loginId=localStorage.setItem("loginId", "");;
		var loginId=localStorage.getItem("loginId");
		var nick=localStorage.getItem("nick");
		if(loginId==null){}
		else{
			$('.logoutDiv').hide();
			$('.loginDiv').show();
			$('.loginDiv #nicknameLine').html(nick+"님 환영한다");
		}
		
		$('#UserLogout').click(function(){{
			localStorage.removeItem('loginId');
			localStorage.removeItem('nick');
			location.reload();
		}});
		
		$('#myPage').click(function(){
			//alert(loginId);
			if(loginId=="admin"){
				location.href="admin_main.ubi";
			}else{
				location.href="user_myPage.ubi?id="+loginId;
			}
		});
		
		var menuFlag=0;
		$('#menuCont').hide();
		$('#menuIcon').click(function(){
			//alert(menuFlag);
			if(menuFlag==0){
				menuFlag=1;
				$('#menuCont').show("blind",100);
			}else if(menuFlag==1){
				menuFlag=0;
				$('#menuCont').hide("blind",100);
			}
		});
		
		$('#menuIcon').mouseover(function(){
			$('#menuEft').stop().animate({
				'borderColor': '#fa1'
			},100);
		}).mouseout(function(){
			$('#menuEft').stop().animate({
				'borderColor': 'rgba(100,100,100,1)'
			},100);
		});
		
		$('#myForm').submit(function() {
		    $('.loading').hide();
		});
		
	});
	
function online() {
	var login = localStorage.getItem("loginId");
	if(login==null){
		Swal.fire({
			 title: '로그인을 해주세요!!',
		  	 type: 'warning',
			 confirmButtonText: '확인',
			 width: '40%',
		})
	}
	else{
		location.href="study_list.ubi?nick="+localStorage.getItem("nick");
	}
	/* //참여한 모임이 없으면 못들어감
	else if(){
		
		location.reload();
	} */
}

</script>
</head>
<body>
<div class="loading">
  <div class="circle"></div>
  <div class="square"></div>
  <div class="triangle"></div>
  <div class="logo">UBI STUDY</div>
<div class="shadow"></div>
</div>


<div id="divTop">

	<div id="divTop_in">
	<div id="top_top">
		<a href="main.ubi">
		<img src="<%=request.getContextPath()%>/resources/images/logo1.png" width="250px" height="50px" style="cursor: pointer;">
		</a>
	</div>
	<div id="top_mid"><!--top메뉴의 중간 기능선택부분-->
		<span class="topBut1" id="<%=ubi[0]%>"><%=util[0]%></span>
		<%for(int i=1;i<util.length;i++){%>	
		<span>　│　</span>
		<span class="topBut1" id="<%=ubi[i]%>"><%=util[i]%></span>
		<%}%>
	</div>	
	<div id="top_bot" class="logoutDiv">
		<input type="button" value="로그인" id="login" class="button1">
		<input type="button" value="회원가입" id="join" class="button1">
	</div>
	
	<div id="top_bot" class="loginDiv" style="width: 500px;" align="right">
		<div id="menuEft" style="float: right;border-radius: 7px 7px 7px 7px; border: 1px solid rgba(100,100,100,1); text-align: center;" align="right"><span>
			<img src="<%=request.getContextPath()%>/resources/images/menu.png" width="35px" id="menuIcon">
		</span></div>
		<div style="float: right;padding: 10px;" align="right"><span style="color:white;margin-right: 20px;" id="nicknameLine"></span></div>
		<br>
		<div style="position: absolute;right: 0px;top: 50px;background-color: black;padding: 10px;border-radius: 7px 7px 7px 7px; border: 1px solid white; text-align: center;" id="menuCont">
			<input type="button" class="button1" value="마이페이지" style="margin-top: 10px;" id="myPage"><br>
			<input type="button" class="button1" value="로그아웃" style="margin-top: 10px;" id="UserLogout">
		</div>
	</div>
	
	
	</div>
	
</div>

<div style="width: 100px;height: 130px; background-color: rgba(255,255,255,0.0);position: absolute; right: 50px; bottom: 0px; position: fixed;text-align: center;">
	<span id="gotoTop" style="font-size: 40px;color: rgba(0,0,0,0.2);">▲
	<br>TOP
	</span>
	
</div>

<div class="eft2" id="loginDiv" style="opacity: 0;">
	<div style="width:60%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 100px;padding: 50px;padding-top: 10px;font-size: 20px;color: black;">
		<p style="text-align: right;font-size: 30px;cursor: pointer;">
			<span class="closeX">X</span> 
		</p>
		<span style="font-size: 40px;">Log In
		
		</span>
		<hr>
		
		<table style="margin: auto;font-size: 28px;margin-top: 50px;">
			<tr>
				<td>ID</td>
				<td><input id="loginId" type="text" class="input1" style="padding: 10px;font-size: 25px;margin-left: 50px;">
				<br><span id="idMs" style="font-size: 20px;color: red;margin-left: 50px;"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="color: #ddd;text-align: center;">
				◇◇◇◇◇
				</td>
			</tr>
			<tr>
				<td>PassWord</td>
				<td><input id="loginPw" type="password" class="input1" style="padding: 10px;font-size: 25px;margin-left: 50px;">
				<br><span id="idPw" style="font-size: 20px;color: red;margin-left: 50px;"></span>
				</td>
			</tr>
		</table>
		<p style="text-align:right; "><input type="submit" value="Log In" class="button1" id="loginBut"></p>
	</div>
</div>

<div class="eft2" id="studyboardDiv" style="opacity: 0;">
	<div style="width:40%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 100px;padding: 50px;padding-top: 10px;font-size: 20px;color: black;">
		<p style="text-align: right;font-size: 30px;cursor: pointer;">
			<span class="closeX">X</span>
		</p>
		<table style="margin:auto;width: 80%;">
			<tr>
				<td align="center" onClick="online()" onmouseover="this.style.border='2px solid #fa1'" onmouseout="this.style.border='2px solid white'" style="cursor:pointer;width:50%">
					<img style="width: 100%" src="<%=request.getContextPath()%>/resources/images/online_icon.png"/><br><br>
					<span style="font-size: 35px">온라인</span>
				</td>
				<td>
					<div style="width: 50px"></div>
				</td>
				<td align="center" onClick="location.href='studyboard_list.ubi'" onmouseover="this.style.border='2px solid #fa1'" onmouseout="this.style.border='2px solid white'" style="cursor:pointer;width:50%">
					<img style="width: 100%" src="<%=request.getContextPath()%>/resources/images/offline_icon.png"/><br><br>
					<span style="font-size: 35px">오프라인</span>
				</td>
			</tr>
		</table>
	</div>
</div>

<input type="hidden" value="${login}" id="loginInfo">

</body>
</html>