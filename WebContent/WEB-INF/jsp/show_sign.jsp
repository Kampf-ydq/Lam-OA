<%@page import="com.github.pagehelper.PageInfo"%>
<%@page import="com.chinasoft.pojo.Sign"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chinasoft.pojo.Employee"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="statics/css/style.css" />
<link rel="stylesheet" type="text/css" href="statics/css/WdatePicker.css" />
<link rel="stylesheet" type="text/css" href="statics/css/skin_/table.css" />
<link rel="stylesheet" type="text/css" href="statics/css/jquery.grid.css" />
<link rel="stylesheet" type="text/css" href="statics/css/jquery.dialog.css" />
<!--BOOT核心文件css-->
<link href="statics/css/bootstrap.min.css" rel="stylesheet" />

<!--主题文件（可选项）-->
<link href="statics/css/bootstrap-theme.min.css" rel="stylesheet" />

<title>签到表</title>
</head>
<body>
<div id="container">
	
	<div id="hd"></div>
    <div id="bd">
    	<div id="main">
    		
    		<form class="bs-example bs-example-form" role="form">
		        <div class="row">
		            <div class="col-lg-4">
		                <div class="input-group">
		                    <input id="emp-no" type="text" class="form-control" placeholder="输入员工编号">
		                    <span class="input-group-btn">
		                        <button id="searchBtn" class="btn btn-default" type="button">查询</button>
		                        <a href="<%=basePath%>showAllSign"><button class="btn btn-default" type="button" style="margin-left: 10px">显示全部</button></a>
		                    </span>
		                </div>
		            </div>
		        </div>
		    </form>
    		
        	<div class="search-box ue-clear">
            	<h1 align="center" style="font-size: 32px;">Lam-OA 考勤记录表</h1>
             </div>
             
            <div class="table">
            	<div class="opt ue-clear" style="text-align:center ;">
                	历史记录数据
                </div>
                
                <table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>记录编号</th>
						<th>员工编号</th>
						<th>姓名</th>
						<th>部门</th>
						<th>职务</th>
						<th>日期</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<%
					//取数据库员工数据
					request.setCharacterEncoding("utf-8");
					PageInfo<Sign> pageInfo = (PageInfo)request.getAttribute("page");
					for(Sign s : pageInfo.getList()){
					    %>
					    <tr>
					    	<td><%=s.getG_id()%></td>
							<td><%=s.getG_yno()%></td>
							<td><%=s.getG_yname()%></td>
							<td><%=s.getG_pname()%></td>
							<td><%=s.getG_zname()%></td>
							<td><%=s.getG_date()%></td>
							<td><%=s.getG_scode()%></td>
							<td><a class="caozuo">[删除]</a>&nbsp;&nbsp;<a class="caozuo">[修改]</a></td>
						</tr>
				<%}%>
				</tbody>
			</table>
  	
  			共有${page.pages}页
            <!-- 分页部分，后端用PageHelper分页插件实现 -->
            <c:if test="${page.isFirstPage==true}"> <!-- 是否为首页 -->
            	<button class="btn btn-default btn-info disabled">首页</button>
            </c:if>
            <c:if test="${page.isFirstPage==false}">
            	<a href="showAllSign?pageNo=${page.firstPage}&empNo=${empno}" class="btn btn-default btn-info">首页</a>
            </c:if>
            
            <c:if test="${page.hasPreviousPage==true}"> 
            	<a href="showAllSign?pageNo=${page.prePage}&empNo=${empno}" class="btn btn-default btn-info">上一页</a>
            </c:if>
            <c:if test="${page.hasPreviousPage==false}">
            	<button class="btn btn-default btn-info disabled">上一页</button>
            </c:if>
            
            <c:if test="${page.hasNextPage==true}">
                <a href="showAllSign?pageNo=${page.nextPage}&empNo=${empno}" class="btn btn-default btn-info">下一页</a>
            </c:if>
            <c:if test="${page.hasNextPage==false}">
            	<button class="btn btn-default btn-info disabled">下一页</button>
            </c:if>
            
            <c:if test="${page.isLastPage==true}">
            	<button class="btn btn-default btn-info disabled">尾页</button>
            </c:if>
            <c:if test="${page.isLastPage==false}">
            	<a href="showAllSign?pageNo=<%=pageInfo.getLastPage() %>" class="btn btn-default btn-info">尾页</a>
            </c:if>
            </div>  
    	</div>
    </div>
    
    <!--删除确定对话模态框 -->
	  <div class="delModal">
			<div class="content">
		    	<div class="ui-dialog-icon"></div>
		        <div class="ui-dialog-text">
		        	<p class="dialog-content">你确定要删除？</p>
		            <p class="tips">如果是请点击“确定”，否则点“取消”</p>
		            
		            <div class="buttons">
		                <input type="button" class="button long2 ok" value="确定" />
		                <input type="button" class="button long2 normal" value="取消" />
		            </div>
		        </div>
		        
		    </div>
		</div>
		
    
    <!-- 数据修改模态框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">您正在修改...</h4>
	            </div>
	            
	            <div class="modal-body">
	            	<ul class="list-group" id="update-sign-table">
					    <li class="list-group-item form-inline">员工编号 <input type="text" name="id" class="form-control" disabled></li>
					    <li class="list-group-item form-inline">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名 <input type="text" name="name" class="form-control" disabled></li>
					    <li class="list-group-item form-inline">部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门 <input type="text" name="dept" class="form-control" disabled></li>
						<li class="list-group-item form-inline">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务 <input type="text" name="zhiwu" class="form-control" disabled></li>
					    <li class="list-group-item form-inline">日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期 <input type="text" name="day" class="form-control"></li>
					    <li class="list-group-item form-inline">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态 <input type="text" name="sta" class="form-control"></li>
					</ul>
	            </div>
	            
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                <button type="button" class="btn btn-primary" id="updateBtn">提交更改</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
    
</div>
</body>

<script src="statics/js/jquery-3.3.1.js"></script>
<script src="statics/js/bootstrap.min.js"></script>
<script type="text/javascript" src="statics/js/core.js"></script>
<script type="text/javascript" src="statics/js/jquery.dialog.js"></script>
<script type="text/javascript">
	
	$('#searchBtn').click(function(){
		var emply_no = $("#emp-no").val();
		if(emply_no == ""){
			alert("请输入员工编号进行查询！");
			return;
		}else{
			console.log(emply_no);
			window.location.href="showAllSign?empNo="+emply_no;
		}
	}); 
	
	$('.delModal').Dialog({
		title:'提示信息',
		autoOpen: false,
		width:400,
		height:200,
		position:'top'
	});
	
	//操作
	var tabno;
	$(function(){
		$('.caozuo').click(function(){
			//获取点击项的记录项编号
			tabno = $(this).parents("tr").children('td').eq(0).text();
			if($(this).text() == "[删除]"){ //删除操作
				//console.log("删除"+tabno);
				$('.delModal').Dialog('open');
				
			}else{ //修改操作
				console.log("修改"+tabno);
				$("#update-sign-table input[name='id']").val($(this).parents("tr").children('td').eq(1).text());
				$("#update-sign-table input[name='name']").val($(this).parents("tr").children('td').eq(2).text());
				$("#update-sign-table input[name='dept']").val($(this).parents("tr").children('td').eq(3).text());
				$("#update-sign-table input[name='zhiwu']").val($(this).parents("tr").children('td').eq(4).text());
				$("#update-sign-table input[name='day']").val($(this).parents("tr").children('td').eq(5).text());
				$("#update-sign-table input[name='sta']").val($(this).parents("tr").children('td').eq(6).text());
				$("#myModal").modal({
					backdrop: 'static',
					/*点击模态黑色区域不关闭*/
					keyboard: false
				});
			}
			
		});
	})
	
	//删除数据
	$('.delModal input[type=button]').click(function(e) {
	    $('.delModal').Dialog('close');
		
		if($(this).hasClass('ok')){
			//开始发送请求，删除数据
			$.ajax({
		      type: "GET",
		      url: "delSignById?id="+tabno,
		      contentType:"application/json",
		      success: function(data) {
		         if (data.res == "OK") {
		        	alert("删除成功！");
		        	//刷新
		        	window.location.href="<%=basePath%>showAllSign";
		         } else {
		        	alert("删除失败！");
		         } 
		      },
		      error: function() {
		        console.log("ajax error");
		      },
		    });
		}
	});
	
	//修改数据
	//转为json数据
	var dataStr;
	$("#updateBtn").click(function(){
		//alert("提交了修改");
		var id = tabno;
		var day = $("#update-sign-table input[name='day']").val();
		var sts = $("#update-sign-table input[name='sta']").val();
		dataStr = JSON.stringify({
			"g_id":id,
	    	"g_date":day,
	    	"g_scode":sts
	    });
		//console.log(dataStr);
		
		$.ajax({
		      type: "POST",
		      url: "update.do",
		      data: dataStr,
		      contentType:"application/json",
		      dataType: "json",
		      success: function(data) {
		         if (data.res == "1") {
		        	alert("修改成功！");
		        	//刷新
		        	window.location.href="<%=basePath%>showAllSign";
		        } else {
		        	alert("修改失败！");
		        } 
		      },
		      error: function() {
		        console.log("ajax error");
		      },
		    });
		
	});
	
</script>
</html>