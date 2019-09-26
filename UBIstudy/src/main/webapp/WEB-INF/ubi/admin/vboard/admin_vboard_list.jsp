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
		location.href="admin_vboard_delete.ubi?num=" + num;
	}
}
function insertData()
{
	loginId = localStorage.getItem("loginId");
	//alert(loginId);
	location.href = "admin_vboard_insert.ubi?id=" + loginId;
}
</script>
<body>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">영상 게시판</h3> 
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>가격</th>
                  <th>조회수</th>
                  <th>날짜</th>
                  <th>삭제</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${vbList }" var="vb">
			<tr>
				<td>${vb.num }</td>
				<td>
				<a href="admin_vboard_view.ubi?num=${vb.num }&pageNumber=${pageInfo.pageNumber}">${vb.title }</a>
				<c:if test="${vb.read_count>=10}">
					<img src="<%=request.getContextPath()%>/resources/images/hot2.gif" width="100px">
				</c:if>
				</td>
				<td>${vb.name }</td>
				<td>${vb.price }P</td>
				<td>${vb.read_count }</td>
				<td>${vb.day }</td>
				<td>
				<button type="button" class="btn btn-block btn-danger" onClick="deleteData(${vb.num})">
				삭제</button></td>
			</tr>
		</c:forEach>
                </tbody>
              </table><br>
               <div align="left">
            	<form action="admin_vboard_list.ubi" method="get">
            		<table id="example2">
            		<tr>
            		<td>
            		<select name="whatColumn" class="form-control">
            			<option value="title">제목</option>
            			<option value="name">글쓴이</option>
            			<option value="all">제목 + 글쓴이</option>
            		</select>
            		</td>
            		<td>
            		<input type="text" name=keyword class="form-control"></td>
            		<td>
            		<button type="submit" class="btn btn-block btn-info btn-flat">검색</button>
            		</td>
            		</tr>
            		</table>
            	</form>
            	
           <center><font size="5p">${pageInfo.pagingHtml}</font></center>
           
            </div>
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