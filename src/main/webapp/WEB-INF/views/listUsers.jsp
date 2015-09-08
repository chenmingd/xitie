<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>" />
<title>婚宴参加名单</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery_2.1.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<style>
	body {padding-top: 20px;padding-bottom: 20px;}
	.navbar { margin-bottom: 20px;}
</style>
</head>
<body>
<div class="container">
      <div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">喜宴宾客</h3><br/>
		    <h6 class="panel-title">总人数:<span style="color:red;">${count}</span></h6>
		  </div>
		  <div class="panel-body">
		    <table class="table table-bordered table-hover">
				<thead>
		        <tr class="success">
		          <th>序号</th>
		          <th>type</th>
		          <th>姓名</th>
		          <th>电话</th>
		          <th>参加人数</th>
		          <th>祝福语</th>
		        </tr>
		      </thead>
		      <tbody>
		      	<c:forEach items="${list}" var="config" varStatus="status">
		      		<tr>
			          <th scope="row">${status.count}</th>
			          <td>${config.type}</td>
			          <td>${config.name}</td>
			          <td>${config.tel}</td>
			          <td>${config.ps}</td>
			          <td>${config.note}</td>
			        </tr>
		      	</c:forEach>
		      </tbody>
			</table>
		  </div>
		</div>
<a  type="button" class="btn btn-primary btn-sm"  href="down" target="_blank">下载列表</a>
<p>备注：本信息是通过电子邀请函填写情况统计的。&nbsp;&nbsp;&nbsp;&nbsp;祝一对新人 百年好合 幸福美满</p>
    </div>
  
</body>
</html>