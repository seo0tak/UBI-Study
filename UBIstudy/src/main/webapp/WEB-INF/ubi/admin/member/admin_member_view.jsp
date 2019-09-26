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
	function updateData(num)
	{
		location.href = "admin_member_update.ubi?num=" + num;
	}
	function deleteData(num)
	{
		if(num == 1)
			{
			alert("최고 관리자는 강제 탈퇴시킬 수 없습니다.");
			return false;
			}
		var delconfirm = confirm("정말 강제탈퇴 처리 하겠습니까? 이 작업은 되돌릴 수 없습니다.");
		if(delconfirm == true)
		{
			location.href="admin_member_delete.ubi?num=" + num;
		}
	}
</script>
<body>
<section class="content">

<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">${bean.nick }</h3>님 정보 조회 
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <tr>
                  <th width="25%">회원 번호</th>
                  <td align="center" width="75%"><font color=gray>${bean.num }</font></td>
               </tr>
               <tr>
                  <th align="center" width="25%">실명</th>
                  <td align="center" width="75%"><font color=gray>${bean.name }</font></td>
               </tr>
               <tr>
                  <th align="center" width="25%">ID</th>
                  <td align="center" width="75%"><font color=gray>${bean.id }</font></td>
               </tr>
                 <tr>
                  <th align="center" width="25%">닉네임</th>
                  <td align="center" width="75%"><font color=gray>${bean.nick }</font></td>
               	 </tr>
               	 <tr>
                  <th align="center" width="25%">가입 날짜</th>
                  <td align="center" width="75%"><font color=gray>${bean.day }</font></td>
                 </tr>
                 <tr>
                  <th width="25%">인증 상태</th>
                  <td align="center" width="75%"><font color=gray>${bean.proof }</font></td>
                </tr>
                <tr>
                	<th width="25%">메모</th>
                	<td align="center" width="75%"><font color=gray>${bean.memo }</font></td>
                </tr>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <table align="right">
      <tr>
      <td>
      <button type="button" class="btn btn-block btn-default" onClick="location.href='admin_member_list.ubi'">목록으로</button>
		</td>
		<td>
		<button type="button" class="btn btn-block btn-primary" onClick="updateData(${bean.num})">회원 정보 수정</button>
      </td>
      <td>
      	<button type="button" class="btn btn-block btn-danger" onClick="return deleteData(${bean.num})">강제 탈퇴</button>
      </td>
      </tr>
      </table>
      <!-- /.row -->
</section>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>