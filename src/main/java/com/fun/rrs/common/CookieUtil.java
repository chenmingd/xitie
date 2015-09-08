package com.fun.rrs.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtil {
	public static String getCookieValue(String name,HttpServletRequest request){
		String vString="";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null)
		for(Cookie cookie:cookies){
			if(name.equals(cookie.getName())){
				vString=cookie.getValue();
				break;
			}
		}
		return vString;
	}
}
