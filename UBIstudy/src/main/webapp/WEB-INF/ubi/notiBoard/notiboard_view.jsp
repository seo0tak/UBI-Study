<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="../header.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UBI-STUDY *공지사항*</title>
</head>
<script type="text/javascript">
	function updateData(num)
	{
		location.href = "admin_notiboard_update.ubi?num=" + num;
	}
	function deleteData(num)
	{
		var delconfirm = confirm("정말 삭제하실래용?");
		if(delconfirm == true)
		{
			location.href="admin_notiboard_delete.ubi?num=" + num;
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
              <h3 class="box-title">공지 게시판</h3> 
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <tr>
                  <th width="25%">번호</th>
                  <td align="center" width="25%"><font color=gray>${bean.num }</font></td>
                  <th align="center" width="25%">조회수</th>
                  <td align="center" width="25%"><font color=gray>${bean.read_count }</font></td>
                 </tr>
                 <tr>
                  <th align="center" width="25%">글쓴이</th>
                  <td align="center" width="25%"><font color=gray>${bean.name }</font></td>
                  <th align="center" width="25%">날짜</th>
                  <td align="center" width="25%"><font color=gray>${bean.day }</font></td>
                 </tr>
                 <tr>
                  <th>제목</th>
                  <td colspan=3  align="center"><font color=gray>${bean.title }</font></td>
                </tr>
                <tr>
                	<th>내용</th>
                	<td colspan=3 align="center" height="300px"><font color=gray>${bean.content }</font></td>
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
      <button type="button" class="btn btn-block btn-default" onClick="location.href='notiboard_list.ubi?pageNumber=${pageNumber}'">목록으로</button>
		</td>
		<td>
		<button type="button" class="btn btn-block btn-primary" onClick="updateData(${bean.num})">글 수정</button>
      </td>
      <td>
      	<button type="button" class="btn btn-block btn-danger" onClick="deleteData(${bean.num})">글 삭제</button>
      </td>
      </tr>
      </table>
      <!-- /.row -->
</section>
</div>
</body>
</html>
<%-- <%@include file="../footer.jsp"%> --%>