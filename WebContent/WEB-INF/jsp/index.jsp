<%@page import="java.util.ArrayList"%>
<%@page import="com.chinasoft.pojo.Pose"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="statics/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="statics/css/skin_/index.css" />
<script type="text/javascript" src="statics/js/jquery.js"></script>
<script type="text/javascript" src="statics/js/global.js"></script>
<script type="text/javascript"
	src="statics/js/jquery-ui-1.9.2.custom.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>首页</title>
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}
</style>
</head>
<%
	List<Pose> poseList = (ArrayList)request.getAttribute("poselist");
%>
<body>
	<div id="container">
		<div id="hd"></div>
		<div id="bd">
			<div id="main">
				<ul class="nav-list ue-clear">
					<div id="demo" class="carousel slide" data-ride="carousel">

						<!-- 指示符 -->
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>

						<!-- 轮播图片 -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img
									src="statics/img/轮播图1.jpg">
							</div>
							<div class="carousel-item">
								<img
									src="statics/img/轮播图2.jpg">
							</div>
							<div class="carousel-item">
								<img
									src="statics/img/轮播图3.jpg">
							</div>
						</div>

						<!-- 左右切换按钮 -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>

					</div>
				</ul>

				<ul class="content-list">
					<%for (int i = 0; i < poseList.size(); i++) {%>
					<li class="content-item system">
						<h2 class="content-hd">
							<span class="title">
							   <a class="t"><%=poseList.get(i).getT_title() %></a>
							   <a style="margin-left: 100px"><%=poseList.get(i).getT_date() %></a>
							   <a class="del" style="float:right;margin-right: 5px">×</a>
							</span>
						</h2>
						<div class="content-bd">
							<div style="margin: 15px 15px">
								<%=poseList.get(i).getT_content() %>
							</div>
						</div>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var minwidth = 282;
	resizeWidth();
	$(top.window).resize(function(e) {
       resizeWidth();
    });
	$(function() {
		$( ".content-list" ).sortable({
		  revert: true,
		  handle:'h2'
		});
		
	});
	
	function resizeWidth (){
		if($('#main').width() / 3 < minwidth){
			$('.content-item').width(($('#main').width() / 2) - 15);
		}else{
			$('.content-item').width(($('#main').width() / 3) - 15);	
		}
	}
	
	$(function() {
		$('#myCarousel').carousel({
			interval: 2000
		});

	})
	
	$(".del").click(function(){
		//删除准备工作，取值
		var title = $(this).siblings(".t").html();
		//console.log(title);
	
		//ajax请求
		 $.ajax({
		      type: "POST",
		      url: "del.do?title="+title,
		      contentType:"application/json",
		      dataType: "json",
		      success: function(data) {
		         if (data.res == "OK") {
		        	alert("删除成功！");
		        	window.location.reload();//刷新当前页面
		        } else {
		        	alert("删除失败！");
		        } 
		      },
		      error: function() {
		        console.log("ajax error");
		      },
		 }); 
	});
</script>
</html>