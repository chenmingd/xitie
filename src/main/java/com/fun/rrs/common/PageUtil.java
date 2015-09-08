package com.fun.rrs.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;


public class PageUtil {
	
	public static PageRequest createPageRequest(HttpServletRequest request){
		 String pg = request.getParameter("page");
		 String sz = request.getParameter("size");
		 int page=0,size=10;
		 if(StringUtils.isNotBlank(pg)){
			 page=Integer.parseInt(pg)-1;
			 page=page>0?page:0;
		 }
		 if(StringUtils.isNotBlank(sz)){
			 size=Integer.parseInt(sz);
			 size=size>0?size:10;
		 }
		return new PageRequest(page, size);
	}
	
	public static void wrapPage(Page page,HttpServletRequest request){
		 String pg = request.getParameter("page");
		 String sz = request.getParameter("size");
		 int pageNo=0,size=10;
		 if(StringUtils.isNotBlank(pg)){
			 pageNo=Integer.parseInt(pg)-1;
			 pageNo=pageNo>0?pageNo:0;
		 }
		 if(StringUtils.isNotBlank(sz)){
			 size=Integer.parseInt(sz);
			 size=size>0?size:10;
		 }
		 RrsPage rrsPage=new RrsPage(); 
		 rrsPage.setPageNo(pageNo);
		 rrsPage.setSize(size);
		 rrsPage.setTotalElements((int) page.getTotalElements());
		 rrsPage.setTotalPage(page.getTotalPages());
		 request.setAttribute("page", rrsPage);
		 request.setAttribute("list", page.getContent());
		 
	}
}
