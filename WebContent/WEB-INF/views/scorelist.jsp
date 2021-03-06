<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/font/iconfont.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sweetalert/sweetalert.css">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/lib/layer/1.9.3/layer.js"></script>
<script src="<%=request.getContextPath()%>/lib/laypage/1.2/laypage.js"></script>
<script src="<%=request.getContextPath()%>/js/sweetalert/sweetalert.min.js"></script>
<title>申请人列表</title>
</head>
<body background="<%=request.getContextPath()%>/images/010.gif">
<div class="container-fluid">
	<div class="row">
	  <div class="col-md-4"></div>
	  <div class="col-md-4"><h2 class="text-center">成果转化管理表</h2></div>
	  <div class="col-md-4"></div>
	</div>
</div>
		<div class="row">
		  <div class="col-md-3">
		  	<div class="input-group">
		      <input type="text" class="form-control" placeholder="输入申请人姓名搜索" id = "sousuo" value = "${studentname}">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="button" onclick="sousuo();">Go!</button>
		      </span>
	    	</div>
		  </div>
		  <div class="col-md-3"></div>
		  <div class="col-md-6"></div>
		</div>
		
	<br/>
	<table class="table table-hover">
		<tr class="info">
			<th>学号</th>
			<th>申请人姓名</th>
			<th>申请人性别</th>
			<th>所在系</th>
			<th>班级</th>
			<th>电话号码</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${studentlist}" var="stu">
			<tr>
				<td>${stu.stuId}</td>
				<td>${stu.stuName}</td>
				<td>${stu.stuSex}</td>
				<td>${stu.stuSystem}</td>
				<td>${stu.stuClass}</td>
				<td>${stu.stuPhone}</td>
				<td><button type="button" onclick="bianji(${stu.stuId});" class="btn btn-info btn-xs"><i class="iconfont">&#xe66e;</i>&nbsp;编辑该成果转化</button></td>
			</tr>
		</c:forEach>
	</table>
	<div id="page11" style="margin-top:5px; text-align:center;"></div>
</body>
<script src="<%=request.getContextPath()%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
laypage({
    cont: 'page11',
    pages: Math.ceil("${stupage}"/6), //可以叫服务端把总页数放在某一个隐藏域，再获取。假设我们获取到的是18 length
    skip: true, //是否开启跳页
    skin: '#6699FF',
    curr: function(){ //通过url获取当前页，也可以同上（pages）方式获取
        var page = location.search.match(/page=(\d+)/);
        return page ? page[1] : 1;
    }(), 
    jump: function(e, first){ //触发分页后的回调
        if(!first){ //一定要加此判断，否则初始时会无限刷新
        	var studengtname = document.getElementById("sousuo").value;
            location.href = '?page='+e.curr + '&stuName=' + encodeURI(encodeURI(studengtname));
        }
    }
});
</script>
<script type="text/javascript">
	function bianji(studentid) {
		layer.open({
		    type: 2,
		    title: '成果转化编辑页面',
		    shadeClose: true,
		    shade: 0.8,
		    shift: 1, //0-6的动画形式，-1不开启
		    area: ['800px', '80%'],
		    content: 'scoreeditor?stuId='+studentid
		});
	}
</script>
<script type="text/javascript">
	function sousuo() {
		var studentname = document.getElementById("sousuo").value;
		location.href = 'scorelist?stuName='+ encodeURI(encodeURI(studentname)) + '&page=1';
	}
</script>
</html>