<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.chinasoft.pojo.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.github.pagehelper.PageInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String login=(String)session.getAttribute("userSession");
%>
<html xmlns="http://www.w3.org/1999/xhtml">


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
	
	</head>

	<body>

		<div class="container">
			<center>
       <div class="form-group">
       <form action="chazhao2" method="post">
					<label for="username">按员工号查找：</label>
					<input type="text" id="hao" name="hao" placeholder="请输入员工号" />
					<label for="username">按员工名查找：</label>
					<input type="text" id="ming"name="ming"  placeholder="请输入员工名称" />
                      <input type="submit" value="查找"></input>
</form>
				</div>
              </center>
			
			<div class="panel panel-primary">
				<div class="panel-heading">
					员工注册
					

				</div>
				<div class="panel-body">
				
				
					<table class="table table-striped">
						<thead>
							<tr>
								<th>员工号</th>
								<th>部门号</th>
								<th>员工密码</th>
							<th>密码重置</th>
			                     <th>删除</th>
							</tr>
						</thead>
						<tbody>
							<%
							request.setCharacterEncoding("utf-8");
							PageInfo<User> pageInfo = (PageInfo)request.getAttribute("page");
							System.out.println(pageInfo.getLastPage());
							String statu;
							List user = (ArrayList)request.getAttribute("user");
							for(User ep : pageInfo.getList()){
								
		%>
		<tr>
			<td ><%=ep.getId() %></td>
			<td ><%=ep.getName() %></td>
			<td ><%=ep.getPwd() %></td>
			<td><form action="chongzhi?yno=<%=ep.getId()%>" method="post"><input type="submit" class="btn btn-primary " value="重置"></input></form></td>
			
			
			
			
			<td><%-- <form action="shanchu2?yno=<%=ep.getId()%>" method="post"> --%><button type="button" class="btn btn-primary delete">删除</button><!-- </form> --></td>
		</tr>
		
		<%} %>
							
							
						</tbody>
					</table>
					<center>
					 <c:if test="${page.isFirstPage==true}"> <!-- 是否为首页 -->
            	<button  class="btn btn-primary disabled ">首页</button>
            </c:if>
            <c:if test="${page.isFirstPage==false}">
            	<a href="allUser?pageNo=${page.firstPage}" class="btn  btn-primary ">首页</a>
            </c:if>
            
            <c:if test="${page.hasPreviousPage==true}"> 
            	<a href="allUser?pageNo=${page.prePage}" class="btn btn-primary">上一页</a>
            </c:if>
            <c:if test="${page.hasPreviousPage==false}">
            	<button class="btn btn-primary disabled">上一页</button>
            </c:if>
            
            <c:if test="${page.hasNextPage==true}">
                <a href="allUser?pageNo=${page.nextPage}" class="btn btn-primary">下一页</a>
            </c:if>
            <c:if test="${page.hasNextPage==false}">
            	<button class="btn btn-primary disabled">下一页</button>
            </c:if>
            
            <c:if test="${page.isLastPage==true}">
            	<button class="btn btn-primary disabled">尾页</button>
            </c:if>
            <c:if test="${page.isLastPage==false}">
            	<a href="allUser?pageNo=<%=pageInfo.getLastPage() %>" class="btn btn-primary">尾页</a>
            </c:if>
            </center>
            <br/>
			
		
				</div>

			</div>
		</div>
		

					
				
	</body>
<script type="text/javascript">
		$('.delete').click(function(){
			 var r=confirm("确认删除？");
			if(r) 
		{	
			//取 yno
		var a=$(this).parents('tr').children('td').eq(0).text();
		var name=$(this).parents('tr').children('td').eq(1).text();
		console.log(a);
		console.log("<%=login%>");
		if(name == "<%=login%>"){
			alert("你乱来，不能删自己");
			return;
		}
		location.href="shanchu2?yno="+a;
		}
	});
	
	
	</script>

</html>