<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chinasoft.pojo.Meeting_information"%>
<%@page import="java.util.List"%>
<%@page import="com.github.pagehelper.PageInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1"></meta>

<!--BOOT核心文件css-->
<link href="statics/css/bootstrap.min.css" rel="stylesheet" />

<!--主题文件（可选项）-->
<link href="statics/css/bootstrap-theme.min.css" rel="stylesheet" />

<!--引入jquery开发环境 要在bootstrap.min.js之前引入-->
<script src="statics/js/jquery-3.3.1.js"></script>

<!--引入boot核心js文件-->
<script src="statics/js/bootstrap.min.js"></script>

<link href="statics/css/docs.min.css" rel="stylesheet" />


<script type="text/javascript">
	$(document).ready(function(e) {
		/*点击按钮的时候弹出模态层*/
		$("#modalBtn").click(function() {
			$("#myModal").modal({
				backdrop : 'static',
				/*点击模态黑色区域不关闭*/
				keyboard : false
			});

		});

	});

	$(document).ready(
			function(e) {
				/*点击按钮的时候弹出模态层*/
				$(".modalBtn1").click(
						function() {
							$("#myModal1").modal({
								backdrop : 'static',
								/*点击模态黑色区域不关闭*/
								keyboard : false
							});
							$("#Change").find(".meeting_id").val(
									$(this).parent().parent().find(
											".meeting_id").html())
							$("#Change").find(".meeting_name").val(
									$(this).parent().parent().find(
											".meeting_name").html())
							$("#Change").find(".meeting_place").val(
									$(this).parent().parent().find(
											".meeting_place").html())
							$("#Change").find(".person_nums").val(
									$(this).parent().parent().find(
											".person_nums").html())
						});

			});
</script>


</head>

<body>


<br/>
<br/>
	<div class="container">


		<div class="panel panel-primary">
			<div class="panel-heading">
				<center>
				
     				会议室信息
				
				</center>
			</div>
			<br/>
	
   	<div class="container" >
					<button type="button" class="btn btn-success " id="modalBtn">添加会议室</button>
				</div>
			<div class="panel-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>会议室序号</th>
							<th>会议室名字</th>
							<th>会议室地点</th>
							<th>会议室容纳人数</th>

						</tr>
					</thead>
					<%
						//取数据库员工数据
						request.setCharacterEncoding("utf-8");
					PageInfo<Meeting_information> pageInfo = (PageInfo)request.getAttribute("page");
					System.out.println(pageInfo.getLastPage());
					String statu;
						List infors = (ArrayList) request.getAttribute("infors");

						for (Meeting_information ep : pageInfo.getList()) {
						
					%>


					<tbody>
						<tr>
							<td class="meeting_id"><%=ep.getMeeting_id()%></td>
							<td class="meeting_name"><%=ep.getMeeting_name()%></td>
							<td class="meeting_place"><%=ep.getMeeting_place()%></td>
							<td class="person_nums"><%=ep.getPerson_nums()%></td>
	                       <div class="container">
						   <td><form action="delete1?infors=<%=ep.getMeeting_id()%>" method="post">
							<input type="submit" class="btn btn-danger" id="delete" value="删除">
							</form></td></div>
									
							<td><button type="button" class="btn btn-warning modalBtn1">编辑</button></td>
						
														
						</tr>
						<%
							}
						%>

					</tbody>

				</table>
				<nav>
<div>
<c:if test="${page.isFirstPage==true}"> <!-- 是否为首页 -->
            	<button class="btn btn-default btn-info disabled">首页</button>
            </c:if>
            <c:if test="${page.isFirstPage==false}">
            	<a href="meeting?pageNo=${page.firstPage}" class="btn btn-default btn-info">首页</a>
            </c:if>
            
            <c:if test="${page.hasPreviousPage==true}"> 
            	<a href="meeting?pageNo=${page.prePage}" class="btn btn-default btn-info">上一页</a>
            </c:if>
            <c:if test="${page.hasPreviousPage==false}">
            	<button class="btn btn-default btn-info disabled">上一页</button>
            </c:if>
            
            <c:if test="${page.hasNextPage==true}">
                <a href="meeting?pageNo=${page.nextPage}" class="btn btn-default btn-info">下一页</a>
            </c:if>
            <c:if test="${page.hasNextPage==false}">
            	<button class="btn btn-default btn-info disabled">下一页</button>
            </c:if>
            
            <c:if test="${page.isLastPage==true}">
            	<button class="btn btn-default btn-info disabled">尾页</button>
            </c:if>
            <c:if test="${page.isLastPage==false}">
            	<a href="meeting?pageNo=<%=pageInfo.getLastPage() %>" class="btn btn-default btn-info">尾页</a>
            </c:if>
            
 	</div>		
 
 

				</nav>
			</div>

		</div>
	</div>


	<!--添加模态层效果  -->

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="text-center">会议室信息</h2>
				</div>
				<center>
					<div class="modal-body">
						<form action="add" method="post">
							会议室序号:<input type="text" name="a" size="20" id="a" /><br />
							会议室名字:<input type="text" name="b" size="20" id="b" /><br />
							会议室地点:<input type="text" name="c" size="20" id="c" /><br />
							&nbsp;容纳人数&nbsp;:<input type="text" name="d" size="20" id="d" /><br />
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" id="add" value="添加" />
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">关闭</button>
							</div>
						</form>
					</div>
				</center>
			</div>
		</div>

	</div>


	<!--编辑模态层效果-->

	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-hidden="true" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="text-center">编辑会议室信息</h2>
				</div>
				<center>
					<div class="modal-body">
						<form action="update" method="post" id="Change">
							会议室序号:<input type="text" name="a" size="20" id="a" class="meeting_id" onfocus="this.blur()" /><br />
							 会议室名字:<input type="text" name="b" size="20" id="b" class="meeting_name" /><br />
							会议室地点:<input type="text" name="c" size="20" id="c" class="meeting_place" /><br /> 
							&nbsp;容纳人数&nbsp;:<input type="text" name="d" size="20" id="d" class="person_nums" /><br />
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" id="update" value="确认修改" />
								<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>							
							</div>
							
						</form>
					</div>
				</center>
			</div>
		</div>
	</div>
	
</body>

</html>