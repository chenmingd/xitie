package com.fun.rrs.common;

import java.security.SecureRandom;
import java.util.UUID;

import org.springframework.util.IdGenerator;


public class IdGen implements IdGenerator {

	private static SecureRandom random = new SecureRandom();
	
	/**
	 * 封装JDK自带的UUID, 通过Random数字生成, 中间无-分割.
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	/**
	 * 使用SecureRandom随机生成Long. 
	 */
	public static long randomLong() {
		return Math.abs(random.nextLong());
	}

	@Override
	public UUID generateId() {
		
		return  UUID.randomUUID();
	}
}
