<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chinasoft.pojo.Employee"%>
<%@page import="java.util.List"%>
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
<title>签到表</title>
</head>
<body>
<div id="container">
	<div id="hd"></div>
    <div id="bd">
    	<div id="main">
        	<div class="search-box ue-clear">
            	<h1 align="center" style="font-size: 32px;">Lam-OA 员工签到表</h1>
             </div>
             
            <div class="table">
            	<div class="opt ue-clear" style="text-align:center ;">
                	签到记录表
                </div>
                
                <div class="grid"></div>
            </div>  
    	</div>
    	<input id="save" type="button" class="button long2 ok" style="margin-left:50px" value="保存" />
    </div>

	<!--保存确定对话模态框 -->
	  <div class="saveSign">
			<div class="content">
		    	<div class="ui-dialog-icon"></div>
		        <div class="ui-dialog-text">
		        	<p class="dialog-content">你确定要保存？</p>
		            <p class="tips">如果是请点击“确定”，否则点“取消”</p>
		            
		            <div class="buttons">
		                <input type="button" class="button long2 ok" value="确定" />
		                <input type="button" class="button long2 normal" value="取消" />
		            </div>
		        </div>
		        
		    </div>
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
<script type="text/javascript" src="statics/js/jquery.dialog.js"></script>
<script type="text/javascript">
	$('select').select();
	var head = [{
				label: '员工编号',
				width: 100,
				name: 'id'	
			},{
				label:'姓名',
				width: 150,
				name:'name'	
			},{
				label:'部门',
				width:150,
				name: 'dep'
			},{
				label:'职务',
				width:150,
				name: 'prof'
			},{
				label: '日期',
				width: 120,
				name: 'day'
			},{
				label: '状态',
				width:150,
				name: 'scode'
			}];		
	
	var sele = "<select id='code_select' style='width:100%;height:100%;'><option value='1'>出勤</option><option value='2'>病假</option><option value='3'>事假</option><option value='4'>其它</option></select>";

	var tbody = [];
	<%
		//取数据库员工数据
		request.setCharacterEncoding("utf-8");
		List empList = (ArrayList)request.getAttribute("employlist");
		//获取日期
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String s = df.format(date);
		
		for(Iterator it=empList.iterator();it.hasNext();){
		    Employee ep = (Employee)it.next();%>
		    tbody.push(["<%=ep.getYno()%>","<%=ep.getYname()%>","<%=ep.getPname()%>","<%=ep.getZname()%>","<%=s%>",sele]);
		    
	<%}%>
	
				
	$('.grid').Grid({
		thead: head,
		tbody: null,
		height:500,
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
	},1000)
	
	
	$('.search-box input[type=radio]').click(function(e) {
        if($(this).prop('checked')){
			if($(this).attr('data-define') === 'define'){
				$('.define-input').show();
			}else{
				$('.define-input').hide();
			}
		}
    });
	
	//隐藏操作栏
	$(".__theadFinal").remove();
	
	/*============================\
	  =			保存签到表数据		 =
     \============================*/
	$('.saveSign').Dialog({
		title:'提示信息',
		autoOpen: false,
		width:400,
		height:200
	});
	
	//保存出勤表操作
	var sign_data;
	$('#save').click(function(){
	    
	    //取值,并拼装成json格式
	    var sign = [];
	    $('.__data tr').each(function(i){
	    	sign.push({
	    		yno:$(this).children('td').eq(0).text(),
	    		yname:$(this).children('td').eq(1).text(),
	    		pname:$(this).children('td').eq(2).text(),
	    		zname:$(this).children('td').eq(3).text(),
	    		sdate:$(this).children('td').eq(4).text(),
	    		sataus:$('select option:checked').eq(i).text()
	    	});
	    });
	   
	    //转为json数据
	    sign_data = JSON.stringify({
	    	"sign":sign
	    });
	    
	    //console.log(sign_data);
	    
	    $('.saveSign').Dialog('open');
	});
	
	$('.saveSign input[type=button]').click(function(e) {
	    $('.saveSign').Dialog('close');
		
		if($(this).hasClass('ok')){
			//开始发送请求，保存数据到数据库sign表中
			$.ajax({
		      type: "POST",
		      url: "save.do",
		      data: sign_data,
		      contentType:"application/json",
		      dataType: "json",
		      success: function(data) {
		         if (data) {
		        	alert("保存成功！");
		        } else {
		        	alert("保存失败！");
		        } 
		      },
		      error: function() {
		        console.log("ajax error");
		      },
		    });
		}
	});
	
	
	
</script>
</html>