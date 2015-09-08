package com.fun.rrs.common;

import javax.servlet.http.HttpServletRequest;

public class UserUtil {
	public static boolean hasLogin(HttpServletRequest request){
		 Object attribute = request.getSession().getAttribute("login_userName");
		 if(attribute==null){
			 return false;
		 }
		 return true;
	}
	
	public static boolean login(String name,String pass,HttpServletRequest request){
//		if("rrsshangchen".equals(name) && "rrsShangChen888".equals(pass)){
		if("admin".equals(name) && "admin".equals(pass)){
			request.getSession().setAttribute("login_userName", "rrsshangchen");
			return true;
		}
		return false;
	}
	
	public static void loginOut(HttpServletRequest request){
		request.getSession().removeAttribute("login_userName");
	}
}
