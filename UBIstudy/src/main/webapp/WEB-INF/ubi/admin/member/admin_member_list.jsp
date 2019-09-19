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
<script type="text/javascript">
	function deleteData(num)
	{
		if(num == 1)
		{
			alert("관리자는 탈퇴시킬 수 없습니다.");
			return false;
		}
		else
		{
			var delconfirm = confirm("정말 이 회원을 강제탈퇴 시키겠습니까? 이 작업은 돌이킬 수 없습니다.");
			if(delconfirm == true)
			{
				location.href="admin_member_delete.ubi?num=" + num;
			}
		}
	}
</script>
<body>
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">일반회원 관리</h3> 
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>회원번호</th>
                  <th>이름</th>
                  <th>아이디</th>
                  <th>이메일</th>
                  <th>가입날짜</th>
                  <th>강퇴</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${lists }" var="mem">
			<tr>
				<td>${mem.num }</td>
				<td>${mem.name }</td>
				<td>${mem.id }</td>
				<td>${mem.email }</td>
				<td>${mem.day }</td>
				<td>
				<button type="button" class="btn btn-block btn-danger" onClick="return deleteData(${mem.num})">
				강-퇴</button></td>
			</tr>
		</c:forEach>
                </tbody>
              </table>
            </div>
           <center> 페이지!</center>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
</body>
</html>
<%@include file="../footer.jsp"%>