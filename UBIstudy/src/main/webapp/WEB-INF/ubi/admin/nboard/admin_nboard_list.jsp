<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>
<!DOCTYPE html>
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
function insertData()
	{
	location.href="admin_nboard_insert.ubi";
	}
</script>
<body>
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
				<td>
				<a href="admin_nboard_view.ubi?num=${nb.num }&pageNumber=${pageInfo.pageNumber}">${nb.title }</a>
				</td>
				<td>${nb.read_count }</td>
				<td>${nb.day }</td>
				<td>
				<button type="button" class="btn btn-block btn-danger" onClick="deleteData(${nb.num})">
				삭제</button></td>
			</tr>
		</c:forEach>
                </tbody>
              </table><br>
               <div align="left">
            	<form action="admin_nboard_list.ubi" method="get">
            		<table id="example2">
            		<tr>
            		<td>
            		</td>
            		<td>
            		<input type="hidden" name="whatColumn" value="title">
            		<input type="text" name=keyword placeholder="제목으로 검색" class="form-control"></td>
            		<td>
					<button type=submit class="btn btn-block btn-info btn-flat">검색</button>            		</td>
            		</tr>
            		</table>
            	</form>
           <center><font size="5p">${pageInfo.pagingHtml}</font></center>
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
      <button type="button" class="btn btn-block btn-default" onClick="insertData()">글쓰기</button>
      </td>
      </tr>
      </table>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
</body>
</html>
<%@include file="../footer.jsp"%>