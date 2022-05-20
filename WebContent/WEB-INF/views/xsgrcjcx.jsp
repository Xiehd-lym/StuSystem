<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<title>科研列表</title>
</head>
<body background="<%=request.getContextPath()%>/images/010.gif">
<div class="container-fluid">
	<div class="row">
	  <div class="col-md-4"></div>
	  <div class="col-md-4"><h2 class="text-center">申请人个人科研信息管理表</h2></div>
	  <div class="col-md-4"></div>
	</div>
</div>
	<br/>
	<table class="table table-hover" id = 'table'>
		<tr class="info">
			<th>科研编号</th>
			<th>科研名字</th>
			<th>牵头人老师</th>
			<th>科研介绍</th>
			<th>分数</th>
		</tr>
		<c:forEach items="${scoreonelist}" var="sco">
		<tr>
			<td>${sco.subjectId}</td>
			<td>${sco.subjectName}</td>
			<td>${sco.teacherName}</td>
			<td>${sco.subjectCredit}</td>
			<td>${sco.score}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="row">
	  <div class="col-md-4"></div>
	  <div class="col-md-4"><h1>${h1}</h1></div>
	  <div class="col-md-4"></div>
	</div>
	<div id="page11" style="margin-top:5px; text-align:center;"></div>
</body>
</html>