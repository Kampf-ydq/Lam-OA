<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<link rel="stylesheet" type="text/css" href="statics/css/style.css" />
<link rel="stylesheet" type="text/css" href="statics/css/skin_/login.css" />
<script type="text/javascript" src="statics/js/jquery.js"></script>
<script type="text/javascript" src="statics/js/jquery.select.js"></script>
<script type="text/javascript"
    src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<title>Lamnist  OA管理系统_用户登录</title>
 <style>
      
        img { cursor: pointer}
    </style>
</head>

<body>
<script type="text/javascript">
function check(){
	var username=document.getElementById("yno").value;
	
	var pwd=document.getElementById("pwd").value;
	var cap=document.getElementById("cap").value;
	if(username=="")
	{
		
		alert("员工号不能为空！");
	}
	
	if(cap=="")
		{
		alert("验证码不能为空！");
		}
if(pwd=="")
	{
	alert("密码不能为空！");
	}

}
</script>

	<form action="<%=basePath%>doLogin.html" method="post">
	
<div id="container">

    <div id="bd">
    	<div id="main">
        	<div class="login-box">
                <div id="logo"></div>
                <h1></h1>
                <div class="input username" id="yno">
               
                    <label for="userName">员工号</label> 
                    <span></span>
                    <input type="text" id="yno" name="yno"/>
                </div>
                
                <div class="input psw" id="psw">
                    <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>  
                    <span></span>
                    <input type="password" id="pwd" name="pwd"/>
                </div>
         

   
     <div class="input validate" id="validate">
	                    <label for="valiDate">验证码</label>
	                     <input type="text" id="cap" name="cap">
	                    <div class="value"><img id="yan-zheng" src="captcha.png" onclick="changeImg(this)"></div>
	                </div>
    
    
                <div class="styleArea">
                    <div>${msg}</div><br/>
                     <div>${message}</div>
                </div>
                <div id="btn" class="loginButton">
                    <input type="submit" class="button" value="登录" onclick="check();" />
                </div>
               
            </div>
        </div>
       
    </div>
   
</div>
</form>
</body>
<script type="text/javascript">
function changeImg(img) {
	
   // 浏览器有一个缓存特性,
   // 第一次从服务器获取图片，浏览器第二次发送请求时发现地址没有改变，就会使用第一次的图片，而不会真正发送请求
   // 为了让浏览器每次都把请求发送给服务器，给一个时间参数
	img.src = "captcha.png?t="+new Date().getTime();
}
	var height = $(window).height() > 445 ? $(window).height() : 445;
	$("#container").height(height);
	var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
	$('#bd').css('padding-top', bdheight);
	$(window).resize(function(e) {
        var height = $(window).height() > 445 ? $(window).height() : 445;
		$("#container").height(height);
		var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
		$('#bd').css('padding-top', bdheight);
    });
	$('select').select();
	

	
	
</script>

</html>
