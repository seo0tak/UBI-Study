<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="content">
<div class="box">
            <div class="box-header">
              <h3 class="box-title">관리자 전용 글쓰기!
                <small>공지 게시판</small><br><br>
                <form:form commandName="nboard" method="post" action="admin_nboard_insert.ubi">
                <input type="text" name=title placeholder="제목 입력" required="required"><br>
              </h3>
              <!-- tools box -->
              
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-default btn-sm" data-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                  <i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-default btn-sm" data-widget="remove" data-toggle="tooltip"
                        title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body pad">
              
                <textarea class="textarea" placeholder="Place some text here" name="content" required="required"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                          </textarea>
                           <table align="right">
      <tr>
      <td>
                    <button type="button" class="btn btn-block btn-info" onClick="location.href='admin_nboard_list.ubi'">
                    	목록으로
                    </button>
                  </td>
      <td>
                    <button type="reset" class="btn btn-block btn-warning">다시쓰기</button>
                  </td>
      <td>
                    <button type="submit" class="btn btn-block btn-primary">글 저장</button>
                  </td>
      </tr>
      </table>
              </form:form>
            </div>
          </div>
</section>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>