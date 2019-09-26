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
              <h3 class="box-title">관리자 전용 글 수정!
                <small>오프라인 스터디 게시판</small><br><br>
                <form:form commandName="sboard" method="post" action="admin_sboard_update.ubi?num=${bean.num }">
                <select name=lang required="required">
                	<option value="">언어 선택</option>
                	<option value="JAVA" <c:if test="${bean.lang=='JAVA'}"> selected </c:if>>JAVA</option>
                	<option value="C" <c:if test="${bean.lang=='C'}"> selected </c:if>>C</option>
                	<option value="C++" <c:if test="${bean.lang=='C++'}"> selected </c:if>>C++</option>
                	<option value="Python" <c:if test="${bean.lang=='Python'}"> selected </c:if>>Python</option>
                </select>
                <select name=color>
                	<option value="">컬러 선택</option>
		                <option value="#D25565" style="color:#D25565;" <c:if test="${bean.color=='#D25565'}"> selected </c:if>>빨간색</option>
		                <option value="#9775fa" style="color:#9775fa;" <c:if test="${bean.color=='#9775fa'}"> selected </c:if>>보라색</option>
		                <option value="#ffa94d" style="color:#ffa94d;" <c:if test="${bean.color=='#ffa94d'}"> selected </c:if>>주황색</option>
		                <option value="#74c0fc" style="color:#74c0fc;" <c:if test="${bean.color=='#74c0fc'}"> selected </c:if>>파란색</option>
		                <option value="#f06595" style="color:#f06595;" <c:if test="${bean.color=='#f06595'}"> selected </c:if>>핑크색</option>
		                <option value="#63e6be" style="color:#63e6be;" <c:if test="${bean.color=='#63e6be'}"> selected </c:if>>연두색</option>
		                <option value="#a9e34b" style="color:#a9e34b;" <c:if test="${bean.color=='#a9e34b'}"> selected </c:if>>초록색</option>
		                <option value="#4d638c" style="color:#4d638c;" <c:if test="${bean.color=='#4d638c'}"> selected </c:if>>남색</option>
		                <option value="#495057" style="color:#495057;" <c:if test="${bean.color=='#495057'}"> selected </c:if>>검정색</option>
                </select>
                <input type="text" name=title placeholder="모임명 입력" required="required" value="${bean.title }"><br>
                                시작날짜 : <input type="date" name=start_day value=${bean.start_day }>  종료날짜 : <input type="date" name=end_day value=${bean.end_day }> 
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
              
                <textarea class="textarea" placeholder="Place some text here" name="memo" required
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                          ${bean.memo }</textarea>
                           <table align="right">
      <tr>
      <td>
                    <button type="button" class="btn btn-block btn-info" onClick="location.href='admin_sboard_list.ubi'">
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