<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
 var pwdCheck = 0;
 //아이디 체크하여 가입버튼 비활성화, 중복확인.
 function checkId() {
     var inputed = $('.id').val();
     console.log(inputed);
     $.ajax({
         data : {
             id : inputed
         },
         url : "checkId.ubi",
         success : function(data) {
        	 alert(data);
             if(inputed=="" && data==0) {
                 $("#checkaa").css("background-color", "#FFCECE");
                 return false;
             } else if (data ==0) {
                 $("#checkaa").css("background-color", "#B0F6AC");
             } else if (data == 1) {
                 $("#checkaa").css("background-color", "#FFCECE");
                 return false;
             } 
         }
     });
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
         pwdCheck = 1;
         if(idCheck==1 && pwdCheck == 1) {
         }
     } else if (inputed != reinputed) {
         pwdCheck = 0;
         $("#repwd").css("background-color", "#FFCECE");
     }
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
               <div>
                   <form:form commandName="member" method="post" action="register.ubi">
                       <div>
                           <input class="input1" type="text" name="id" placeholder="아이디" onSubmit="return checkId()" id="checkaa" value="${member.id}" autofocus>
                           <br><form:errors cssClass="err" path="id"/>
                       </div><br>
                       <div>
                           <input class="input1" type="password" name="pw" id="pw" value="${member.pw}" placeholder="비밀번호" oninput="checkPwd()">
                           <br><form:errors cssClass="err" path="pw"/>
                       </div><br><span style="color: rgba(160,160,160,1);font-size:30px;">◇◇◇◇◇</span><br>
                       <div>
                           <br><input class="input1" type="password" name="pwConfirm" value="${member.pw}" placeholder="비밀번호확인" id="repwd" oninput="checkPwd()">
                       </div><br>
                       <div>
                           <input class="input1" type="text" name="name" id="name" value="${member.name}" placeholder="이름" autofocus>
                           <br><form:errors cssClass="err" path="name"/>
                       </div><br>
                       <div>
                           <input class="input1" type="text" name="pnum" id="pnum" value="${member.pnum}" placeholder="핸드폰" autofocus>
                           <br><form:errors cssClass="err" path="pnum"/>
                       </div><br>
                       <div>
                           <input class="input1" type="text" name="nick" id="nick" value="${member.nick}" placeholder="닉네임" autofocus>
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