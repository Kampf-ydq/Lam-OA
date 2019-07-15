<%@page import="com.chinasoft.pojo.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chinasoft.pojo.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="" />

<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="statics/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="statics/css/pstyle.css" rel="stylesheet" type="text/css" media="all" />
<title>名片夹</title>
</head>
<body>

<%
	List<Employee> cardList = (ArrayList)request.getAttribute("cardlist");
%>

<div class="team" id="team">
	<div class="container">
		<h5 class="title-w3">Meet Our Team</h5>
		<div class="inst-grids">
			<%for (int i = 0; i < cardList.size(); i++) {%>
			<div class="col-md-3 col-md-3 col-xs-12 blog-gd-w3ls" style="margin:5px 5px">
				<img src="<%=cardList.get(i).getCard().getC_picture() %>" alt="blog-image">
				<div class="date-w3">
					<h4><%=cardList.get(i).getYname() %></h4>
					<p id="desc" class="para-w3-agile"><%=cardList.get(i).getCard().getC_intro() %></p>
					<p id="degree" class="para-w3-agile">
						<span class="glyphicon glyphicon-education" aria-hidden="true" style="margin-right: 5px;"></span>
						<%=cardList.get(i).getCard().getC_degree() %>
					</p>
					<p id="email" class="para-w3-agile">
						<span class="glyphicon glyphicon-envelope" aria-hidden="true" style="margin-right: 5px;"></span>
						<%=cardList.get(i).getEmail() %>
					</p>
					<p id="comment" class="para-w3-agile">
						<span class="glyphicon glyphicon-star" aria-hidden="true" style="margin-right: 5px;"></span>
						<%=cardList.get(i).getCard().getC_star() %>
					</p>
				</div>
			</div>
			<%} %>
			
		</div>
		
	</div>
</div>

</body>
</html>