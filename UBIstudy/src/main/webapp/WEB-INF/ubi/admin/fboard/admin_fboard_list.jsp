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
			location.href="admin_fboard_delete.ubi?num=" + num;
		}
	}
	function insertData()
	{
		loginId = localStorage.getItem("loginId");
		alert(loginId);
		location.href = "admin_fboard_insert.ubi?id=" + loginId;
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
              <h3 class="box-title">자유게시판</h3> 
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>조회수</th>
                  <th>날짜</th>
                  <th>삭제</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${fbList }" var="fb">
			<tr>
				<td>${fb.num }</td>
				<td>
				<c:if test="${fb.re_level>0}">
					<img src="<%=request.getContextPath()%>/resources/images/eft1.png" width="${(fb.re_level-1)*25}px" height="5px">
					<img src="<%=request.getContextPath()%>/resources/images/ref2.png" width="20px">
				</c:if>
				<a href="admin_fboard_view.ubi?num=${fb.num }">${fb.title }</a>
				<c:if test="${fb.read_count>=10}">
					<img src="<%=request.getContextPath()%>/resources/images/hot2.gif" width="100px">
				</c:if>
				</td>
				<td>${fb.name }</td>
				<td>${fb.read_count }</td>
				<td>${fb.day }</td>
				<td>
				<button type="button" class="btn btn-block btn-danger" onClick="deleteData(${fb.num})">
				삭제</button></td>
			</tr>
		</c:forEach>
                </tbody>
              </table>
            </div>
           <center> ${pageInfo.pagingHtml}</center>
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