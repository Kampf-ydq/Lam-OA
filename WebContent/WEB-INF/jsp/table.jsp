<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.chinasoft.pojo.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
					 $("#Change").find(".bnum").val($(this).parent().parent().find(".bnum").html())
					 $("#Change").find(".bname").val($(this).parent().parent().find(".bname").html())
					 $("#Change").find(".bint").val($(this).parent().parent().find(".bint").html())
				});

		
			});
			
			<%-- $('#tianjia1').click(function(){
				
				location.href="<%=basePath%>tianjia";
			}); --%>

			function check1()
			{
				var bnum=document.getElementById("User0").value;
				var bname=document.getElementById("User1").value;
				if(bnum==""||bname=="")
					{
					alert("部门号、名不能为空！");
					}
			}
		</script>
	</head>

	<body>

		<div class="container">
			<center>
       <div class="form-group">
       <form action="chazhao" method="post">
					<label for="username">按部门号查找：</label>
					<input type="text" id="hao" name="hao" placeholder="请输入部门号" />
					<label for="username">按部门名查找：</label>
					<input type="text" id="ming"name="ming"  placeholder="请输入部门名称" />
<input type="submit" value="查找"></input>
</form>
				</div>
              </center>
			
			<div class="panel panel-primary">
				<div class="panel-heading">
					 <div>部门管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${msg1}</div>
					
                
              
				</div>
				
				
				<div class="panel-body">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>部门号</th>
								<th>部门名</th>
								<th>部门介绍</th>
								<th>修改</th>
			                    <th>删除</th>
							</tr>
						</thead>
						<tbody>
							<%
							request.setCharacterEncoding("utf-8");
							List bumen = (ArrayList)request.getAttribute("bumen");
							for(Iterator it=bumen.iterator();it.hasNext();){
								Bumen ep = (Bumen)it.next();
		%>
		<tr>
			<td class="bnum"><%=ep.getBnum() %></td>
			<td class="bname"><%=ep.getBname() %></td>
			<td class="bint"><%=ep.getBint() %></td>
			
			<td><button type="button" class="btn btn-primary modalBtn1">修改</button></td>
			
			<td><%-- <form action="shanchu?bnum=<%=ep.getBnum()%>" method="post"> --%><button type="button" class="btn btn-primary delete1">删除</button><!-- </form> --></td>
		</tr>
		
		<%} %>
							
							
						</tbody>
					</table>
					
			<div class="styleArea">
                    <div>${msg1}</div>
                </div>
			<center>
						<div class="container">
			<button type="button" class="btn btn-primary" id="modalBtn">添加</button>
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
						<h2 class="text-center">添加部门</h2>
					</div>
					<center>
					
					<div class="modal-body">
					<form action="tianjia" method="post">
					部&nbsp;&nbsp;&nbsp;&nbsp;门&nbsp;&nbsp;&nbsp;&nbsp;号:<input type ="text"name="User0"size="20"id="User0"/><br/>
                                        部&nbsp;&nbsp;&nbsp;&nbsp;门&nbsp;&nbsp;&nbsp;&nbsp;名:<input type ="text"name="User1"size="20"id="User1"/><br/>
                                       部  &nbsp;门&nbsp;&nbsp;介&nbsp;绍:<input type ="text"name="User2"size="20"id="User2"/><br/>
             <div class="modal-footer">
						 <input type="submit" class="btn btn-primary" id="add" value="添加" onclick="check1();"/>
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
					<form action="xiugai" method="post" id="Change">
					部&nbsp;&nbsp;&nbsp;&nbsp;门&nbsp;&nbsp;&nbsp;&nbsp;号:<input type ="text"name="User0"size="20"id="User0"class="bnum" onfocus="this.blur()"/><br/>
                                        部&nbsp;&nbsp;&nbsp;&nbsp;门&nbsp;&nbsp;&nbsp;&nbsp;名:<input type ="text"name="User1"size="20"id="User1"class="bname"/><br/>
                                       部  &nbsp;门&nbsp;&nbsp;介&nbsp;绍:<input type ="text"name="User2"size="20"id="User2"class="bint"/><br/>
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
		$('.delete1').click(function(){
			 var r=confirm("确认删除？");
			if(r) 
		{	
			//取 yno
		var a=$(this).parents('tr').children('td').eq(0).text()
console.log(a);
				
			location.href="shanchu?bnum="+a;
		}
		});
	
	
	</script>
</html>