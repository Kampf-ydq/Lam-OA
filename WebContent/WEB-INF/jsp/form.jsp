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
<link rel="stylesheet" type="text/css" href="statics/css/WdatePicker.css" />
<link rel="stylesheet" type="text/css" href="statics/css/skin_/form.css" />
<link href="statics/umeditor/themes/default/_css/umeditor.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="statics/js/jquery.js"></script>
<script type="text/javascript" src="statics/js/global.js"></script>
<script type="text/javascript" src="statics/js/jquery.select.js"></script>
<script type="text/javascript" src="statics/js/WdatePicker.js"></script>
<title>公告发布</title>
</head>
<body>
<div id="container">
	<div id="hd">
    </div>
    <div id="bd">
    	<div id="main">
            <h2 class="subfild">
            	<span>基本信息</span>
            </h2>
            <div class="subfild-content base-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>文章标题</label>
                	<div class="kv-item-content">
                    	<input id="biao-ti" type="text" placeholder="文章标题" />
                    </div>
                    <span class="kv-item-tip">标题字数限制在35个字符</span>
                </div>
                <div class="kv-item ue-clear time">
                	<label><span class="impInfo">*</span>发布时间</label>
                	<div class="kv-item-content">
                    	<input id="date" type="text" placeholder="时间" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
                        <i class="time-icon"></i>
                    </div>
                </div>
            </div>
            
            <h2 class="subfild">
            	<span>备注资料</span>
            </h2>
            
            <div class="subfild-content remarkes-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>文章内容</label>
                	<div class="kv-item-content">
                    	<textarea placeholder="文章内容" id="content" style="width:800px;height:240px;"></textarea>
                    </div>
                </div>
            </div>
            
            <div class="buttons">
                <input id="publish" class="button" type="button" value="确认发布" />
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
	
	$("#publish").click(function(){
		//发布准备工作，取值
		var title = $("#biao-ti").val();
		var date = $("#date").val();
		var content = $("#content").val();
		
		if(title == "" || date == "" || content == ""){
			alert("内容不能为空！");
			return;
		}
		//转为json数据
		var poseStr = JSON.stringify({
    	    t:title,
			d:date,
			c:content
	    });
		//console.log(poseStr);
		//ajax请求
		$.ajax({
		      type: "POST",
		      url: "publishPose",
		      data:poseStr,
		      contentType:"application/json",
		      dataType: "json",
		      success: function(data) {
		         if (data.res == "OK") {
		        	alert("发布成功！");
		        	window.location.reload();//刷新当前页面
		        } else {
		        	alert("发布失败！");
		        } 
		      },
		      error: function() {
		        console.log("ajax error");
		      },
		    });
	});
	
</script>
</html>