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
<script type="text/javascript">
function xuanze(subjectid,studentid) {
	swal({
	    title: "您确定要选择本科研吗？",
	    text: "请选择与本人专业相关的科研！！",
	    type: "warning",
	    showCancelButton: true,
	    confirmButtonColor: "#DD6B55",
	    confirmButtonText: "选择",
	    closeOnConfirm: false
	}, function () {
		if (window.XMLHttpRequest){
    		// code for IE7+, Firefox, Chrome, Opera, Safari
    	  	xmlhttp=new XMLHttpRequest();
    	  }
    	else{// code for IE6, IE5
    	  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    	  }                                                       //创建XMLHttpRequest对象
    	xmlhttp.onreadystatechange=function(){
    	  if (xmlhttp.readyState==4 && xmlhttp.status==200){
    		  var a = eval("("+xmlhttp.responseText+")");
    		  if(a.status== 1){
    			  swal({title:"选择成功！",text:"您已经成功选择了本科研!",type:"success"}, 
							function () {
					  			location.href = "scoreone?page=1"+"&studentId="+'${userbean.userId}';
					    });
    		  }else{
    			  swal("哦豁","选择失败，请重试！","error");
    		  }
    	    }
    	  }	;											//服务器响应时完成相应操作
    	xmlhttp.open("post","xuanke?subjectId="+ subjectid + "&studentId=" + studentid ,true);
    	xmlhttp.send();
	});
}
</script>
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
		<div class="row">
		  <div class="col-md-3">
		  	<div class="input-group">
		      <input type="text" class="form-control" placeholder="输入科研名搜索" id = "sousuo" value = "${subjectname}">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="button" onclick="sousuo();">Go!</button>
		      </span>
	    	</div>
		  </div>
		  <div class="col-md-3"><button type="button" class="btn btn-default" onclick="yxkc();">查看已选择科研</button></div>
		  <div class="col-md-6"></div>
		</div>
		
	<br/>
	<table class="table table-hover">
		<tr class="info">
			<th>科研编号</th>
			<th>科研名字</th>
			<th>牵头人老师</th>
			<th>科研成果</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${subjectlist}" var="sbj">
		<tr>
			<td>${sbj.subjectId}</td>
			<td>${sbj.subjectName}</td>
			<td>${sbj.teacherName}</td>
			<td>${sbj.subjectCredit}</td>
				<td>
					<button id = "${sbj.subjectId}" type="button" class="btn btn-info btn-xs" onclick="xuanze(${sbj.subjectId},${userbean.userId});" >
						<i class="iconfont">&#xe66e;</i>
						&nbsp;添加本科研
					</button>
				</td>
		</tr>
		</c:forEach>
	</table>
	<div id="page11" style="margin-top:5px; text-align:center;"></div>
</body>
<script src="<%=request.getContextPath()%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
var aa = Math.ceil("${sbjpage}"/6);
laypage({
    cont: 'page11',
    pages: aa, //可以叫服务端把总页数放在某一个隐藏域，再获取。假设我们获取到的是18 length
    skip: true, //是否开启跳页
    skin: '#6699FF',
    curr: function(){ //通过url获取当前页，也可以同上（pages）方式获取
        var page = location.search.match(/page=(\d+)/);
        return page ? page[1] : 1;
    }(), 
    jump: function(e, first){ //触发分页后的回调
        if(!first){ //一定要加此判断，否则初始时会无限刷新
        	var subjectname = document.getElementById("sousuo").value;
            location.href = '?page='+e.curr + '&subjectName=' + encodeURI(encodeURI(subjectname)+'&studentId=' + '${userbean.userId}');
        }
    }
});
</script>
<script type="text/javascript">
	function sousuo() {
		var subjectname = document.getElementById("sousuo").value;
		location.href = 'scoreone?subjectName='+ encodeURI(encodeURI(subjectname)) + '&page=1' + '&studentId=' + '${userbean.userId}' ;
	}
	function yxkc() {
		layer.open({
		    type: 2,
		    title: '申请人已选科研信息页面',
		    shadeClose: true,
		    shade: 0.8,
		    shift: 1, //0-6的动画形式，-1不开启
		    area: ['800px', '80%'],
		    content: 'xsyxkc?studentId='+"${userbean.userId}"
		}); 
	}
</script>
</html>