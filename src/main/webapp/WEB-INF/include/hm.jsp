<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path1 = request.getContextPath(); 
 	String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/"; 
%>
<script type="text/javascript" src="resources/js/hm.js?tt"></script>
<script type="text/javascript">
	$(function(){
		 window.FSHM.log("<%=basePath1%>",2); /**男女版pv uv*/
	})
</script>