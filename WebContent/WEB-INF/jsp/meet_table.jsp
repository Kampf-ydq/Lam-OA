 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chinasoft.pojo.Meeting_issue"%>
<%@page import="java.util.List"%>
<%@page import="com.chinasoft.pojo.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.chinasoft.pojo.*"%>
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
		$("#modalBtn11").click(function() {
			$("#myModal1").modal({
				backdrop : 'static',
				/*点击模态黑色区域不关闭*/
				keyboard : false
			});

		});
		
		//会议字段不能为空
		$("#add").click(function(){
			//取值
			if($(".add-meet input[a]").val() == ""){
				alert("别乱来，不能为空");
			}
		});
		

	});
	
	
	
	
</script>
</head>

<body>
<br/>
<br/>
	
	<div class="container">
		<center>
			<div class="form-group">
				<form action="search" method="post">
					<label for="username">按会议发布人查找：</label> 
					<input type="text" id="hao"name="hao" placeholder="请输入发布人姓名" /> 
					<label for="username">按会议地点查找：</label>
					<input type="text" id="ming" name="ming" placeholder="请输入会议室" />
					 <input	type="submit" value="查找"></input>
				</form>
			</div>
		</center>
		
		<div class="panel panel-primary">
			<div class="panel-heading">
				<center>
				
				会议显示结果
				</center>
			</div>
			<br/>
			<div class="container" >
					<button type="button" class="btn btn-success " id="modalBtn11">添加会议</button>
				</div>
			<div class="panel-body">
			<div class="panel-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>会议序号</th>
							<th>会议发布人</th>
							<th>会议地点</th>
							<th>会议主题</th>
							<th>会议开始时间</th>
							<th>会议结束时间</th>
						</tr>
					</thead>
					<%	
			
					request.setCharacterEncoding("utf-8");
					PageInfo<Meeting_issue> pageInfo = (PageInfo)request.getAttribute("page");			
				for(Meeting_issue ep : pageInfo.getList()){			
                       %>
					<tbody>
						<tr>
					
							<td><%=ep.getMeeting_id()%></td>
							<td><%=ep.getMeeting_name()%></td>
							<td><%=ep.getMeeting_place()%></td>
							<td><%=ep.getMeeting_topic()%></td>
							<td><%=ep.getStart_time()%></td>
							<td><%=ep.getEnd_time()%></td>

							<td><form action="delete?issue=<%=ep.getMeeting_id()%>"
									method="post">
									<input type="submit" class="delete" id="delete" value="删除">
								</form></td>
						</tr>
						<%
							}
						%>
						
					</tbody>
					
				</table>
				
				<div>
			<c:if test="${page.isFirstPage==true}"> <!-- 是否为首页 -->
            	<button class="btn btn-default btn-info disabled">首页</button>
            </c:if>
            <c:if test="${page.isFirstPage==false}">
            	<a href="issue?pageNo=${page.firstPage}" class="btn btn-default btn-info">首页</a>
            </c:if>
            
            <c:if test="${page.hasPreviousPage==true}"> 
            	<a href="issue?pageNo=${page.prePage}" class="btn btn-default btn-info">上一页</a>
            </c:if>
            <c:if test="${page.hasPreviousPage==false}">
            	<button class="btn btn-default btn-info disabled">上一页</button>
            </c:if>
            
            <c:if test="${page.hasNextPage==true}">
                <a href="issue?pageNo=${page.nextPage}" class="btn btn-default btn-info">下一页</a>
            </c:if>
            <c:if test="${page.hasNextPage==false}">
            	<button class="btn btn-default btn-info disabled">下一页</button>
            </c:if>
            
            <c:if test="${page.isLastPage==true}">
            	<button class="btn btn-default btn-info disabled">尾页</button>
            </c:if>
            <c:if test="${page.isLastPage==false}">
            	<a href="issue?pageNo=<%=pageInfo.getLastPage() %>" class="btn btn-default btn-info">尾页</a>
            </c:if>
            
 	</div>		
 
 
				
			</div>

		</div>
	</div>
	
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
	aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="text-center">会议信息</h2>
			</div>
			<center>
				<div class="modal-body">
					<form class="add-meet" action="add1" method="post">
						会议序号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" name="a" size="20" id="a" /><br />
						会议发布人&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" name="b" size="20" id="b" /><br />
						会议地点&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" name="c" size="20" id="c" /><br />
						会议主题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" name="d" size="20" id="d" /><br />
						会议开始时间:<input type="text" name="f" size="20" id="f" /><br />
						会议结束时间:<input type="text" name="g" size="20" id="g" /><br />
						
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
	
</body>

</html> 