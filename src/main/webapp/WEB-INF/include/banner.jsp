<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!-- 头部日期-->
        <div style="position: absolute;left:456px;top:145px;width: 183px;" class="resize rdate">${rdate}</div>
        <c:choose>
         	<c:when test="${canLottery == '1'}">
		        <img src="resources/images/pub/cj.gif" class="resize LuckDraw" style="width:266px;height: 144px;position: absolute;left:33px;top:863px;">
            </c:when>
            <c:when test="${canLottery == '0'}">
		        <img src="resources/images/pub/ggn.gif" class="resize" style="width:266px;height: 144px;position: absolute;left:33px;top:863px;">
            </c:when>
         </c:choose>

        <c:choose>
            	<c:when test="${shangwei == '0'}">
			        <div class="operation">
			            <img src="resources/images/pub/bzxg.png" class="resize FotS_f" style="width:258px;height: 83px;position: absolute;left:30px;top:1035px;">
			            <img src="resources/images/pub/cxzw.png" class="resize FotS_r" style="width:258px;height: 83px;position: absolute;left:345px;top:1035px;">
			        </div>
            	</c:when>
            	<c:when test="${shangwei == '1'}">
			        <img src="resources/images/pub/stt.png" class="resize FotS2" style="width:339px;height: 89px;position: absolute;left:128px;top:1035px;">
            	</c:when>
            </c:choose>