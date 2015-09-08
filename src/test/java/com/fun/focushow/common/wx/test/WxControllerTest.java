package com.fun.focushow.common.wx.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration("src/main/webapp")
@ContextHierarchy({  
    @ContextConfiguration(name = "parent", locations = "classpath:root-context.xml"),  
    @ContextConfiguration(name = "child", locations = "classpath:servlet-context.xml")  
})
public class WxControllerTest {
	@Autowired
	private WebApplicationContext wac;
	private MockMvc mockMvc;
	
	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void testGetAccessToken() throws Exception {
		String appId = "wxc728d08e76e7be8f";
		String appSecret = "027605224f0fdd3b4be4f5d5700acb75";
		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/wx/getAccessToken").param("appId", appId).param("appSecret", appSecret)).andReturn();
		System.out.println(mvcResult.getResponse().getContentAsString());
	}
	
	@Test
	public void testGetJsapiTicket() throws Exception {
		String accessToken = "93R8D26e6zadjGhBWEjcZBAngAXGTBfn4ENHWrCHw-6GYLcD0BX021UimK2f8jgu35Nx9Lz355AczqObNg3yz0nCrV3CnRJzPYOfcrpWD5g";
		String appId = "wxc728d08e76e7be8f";
		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/wx/getJsapiTicket").param("accessToken", accessToken).param("appId", appId)).andReturn();
		System.out.println(mvcResult.getResponse().getContentAsString());
	}
	
	@Test
	public void testGetApiTicket() throws Exception {
		String accessToken = "93R8D26e6zadjGhBWEjcZBAngAXGTBfn4ENHWrCHw-6GYLcD0BX021UimK2f8jgu35Nx9Lz355AczqObNg3yz0nCrV3CnRJzPYOfcrpWD5g";
		String appId = "wxc728d08e76e7be8f";
		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/wx/getApiTicket").param("accessToken", accessToken).param("appId", appId)).andReturn();
		System.out.println(mvcResult.getResponse().getContentAsString());
	}
	
	@Test
	public void testCreateCardQrcode() throws Exception {
		String accessToken = "93R8D26e6zadjGhBWEjcZBAngAXGTBfn4ENHWrCHw-6GYLcD0BX021UimK2f8jgu35Nx9Lz355AczqObNg3yz0nCrV3CnRJzPYOfcrpWD5g";
		String cardId = "pYHvdswTLXp6rwYDvIhmdB0k7uxo";
		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/wx/createCardQrcode").param("accessToken", accessToken).param("cardId", cardId)).andReturn();
		System.out.println(mvcResult.getResponse().getContentAsString());
	}
	
}
