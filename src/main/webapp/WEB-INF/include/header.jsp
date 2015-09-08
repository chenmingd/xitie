<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path1 = request.getContextPath(); 
 	String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/"; 
%>
<head lang="zh">
	<base href="<%=basePath1%>" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0'/>
    <meta name="description" content="范先生,focushow.cn">
	<meta name="Keywords" content="范先生，focoushow.cn,日日顺，移动范，抽奖，微信卡劵">
	<meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="resources/css/but.css"/>
    <script src="resources/js/fastclick.js"></script>
    <script src="resources/js/jquery-1.10.2.min.js"></script>
    <title>日日顺带你上头条</title>
    <style>
    	@keyframes bounceIn {
		  0%, 20%, 40%, 60%, 80%, 100% {
		    animation-timing-function: cubic-bezier(0.215, 0.610, 0.355, 1.000);
		  }
		
		  0% {
		    opacity: 0;
		    transform: scale3d(.3, .3, .3);
		  }
		
		  20% {
		    transform: scale3d(1.1, 1.1, 1.1);
		  }
		
		  40% {
		    transform: scale3d(.9, .9, .9);
		  }
		
		  60% {
		    opacity: 1;
		    transform: scale3d(1.03, 1.03, 1.03);
		  }
		
		  80% {
		    transform: scale3d(.97, .97, .97);
		  }
		
		  100% {
		    opacity: 1;
		    transform: scale3d(1, 1, 1);
		  }
		}
		
		@-webkit-keyframes bounceIn {
		  0%, 20%, 40%, 60%, 80%, 100% {
		    -webkit-animation-timing-function: cubic-bezier(0.215, 0.610, 0.355, 1.000);
		  }
		
		  0% {
		    opacity: 0;
		    -webkit-transform: scale3d(.3, .3, .3);
		  }
		
		  20% {
		    -webkit-transform: scale3d(1.1, 1.1, 1.1);
		  }
		
		  40% {
		    -webkit-transform: scale3d(.9, .9, .9);
		  }
		
		  60% {
		    opacity: 1;
		    -webkit-transform: scale3d(1.03, 1.03, 1.03);
		  }
		
		  80% {
		    -webkit-transform: scale3d(.97, .97, .97);
		  }
		
		  100% {
		    opacity: 1;
		    -webkit-transform: scale3d(1, 1, 1);
		  }
		}
		
		
		.bounceIn {
		  -webkit-animation: bounceIn 2.5s 1s 1;animation: bounceIn 2.5s 1s 1;
		}
		    	
    </style>
	<script type="text/javascript">
		window.addEventListener('load', function() {
	        FastClick.attach(document.body);
	    }, false);
	</script>
</head>