package com.fun.rrs.common;

import java.util.HashMap;
import java.util.Map;

public class UserLogType {
	/**
	 * 默认首页
	 */
	public static String TYPE_PAGE_INDEX="1"; 
	/**
	 * 男版女版页面
	 */
	public static String TYPE_PAGE_OTHER="2"; 
	/**
	 * 分享到朋友圈
	 */
	public static String TYPE_SHARE_friend_circle="3"; 
	/**
	 * 分享到好友
	 */
	public static String TYPE_SHARE_friend="4"; 
	/**
	 * 首页上头条按钮
	 */
	public static String TYPE_BUTTON_INDEX_shangtt="5"; 
	/**
	 * 首页信息提按钮交
	 */
	public static String TYPE_BUTTON_INDEX_submit="6"; 
	/**
	 * 男版女版上头条按钮
	 */
	public static String TYPE_BUTTON_OTHER_shangtt="7"; 
	/**
	 * 男版女版重新占位按钮
	 */
	public static String TYPE_BUTTON_OTHER_reshangtt="8"; 
	/**
	 * 男版女版信息提交按钮
	 */
	public static String TYPE_BUTTON_OTHER_submit="9"; 
	
	
	public static Map<String, String> TYPE_LOG=new HashMap<String, String>();
	public UserLogType(){
		TYPE_LOG.put("1", "首页");
		TYPE_LOG.put("2", "男版女版页");
		TYPE_LOG.put("3", "分享到朋友圈");
		TYPE_LOG.put("4", "分享到好友");
		TYPE_LOG.put("5", "首页我要占位按钮");
		TYPE_LOG.put("6", "首页信息提交按钮");
		TYPE_LOG.put("7", "男版女版页我也要上头条按钮");
		TYPE_LOG.put("8", "男版女版页重新占位按钮");
		TYPE_LOG.put("9", "男版女版页信息提交按钮");
	}
	
	public static String getTypeName(String name){
		return TYPE_LOG.get(name);
	}
	
	
	
	
	
	
	
	/**
	 * 女
	 */
	public static String WOM_w="w"; 
	/**
	 * 男
	 */
	public static String WOM_m="m"; 
	/**
	 *公共页面
	 */
	public static String WOM_p="m"; 
}
