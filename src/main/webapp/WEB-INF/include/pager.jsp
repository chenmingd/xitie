<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<pg:pager export="offset,curPage=pageNumber" 
	items="${page.totalElements}" 
	maxPageItems="${page.size}"
	maxIndexPages="10">
	<div  style="margin-left:15px;">
		<ul class="pagination">
			<pg:prev>
				 <li><a href="javascript:page(${pageNumber},${page.size})" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li> 
			</pg:prev>
			<pg:pages>
				<c:choose>
					<c:when test="${(page.pageNo+1) eq pageNumber}">
						 <li class="active"><a href="javascript:void(0)">${pageNumber}<span class="sr-only">(current)</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:page(${pageNumber},${page.size})">${pageNumber}</a></li>
					</c:otherwise>
				</c:choose>
			</pg:pages>
			<pg:last>
				     <li><a href="javascript:page(${pageNumber},${page.size})" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			</pg:last>
			<li><span style="padding: 3px;">每页显示<input type="number" value="${page.size}" onchange="page(1,this.value)" min="5" style="height:26px;width:40px;text-align:center;"></span></li>
			<li><span>${page.totalElements} 条数据</span></li>
			<li><span>共 ${page.totalPage} 页</span></li>
		</ul>
	</div>
	</pg:pager>