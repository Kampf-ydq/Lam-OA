package com.chinasoft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * Ò³ÃæÌø×ªController
 */
@Controller
public class PageController {

	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("/nav")
	public String nav(){
		return "nav";
	}
	
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/form")
	public String form(){
		return "form";
	}
	
	@RequestMapping("/table")
	public String table(){
		return "table";
	}
	
	@RequestMapping("/sign_table")
	public String sign_table(){
		return "sign_table";
	}
	
	@RequestMapping("/check_table")
	public String check_table(){
		return "check_table";
	}
	@RequestMapping("/table1")
	public String table1(){
		return "table1";
	}
}
