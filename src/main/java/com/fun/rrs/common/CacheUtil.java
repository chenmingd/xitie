package com.fun.rrs.common;

import java.util.HashMap;
import java.util.Map;

public class CacheUtil {
	private static Map<String, Object> cacheMap=new HashMap<String, Object>();
	
	/**
	 * 缓存的中奖配置(可以抽奖的)
	 */
	public final static String CACHE_LOTTERYS_CONFIG_NAME="CACHE_LOTTERYS_CONFIG_NAME";
	
	
	/**
	 * 缓存的中奖配置(所有的)
	 */
	public final static String CACHE_LOTTERYS="CACHE_LOTTERYS";
	
	/**
	 * 缓存中默认的奖品
	 */
	public final static String CACHE_LOTTERY_DEFAULT_NAME="CACHE_LOTTERY_DEFAULT_NAME";
	
	public static Object getCache(String key){
		return cacheMap.get(key);
	}
	
	public static Object putCache(String key,Object cache){
		cacheMap.put(key, cache);
		return cache;
	}
	
	public static Object removeCache(String key){
		Object object=cacheMap.remove(key);
		return object;
	}
	
}
