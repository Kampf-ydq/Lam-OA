<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="statics/css/style.css" />
<link rel="stylesheet" href="statics/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" type="text/css" href="statics/css/skin_/nav.css" />
<script type="text/javascript" src="statics/js/jquery.js"></script>
<script type="text/javascript" src="statics/js/global.js"></script>
<title>底部内容页</title>
</head>
<body>
<div id="container">
	<div id="bd">
    	<div class="sidebar">
        	<div class="sidebar-bg"></div>
            <i class="sidebar-hide"></i>
            
            <ul class="nav">
              <li class="nav-li current">
                	<a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">系统公告</span></a>
                	<ul class="subnav">
                    	<li class="subnav-li current" href="<%=basePath%>showAllPose" data-id="1"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">首页</span></a></li>
                        <li class="subnav-li" href="<%=basePath%>form" data-id="7"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">发布公告</span></a></li>
                    </ul>
                </li>
                 <li class="nav-li">
                	<a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">名片夹</span></a>
                    <ul class="subnav">
                    	<li class="subnav-li" href="<%=basePath%>mycard" data-id="9"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">名片</span></a></li>
                    </ul>
                </li>
            	 
                 <li class="nav-li">
                	<a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">会议管理</span></a>
                    <ul class="subnav">
<%--                       
 --%>                        <li class="subnav-li" href="<%=basePath%>issue" data-id="4"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">会议显示</span></a></li>
                        <li class="subnav-li" href="<%=basePath%>meeting"  data-id="5"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">会议室管理</span></a></li>
                    </ul>
                </li>
               
                
               <li class="nav-li last-nav-li">
                	<a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">考勤管理</span></a>
                    <ul class="subnav">
                    	<li class="subnav-li" href="<%=basePath%>obatainAllemp" data-id="10"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">签到</span></a></li>
                        <li class="subnav-li" href="<%=basePath%>showAllSign" data-id="11"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">查看</span></a></li>
                        <li class="subnav-li" href="<%=basePath%>statisticsInfo" data-id="12"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">统计</span></a></li>
                    </ul>
                </li>
                <li class="nav-li">
                	<a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">系统管理</span></a>
                    <ul class="subnav">
                    	<li class="subnav-li" href="<%=basePath%>allBumen" data-id="6"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">部门管理</span></a></li> 
                        <li class="subnav-li" href="<%=basePath%>allEmployee" data-id="2"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">员工管理</span></a></li>
                        <li class="subnav-li" href="<%=basePath%>allUser" data-id="3"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">员工注册</span></a></li>
                    </ul>
                </li>
            </ul>
            <div class="tree-list outwindow">
            	<div class="tree ztree"></div>
            </div>
        </div>
        <div class="main">
        	<div class="title">
                <i class="sidebar-show"></i>
                <ul class="tab ue-clear">
                   
                </ul>
                <i class="tab-more"></i>
                <i class="tab-close"></i>
            </div>
            <div class="content">
            </div>
        </div>
    </div>
</div>

<div class="more-bab-list">
	<ul></ul>
    <div class="opt-panel-ml"></div>
    <div class="opt-panel-mr"></div>
    <div class="opt-panel-bc"></div>
    <div class="opt-panel-br"></div>
    <div class="opt-panel-bl"></div>
</div>
</body>
<script type="text/javascript" src="statics/js/nav.js"></script>
<script type="text/javascript" src="statics/js/Menu.js"></script>
<script type="text/javascript" src="statics/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript">
	var menu = new Menu({
		defaultSelect: $('.nav').find('li[data-id="1"]')	
	});
	
	

	$.fn.zTree.init($(".tree"), setting, zNodes);
	
	
	$('.sidebar h2').click(function(e) {
        $('.tree-list').toggleClass('outwindow');
		$('.nav').toggleClass('outwindow');
    });
	
	$(document).click(function(e) {
		if(!$(e.target).is('.tab-more')){
			 $('.tab-more').removeClass('active');
			 $('.more-bab-list').hide();
		}
    });
</script>
</html>