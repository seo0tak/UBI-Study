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
		location.href = "admin_nboard_update.ubi?num=" + num;
	}
</script>
<body>
<section class="content">
<%-- <table border=1>
	<tr>
		<th>글쓴이</th>
		<th>글 번호</th>
		<th>제목</th>
		<th>내용</th>
	</tr>
	<tr>
		<td>${bean.name }</td>
		<td>${bean.num }</td>
		<td>${bean.title }</td>
		<td>${bean.content }</td>
	</tr>
</table> --%>
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
                  <th>번호</th>
                  <td align="center">${bean.num }</td>
                  <th align="center">조회수</th>
                  <td>${bean.read_count }</td>
                 </tr>
                 <tr>
                  <th align="center">날짜</th>
                  <td colspan=3  align="center">${bean.day }</td>
                 </tr>
                 <tr>
                  <th>제목</th>
                  <td colspan=3  align="center">${bean.title }</td>
                </tr>
                <tr>
                	<th>내용</th>
                	<td colspan=3 align="center" height="300px">${bean.content }</td>
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
      <button type="button" class="btn btn-block btn-default" onClick="location.href='admin_nboard_list.ubi'">목록으로</button>
		</td>
		<td>
		<button type="button" class="btn btn-block btn-primary" onClick="updateData(${bean.num})">글 수정</button>
      </td>
      </tr>
      </table>
      <!-- /.row -->
</section>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>