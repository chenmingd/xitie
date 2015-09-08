<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sharePath = request.getContextPath();
	String shareBase = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + sharePath + "/";
%>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
function weixinCallBack(wxConfig) {
		wx.config({
			debug : false, /*开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。*/
			appId : wxConfig.Basic.appId, /*必填，公众号的唯一标识*/
			timestamp : wxConfig.Basic.timestamp, /*必填，生成签名的时间戳*/
			nonceStr : wxConfig.Basic.nonceStr, /*必填，生成签名的随机串*/
			signature : wxConfig.Basic.signature,/*必填，签名，见附录1*/
			jsApiList : [ 'onMenuShareTimeline', 'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo', 'onMenuShareQZone', 'addCard' ]
		/*必填，需要使用的JS接口列表，所有JS接口列表见附录2*/
		});
		wx.ready(function() {
			wx.onMenuShareTimeline({
			    title: wxConfig.Basic.title, /*分享标题*/
			    link: wxConfig.Basic.link, /*分享链接*/
			    imgUrl: wxConfig.Basic.imgUrl, /*分享图标*/
			    success: function () { 
			    	fsLog(3);
			    	/*用户确认分享后执行的回调函数*/
			    },
			    cancel: function () { 
			    	/*用户取消分享后执行的回调函数*/
			    }
			});
			wx.onMenuShareAppMessage({
			    title: wxConfig.Basic.title, /*分享标题*/
			    desc: wxConfig.Basic.desc, /*分享描述*/
			    link: wxConfig.Basic.link, /*分享链接*/
			    imgUrl: wxConfig.Basic.imgUrl, /*分享图标*/
			    success: function () { 
			    	/*用户确认分享后执行的回调函数*/
			    	fsLog(4);
			    },
			    cancel: function () { 
			    	/*用户取消分享后执行的回调函数*/
			    }
			});
			/*添加卡券*/
			document.querySelector('#Bombox2But2').onclick = function() {
				$("#BomboxBg3").hide();
				var cardArray = []; 
				for(var i=0;i<wxConfig.Cards.length;i++) {
					var o = {};
					o.cardId = wxConfig.Cards[i].cardId;
					o.cardExt = wxConfig.Cards[i].cardExt;
					//o.cardExt.code = wxConfig.Cards[i].code;
					//o.cardExt.openid = wxConfig.Cards[i].openid;
					//o.cardExt.timestamp = wxConfig.Cards[i].timestamp;
					//o.cardExt.nonce_str = wxConfig.Cards[i].nonceStr;
					//o.cardExt.signature = wxConfig.Cards[i].signature;
					cardArray.push(o);
	            }
				wx.addCard({
					cardList : cardArray,
					success : function(res) {
						$.ajax({
							type: "GET",
							url: "lottery/getAward",
							data: {"id": $("#awardId").val()},
							dataType: "json",
							success: function(data) {
								reConfig();
							},
							error: function(data) {
								reConfig();
							}
						});  
						/*alert('已添加卡券：' + JSON.stringify(res.cardList));*/
					}
				});
			};
		});
	}
	$(function() {
		reConfig();
	});
	function fsLog(type){
		window.FSHM.log('<%=shareBase%>',type);
	}
	
	var $shareScript=null;
	
	function reConfig() {
		if($shareScript!=null){$shareScript.remove();}
		var src = "<%=shareBase%>/wx/getWxConfig?callBack=weixinCallBack";
		src += "&url="+encodeURIComponent(window.location.href);
		src += "&name="+encodeURIComponent('<%=request.getParameter("name")%>');
		src += "&page="+encodeURIComponent('<%=request.getParameter("page")%>');
		src += "&tt="+new Date();
		$shareScript =$('<script type="text/javascript" src="' + src + '"><\/script>')
		$("head").append($shareScript);
	}
</script>