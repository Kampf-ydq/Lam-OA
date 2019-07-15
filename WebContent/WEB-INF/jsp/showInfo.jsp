<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="statics/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="statics/js/jquery-3.3.1.js"></script>
<script src="statics/js/bootstrap.min.js"></script>
<script type="text/javascript" src="statics/js/echarts.js"></script>
<script type="text/javascript" src="statics/js/moment-with-locales.min.js"></script>

<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
 
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="static/js/moment-with-locales.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

<title>-统计数据-</title>
</head>
<body>

	<!-- 日期选择 -->
	<div class="row" style="margin-top:10px">
		<div class='col-sm-1'>
			<label>选择日期：</label>
		</div>
		<div class='col-sm-3'>
			<div class="form-group">
				<!--指定 date标记-->
				<div class='input-group date' id='datetimepicker1'>
					<input type='text' class="form-control" value="<%=request.getAttribute("day") %>" /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
				
			</div>
		</div>
		<div class='col-sm-3'>
			<span class="input-group-btn">
                <button id="lookup" class="btn btn-default" type="button">查看</button>
                <a href="<%=basePath%>statisticsInfo"><button class="btn btn-default" type="button" style="margin-left: 10px">显示全部</button></a>
            </span>
		</div>
	</div>

	

	<!-- 显示Echarts图表 -->
	<div id="container"
		style="height: 500px; min-height: 100px; margin: 10px auto;"></div>

	<script type="text/javascript">
	
	$(function () {
	    $('#datetimepicker1').datetimepicker({
	        format: 'YYYY-MM-DD',
	        locale: moment.locale('zh-cn')
	    });
	    $('#datetimepicker2').datetimepicker({
	        format: 'YYYY-MM-DD hh:mm',
	        locale: moment.locale('zh-cn')
	    });
	});
	
	$("#lookup").click(function(){
		    var day =  $('#datetimepicker1 input').val().trim();
		    if(day === ""){
		    	alert("请选择查看日期！");
		    	return;
		    }
		    //console.log(day);
		    window.location.href="statisticsInfo?day="+day;
	});
	
	var dom = document.getElementById("container");
	var myChart = echarts.init(dom);
	option = null;

	option = {
		title : {
			text: "考勤统计饼图",
			//subtext: '纯属虚构',
			x:'center'
		},
			tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        x: 'left',
	        data:['出勤','请假','病假','事假','其它']
	    },
	    series: [
	        {
	            name:"考勤统计饼图",
	            type:'pie',
	            selectedMode: 'single',
	            radius: [0, '30%'],

	            label: {
	                normal: {
	                    position: 'inner'
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:[
	                {value:<%=request.getAttribute("attend") %>, name:'出勤', selected:true},
	                {value:<%=request.getAttribute("leave") %>, name:'请假'},
	                {value:<%=request.getAttribute("other") %>, name:'其它'}
	            ]
	        },
	        {
	            name:'Lam-OA',
	            type:'pie',
	            radius: ['40%', '55%'],
	            label: {
	                normal: {
	                    //formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
	                    backgroundColor: '#eee',
	                    borderColor: '#aaa',
	                    borderWidth: 1,
	                    borderRadius: 4,
	                    // shadowBlur:3,
	                    // shadowOffsetX: 2,
	                    // shadowOffsetY: 2,
	                    // shadowColor: '#999',
	                    // padding: [0, 7],
	                    rich: {
	                        a: {
	                            color: '#999',
	                            lineHeight: 22,
	                            align: 'center'
	                        },
	                        // abg: {
	                        //     backgroundColor: '#333',
	                        //     width: '100%',
	                        //     align: 'right',
	                        //     height: 22,
	                        //     borderRadius: [4, 4, 0, 0]
	                        // },
	                        hr: {
	                            borderColor: '#aaa',
	                            width: '100%',
	                            borderWidth: 0.5,
	                            height: 0
	                        },
	                        b: {
	                            fontSize: 16,
	                            lineHeight: 33
	                        },
	                        per: {
	                            color: '#eee',
	                            backgroundColor: '#334455',
	                            padding: [2, 4],
	                            borderRadius: 2
	                        }
	                    }
	                }
	            },
	            data:[
	                {value:<%=request.getAttribute("attend") %>, name:'出勤'},
	                {value:<%=request.getAttribute("ill") %>, name:'病假'},
	                {value:<%=request.getAttribute("bus") %>, name:'事假'},
	                {value:<%=request.getAttribute("other") %>, name:'其他'}
	            ]
	        }
	    ]
	};;
	if (option && typeof option === "object") {
	    myChart.setOption(option, true);
	}
	
	</script>

</body>
</html>