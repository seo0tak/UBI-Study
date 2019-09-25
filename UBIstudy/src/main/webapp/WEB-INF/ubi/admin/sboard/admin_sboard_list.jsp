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
		location.href="admin_sboard_delete.ubi?num=" + num;
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
		<c:forEach items="${sbList }" var="sb">
			<tr>
				<td>${sb.num }</td>
				<td>${sb.title }</td>
				<td>${sb.name }</td>
				<td>${sb.read_count }</td>
				<td>${sb.day }</td>
			</tr>
		</c:forEach>
	</table> --%>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">스터디 게시판</h3> 
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
                <c:forEach items="${sbList }" var="sb">
			<tr>
				<td>${sb.num }</td>
				<td>
				<c:if test="${sb.re_level>0}">
					<img src="<%=request.getContextPath()%>/resources/images/eft1.png" width="${(sb.re_level-1)*25}px" height="5px">
					<img src="<%=request.getContextPath()%>/resources/images/ref2.png" width="20px">
				</c:if>
				${sb.title }
				<c:if test="${sb.read_count>=10}">
					<img src="<%=request.getContextPath()%>/resources/images/hot2.gif" width="100px">
				</c:if>
				</td>
				<td>${sb.name }</td>
				<td>${sb.read_count }</td>
				<td>${sb.day }</td>
				<td>
				<button type="button" class="btn btn-block btn-danger" onClick="deleteData(${nb.num})">
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
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
</body>
</html>
<%@include file="../footer.jsp"%>