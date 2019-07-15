<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chinasoft.pojo.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="statics/css/style.css" />
<link rel="stylesheet" type="text/css" href="statics/css/WdatePicker.css" />
<link rel="stylesheet" type="text/css" href="statics/css/skin_/table.css" />
<link rel="stylesheet" type="text/css" href="statics/css/jquery.grid.css" />
<title>签到表</title>
</head>
<body>

<%
	String employ = request.getParameter("employees");
	out.println(employ);
%>

<div id="container">
	<div id="hd"></div>
    <div id="bd">
    	<div id="main">
        	<div class="search-box ue-clear">
            	<h1 align="center" style="font-size: 32px;">员工签到表</h1>
             </div>
             
            <div class="table">
            	<div class="opt ue-clear" style="text-align:center ;">
                	签到记录表
                </div>
                
                <div class="grid"></div>
               
                <div class="pagination"></div>
            </div>  
    	</div>
    	<input id="test" type="button" value="确认" />
    </div>
</div>
</body>
<script type="text/javascript" src="statics/js/jquery.js"></script>
<script type="text/javascript" src="statics/js/global.js"></script>
<script type="text/javascript" src="statics/js/jquery.select.js"></script>
<script type="text/javascript" src="statics/js/core.js"></script>
<script type="text/javascript" src="statics/js/jquery.pagination.js"></script>
<script type="text/javascript" src="statics/js/jquery.grid.js"></script>
<script type="text/javascript" src="statics/js/WdatePicker.js"></script>
<script type="text/javascript">
	$('select').select();
	var head = [{
				label: '员工编号',
				width: 100,
				sortable: 'default',
				name: 'id'	
			},{
				label:'姓名',
				width: 150,
				sortable: 'default',
				name:'name'	
			},{
				label:'部门',
				width:150	
			},{
				label:'职务',
				width:150	
			},{
				label: '日期',
				width: 120	
			},{
				label: '状态',
				width:100	
			}];		
	
	var sele = "<select><option value='1'>1001  出勤</option><option value='2'>1002 病假</option><option value='3'>1003 事假</option></select>";
	
	var oper = [{label:'删除',onclick:function(){
						alert('删除');
				}},{label:'编辑',onclick: function(){
					alert('编辑')	
				}}]
	
	//ajax请求，获取所有员工数据
	<%-- $('#test').click(function(){
		$.ajax({
		      type: "POST",
		      url: "<%=basePath%>allEmployee",
		      dataType: "json",
		      success: function(data) {
		        console.log(data);
		      },
		      error: function() {
		        console.log("ajax error");
		      }
		});
	}); --%>
	
		
		
	var tbody = [
					["201301","uimaker","熊猫王子","熊猫王子","1982-10-18",sele,oper], 
					["201302","uimaker","小牛","熊猫王子","1989-10-18",sele,oper],
					["201301","admin","熊猫王子","熊猫王子","1982-10-18",sele,oper],
					["201301","admin","熊猫王子","熊猫王子","1982-10-18",sele,oper], 
					["201302","uimaker","小牛","熊猫王子","1989-10-18",sele,oper],
					["201301","admin","熊猫王子","熊猫王子","1982-10-18","已审核",oper],
					["201301","admin","熊猫王子","熊猫王子","1982-10-18","已审核",oper], 
					["201302","uimaker","小牛","熊猫王子","1989-10-18","已审核",oper],
					["201301","admin","熊猫王子","熊猫王子","1982-10-18","已审核",oper],
					["201301","admin","熊猫王子","熊猫王子","1982-10-18","已审核",oper], 
					["201302","uimaker","小牛","熊猫王子","1989-10-18",sele,oper],
					["201301","admin","熊猫王子","熊猫王子","1982-10-18",sele,oper],
					["201301","admin","熊猫王子","熊猫王子","1982-10-18",sele,oper], 
					["201302","uimaker","小牛","熊猫王子","1989-10-18",sele,oper],
					["201301","admin","熊猫王子","熊猫王子","1982-10-18",sele,oper]]
			
				
		$('.grid').Grid({
			thead: head,
			tbody: null,
			height:600,
			checkbox: {
				single:true	
			},
			operator: {
				type : "normal",
				width : 100	
			},
			sortCallBack : function(name,index,type){
				alert(name+","+index+','+type);
			}
			
		});
	
	$('.grid').Grid('addLoading');
	
	/// 模拟异步
	setTimeout(function(){
		$('.grid').Grid('setData',tbody, head);
	},2000)
	
	
	$('.pagination').pagination(100,{
		callback: function(page){
			alert(page);	
		},
		display_msg: false
	});
	
	$('.search-box input[type=radio]').click(function(e) {
        if($(this).prop('checked')){
			if($(this).attr('data-define') === 'define'){
				$('.define-input').show();
			}else{
				$('.define-input').hide();
			}
		}
    });
</script>
</html>