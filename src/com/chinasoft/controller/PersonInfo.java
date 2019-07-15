package com.chinasoft.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chinasoft.pojo.Employee;
import com.chinasoft.service.CardService;

/*
 * ÃûÆ¬¼Ð¿ØÖÆÆ÷
 */
@Controller
public class PersonInfo {

	@Resource
	private CardService card;
	
	@RequestMapping("/mycard")
	public String showPersonInfo(HttpServletRequest request){
		List<Employee> list = new ArrayList<Employee>();
		list = card.selectCardInfo();
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getYname()+"--"+list.get(i).getCard().getC_degree());
		}
		
		request.setAttribute("cardlist", list);
		
		return "personInfo";
	}
}
