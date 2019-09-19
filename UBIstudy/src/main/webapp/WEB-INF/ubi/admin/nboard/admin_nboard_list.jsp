<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	var delconfirm = confirm("정말 삭제하실래용?");
	if(delconfirm == true)
	{
		location.href="admin_nboard_delete.ubi?num=" + num;
	}
}
</script>
<body>
	<%-- <table border=1 align="center">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>조회수</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${fbList }" var="fb">
			<tr>
				<td>${fb.num }</td>
				<td>${fb.title }</td>
				<td>${fb.name }</td>
				<td>${fb.read_count }</td>
				<td>${fb.day }</td>
			</tr>
		</c:forEach>
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
                <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>조회수</th>
                  <th>날짜</th>
                  <th>삭제</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${nbList }" var="nb">
			<tr>
				<td>${nb.num }</td>
				<td>${nb.title }</td>
				<td>${nb.read_count }</td>
				<td>${nb.day }</td>
				<td>
				<button type="button" class="btn btn-block btn-danger" onClick="deleteData(${nb.num})">
				삭제</button></td>
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