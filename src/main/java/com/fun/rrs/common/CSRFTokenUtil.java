package com.fun.rrs.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 消除部分CSRF请求
 * @author admin
 *
 */
public class CSRFTokenUtil {
	
	public static void createToke(HttpServletRequest request,HttpServletResponse response){
		String value=IdGen.uuid();
		Cookie cookie=new Cookie("csrfToken", value);
		cookie.setPath("/");
		request.getSession().setAttribute("csrfToken", value);
		response.addCookie(cookie);
	}
	
	public static boolean isCSRFRequest(HttpServletRequest request,HttpServletResponse response){
		boolean flag=true;
		String value=(String) request.getSession().getAttribute("csrfToken");
		if(StringUtils.isNotBlank(value)){
			Cookie[] cookies = request.getCookies();
			for(Cookie c:cookies){
				if("csrfToken".equals(c.getName()) && value.equals(c.getValue())){
					flag=false;
					break;
				}
			}
		}
		return flag;
	}
}
