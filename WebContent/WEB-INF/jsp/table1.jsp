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
		<script type="text/javascript">
			$(document).ready(function(e) {
				/*点击按钮的时候弹出模态层*/
				$("#modalBtn").click(function() {
					$("#myModal").modal({
						backdrop: 'static',
						/*点击模态黑色区域不关闭*/
						keyboard: false
					});
					
				});

		
			});
			
			
			$(document).ready(function(e) {
				/*点击按钮的时候弹出模态层*/
				$(".modalBtn1").click(function() {
					$("#myModal1").modal({
						backdrop: 'static',
						/*点击模态黑色区域不关闭*/
						keyboard: false
					});
					 $("#Change").find(".yno").val($(this).parent().parent().find(".yno").html())
					 
					 $("#Change").find(".yname").val($(this).parent().parent().find(".yname").html())
					  $("#Change").find(".zname").val($(this).parent().parent().find(".zname").html())
					 $("#Change").find(".pname").val($(this).parent().parent().find(".pname").html())
					 $("#Change").find(".sex").val($(this).parent().parent().find(".sex").html())
					  $("#Change").find(".age").val($(this).parent().parent().find(".age").html())
					 $("#Change").find(".phone").val($(this).parent().parent().find(".phone").html())
					 $("#Change").find(".email").val($(this).parent().parent().find(".email").html())
					  $("#Change").find(".adress").val($(this).parent().parent().find(".adress").html())
					 $("#Change").find(".salary").val($(this).parent().parent().find(".salary").html())
					 
				});

		
			});
			
		
function check()
{
	var ynum=document.getElementById("User8").value;
	var yname=document.getElementById("User7").value;
	if(ynum==""||yname=="")
		{
		alert("员工号、名不能为空！");
		}
}





		</script>
	</head>

	<body>

		<div class="container">
			<center>
       <div class="form-group">
       <form action="chazhao1" method="post">
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
					 <div>员工管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${msg1}</div>
					
                
              
				</div>
				
				<div class="panel-body">
				
				
					<table class="table table-striped">
						<thead>
							<tr>
								<th>员工号</th>
								
								<th>员工名</th>
								<th>职务名</th>
								<th>部门名</th>
								<th>性别</th>
								<th>年龄</th>
								<th>电话</th>
								<th>email</th>
								<th>住址</th>
								<th>工资</th>
								<th>修改</th>
			                     <th>删除</th>
							</tr>
						</thead>
						<tbody>
							<%
							request.setCharacterEncoding("utf-8");
							PageInfo<Employee> pageInfo = (PageInfo)request.getAttribute("page");
							System.out.println(pageInfo.getLastPage());
							String statu;
							List employee = (ArrayList)request.getAttribute("employee");
							for(Employee ep : pageInfo.getList()){
								
		%>
		<tr>
			<td class="yno"><%=ep.getYno() %></td>
			<td class="yname"><%=ep.getYname() %></td>
			<td class="zname"><%=ep.getZname() %></td>
			<td class="pname"><%=ep.getPname() %></td>
			<td class="sex"><%=ep.getSex() %></td>
			<td class="age"><%=ep.getAge() %></td>
			<td class="phone"><%=ep.getPhone() %></td>
			<td class="email"><%=ep.getEmail() %></td>
			<td class="adress"><%=ep.getAdress() %></td>
			<td class="salary"><%=ep.getSalary() %></td>
			
			
			<td><button type="button" class="btn btn-primary modalBtn1">修改</button></td>
			
			<td><%-- <form action="shanchu1?yno=<%=ep.getYno()%>" method="post"> --%><button type="button" class="btn btn-primary delete">删除</button><!-- </form> --></td>
		</tr>
		
		<%} %>
							
							
						</tbody>
					</table>
					<center>
					 <c:if test="${page.isFirstPage==true}"> <!-- 是否为首页 -->
            	<button  class="btn btn-primary disabled ">首页</button>
            </c:if>
            <c:if test="${page.isFirstPage==false}">
            	<a href="allEmployee?pageNo=${page.firstPage}" class="btn  btn-primary ">首页</a>
            </c:if>
            
            <c:if test="${page.hasPreviousPage==true}"> 
            	<a href="allEmployee?pageNo=${page.prePage}" class="btn btn-primary">上一页</a>
            </c:if>
            <c:if test="${page.hasPreviousPage==false}">
            	<button class="btn btn-primary disabled">上一页</button>
            </c:if>
            
            <c:if test="${page.hasNextPage==true}">
                <a href="allEmployee?pageNo=${page.nextPage}" class="btn btn-primary">下一页</a>
            </c:if>
            <c:if test="${page.hasNextPage==false}">
            	<button class="btn btn-primary disabled">下一页</button>
            </c:if>
            
            <c:if test="${page.isLastPage==true}">
            	<button class="btn btn-primary disabled">尾页</button>
            </c:if>
            <c:if test="${page.isLastPage==false}">
            	<a href="allEmployee?pageNo=<%=pageInfo.getLastPage() %>" class="btn btn-primary">尾页</a>
            </c:if>
            </center>
            <br/>
			<center>
						<div class="container">
			<button type="button" class="btn btn-primary" id="modalBtn" >添加</button>
		</div>
		</center>
		
				</div>

			</div>
		</div>
		

		<!--模态层效果-->

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h2 class="text-center">添加员工</h2>
					</div>
					<center>
					<div class="modal-body">
					<form action="tianjia1" method="post">
					员&nbsp;&nbsp;&nbsp;&nbsp;工&nbsp;&nbsp;&nbsp;&nbsp;号:<input type ="text"name="User8"size="20"id="User8"/><br/>
                                        员&nbsp;&nbsp;&nbsp;&nbsp;工&nbsp;&nbsp;&nbsp;&nbsp;名:<input type ="text"name="User7"size="20"id="User7"/><br/>
                                 
                                     
                                          部&nbsp;&nbsp;&nbsp;&nbsp;门&nbsp;&nbsp;&nbsp;&nbsp;名:<input type ="text"name="User4"size="20"id="User4"/><br/>
                                            职&nbsp;&nbsp;&nbsp;&nbsp;务&nbsp;&nbsp;&nbsp;&nbsp;名:<input type ="text"name="User9"size="20"id="User9"/><br/>
                                        性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User6"size="20"id="User6"/><br/>
                                    
                                       年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User1"size="20"id="User1"/><br/>
                                        住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User0"size="20"id="User0"/><br/>
                                     
                                       工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;资:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User5"size="20"id="User5"/><br/>
                                        邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User2"size="20"id="User2"/><br/>
                                         电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User3"size="20"id="User3"/><br/>
                                      
                                          
             <div class="modal-footer">
						 <input type="submit" class="btn btn-primary" id="add" value="添加" onclick="check();"/>
					<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
					</div>
						</form>
					</div>
					</center>
					
					
				</div>
			</div>

		</div>
		
		
		
		
		<!--模态层效果-->

		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h2 class="text-center">修改部门</h2>
					</div>
					<center>
					<div class="modal-body">
					<form action="xiugai1" method="post" id="Change">
					
                                       员&nbsp;&nbsp;&nbsp;&nbsp;工&nbsp;&nbsp;&nbsp;&nbsp;号:<input type ="text"name="User8"size="20"id="User8"onfocus="this.blur()"class="yno"/><br/>
                                        员&nbsp;&nbsp;&nbsp;&nbsp;工&nbsp;&nbsp;&nbsp;&nbsp;名:<input type ="text"name="User7"size="20"id="User7"class="yname"/><br/>
                                 
                                   
                                          部&nbsp;&nbsp;&nbsp;&nbsp;门&nbsp;&nbsp;&nbsp;&nbsp;名:<input type ="text"name="User4"size="20"id="User4"class="pname"/><br/>
                                            职&nbsp;&nbsp;&nbsp;&nbsp;务&nbsp;&nbsp;&nbsp;&nbsp;名:<input type ="text"name="User9"size="20"id="User9"class="zname"/><br/>
                                        性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User6"size="20"id="User6"class="sex"/><br/>
                                    
                                       年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User1"size="20"id="User1"class="age"/><br/>
                                        住&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User0"size="20"id="User0"class="adress"/><br/>
                                     
                                       工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;资:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User5"size="20"id="User5"class="salary"/><br/>
                                        邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User2"size="20"id="User2"class="email"/><br/>
                                         电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:&nbsp;&nbsp;&nbsp;&nbsp;<input type ="text"name="User3"size="20"id="User3"class="phone"/><br/>
             <div class="modal-footer">
						 <input type="submit" class="btn btn-primary" id="update" value="确定修改"/>
					<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
					</div>
						</form>
					</div>
					</center>
					
					
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
		var a=$(this).parents('tr').children('td').eq(0).text()
console.log(a);
				
			location.href="shanchu1?yno="+a;
		}
		});
	
	
	</script>

</html>