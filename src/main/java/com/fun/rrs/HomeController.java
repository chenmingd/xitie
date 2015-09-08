package com.fun.rrs;



import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fun.rrs.common.IdGen;
import com.fun.rrs.common.excel.ExportExcel;
import com.fun.rrs.model.User;
import com.fun.rrs.repositories.UserRepository;


@Controller
public class HomeController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
		int count=0;
		Sort s=new Sort("type");
		List<User> list=userRepository.findAll(s);
		for(User user:list){
			count+=user.getPs();
		}
		logger.info("list");
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		return "listUsers";
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public Map<String, String> add(User user){
		Map<String, String> mp=new HashMap<String, String>();
		mp.put("ret", "0");
		mp.put("msg", "系统出错，请联系开发人员");
		
		user.setId(IdGen.uuid());
		user.setAddTime(new Date().getTime());
		userRepository.save(user);
		return mp;
	}
	
	@RequestMapping("/down")
	public void down(HttpServletResponse response){
		

		Sort s=new Sort("type");
		List<User> list=userRepository.findAll(s);
			
			/*下载代码*/
			List<String> headerList = new ArrayList<String>();
			headerList.add("宾客类型"); //
			headerList.add("姓名"); //
			headerList.add("电话"); //
			headerList.add("参加人数"); //
			headerList.add("祝福"); //
			
			
			
			
			
			List<List<String>> dataList = new ArrayList<List<String>>();
			for(User user:list){
				List<String> dataRowList = new ArrayList<String>();
				dataRowList.add(user.getType()); //lotteryType
				dataRowList.add(user.getName()); //lotteryName
				dataRowList.add(user.getTel()); //userName
				dataRowList.add(String.valueOf(user.getPs())); //phone
				dataRowList.add(user.getNote()); //address
				dataList.add(dataRowList);
			}

			ExportExcel ee = new ExportExcel("宾客名单", headerList);
			
			for (int i = 0; i < dataList.size(); i++) {
				Row row = ee.addRow();
				for (int j = 0; j < dataList.get(i).size(); j++) {
					ee.addCell(row, j, dataList.get(i).get(j));
				}
			}
			try {
				ee.write(response, "婚宴宾客名单.xls");
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				ee.dispose();
			}
			
	}
	
}
