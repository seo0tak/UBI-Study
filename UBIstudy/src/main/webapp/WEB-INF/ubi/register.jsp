<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	background-image: url("<%=request.getContextPath()%>/resources/images/project_img8-3.png");
}
.err{
	font-size: 10pt;
	color: red;
	font-weight: bold;
}	
input{
	padding:5px;
	border-radius: 10px;
	border-bottom: 1px solid rgba(180,180,180,1) !important; 
}
input::placeholder {
  color: rgba(200,200,200,1);
}
</style>
<script type="text/javascript">
function checkId() {
	   var inputed = $('#checkaa').val();
	     $.ajax({
	         data : {
	             id : inputed
	         },
	         url : "checkId.ubi",
	         success : function(data) {
	            if (data == 0) {
	            	 $("#checkaa").css("background-color", "#B0F6AC");
	             } 
	            else if (data == 1) {
	            	$("#checkaa").css("background-color", "#FFCECE");
	                 return false;
	             } 
	         }
	     });
	     var calendar =[]
}
//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
 function checkPwd() {
     var inputed = $('#pw').val();
     var reinputed = $('#repwd').val();
     console.log(inputed);
     console.log(reinputed);
     if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
         $("#repwd").css("background-color", "#FFCECE");
     }
     else if (inputed == reinputed) {
         $("#repwd").css("background-color", "#B0F6AC");
         if(idCheck==1 && pwdCheck == 1) {
         }
     } else if (inputed != reinputed) {
         $("#repwd").css("background-color", "#FFCECE");
     }
 }
 function checkNick() {
	   var inputed = $('#nick').val();
	     $.ajax({
	         data : {
	             nick : inputed
	         },
	         url : "checkNick.ubi",
	         success : function(data) {
	            if (data == 0) {
	            	 $("#nick").css("background-color", "#B0F6AC");
	             } 
	            else if (data == 1) {
	            	$("#nick").css("background-color", "#FFCECE");
	                 return false;
	             } 
	         }
	     });
}
</script>
</head>
<body>
<div style="background-color: rgba(255,255,255,0.8); padding: 40px;box-shadow: 0px 10px 8px 8px rgba(255,255,255,0.8);padding-left: 100px;">
<span style="font-size: 50px;">
회원 등록
</span><br>
<hr color="#ddd">
</div>
<div style="margin: 100px;text-align: center;">
  <div align="center">
       <div>
           <div>
               <div style="background-color: white;padding: 10px;width: 60%;box-shadow: 0px 0px 5px 5px white;">
               <br>
               <br>
               <br>
               <span style="font-size: 30px;color: #ccc;">UBI STUDY의 회원이 되어, 다양한 혜택을 누리십시오.<br><br>▼</span>
               <br>
               <br>
               <br>
               <br>
                   <form:form commandName="member" method="post" action="register.ubi">
                       <div>
                           <input class="input1" type="text" name="id" placeholder="아이디" oninput="checkId()" id="checkaa" value="${member.id}" autofocus>
                           <br><form:errors cssClass="err" path="id"/>
                       </div><br>
                       <div>
                           <input class="input1" type="password" name="pw" id="pw" value="${member.pw}" placeholder="비밀번호" oninput="checkPwd()" autofocus>
                           <br><form:errors cssClass="err" path="pw"/>
                       </div><br><span style="color: rgba(160,160,160,1);font-size:30px;">◇◇◇◇◇</span><br>
                       <div>

                           <br><input class="input1" type="password" name="pwConfirm" placeholder="비밀번호확인" id="repwd" oninput="checkPwd()" autofocus>
                       </div><br>
                       <div>
                           <input class="input1" type="text" name="name" id="name" value="${member.name}" placeholder="이름" autofocus>
                           <br><form:errors cssClass="err" path="name"/>
                       </div><br>
                       <div>
                           <input class="input1" type="text" name="pnum" id="pnum" value="${member.pnum}" placeholder="핸드폰" autofocus pattern="(010)-\d{3,4}-\d{4}">
                           <br><form:errors cssClass="err" path="pnum"/>
                       </div><br>
                       <div>
                           <input class="input1" type="text" name="nick" id="nick" value="${member.nick}" oninput="checkNick()" placeholder="닉네임" autofocus>
                           <br><form:errors cssClass="err" path="nick"/>
                       </div><br>
                       <div>
                           <button type="submit" id="register" class="button1">회원가입</button>
                       </div>
                   </form:form>
               </div>
           </div>
       </div>
   </div>
</div>
</body>
</html>
<%@ include file="bottom.jsp" %>