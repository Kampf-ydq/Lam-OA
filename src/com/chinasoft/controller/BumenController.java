package com.chinasoft.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinasoft.pojo.Bumen;

import com.chinasoft.service.BumenService;
@Controller
public class BumenController {
	@Resource
	private BumenService bumenService;
	
	@RequestMapping(value="/allBumen")
	public String getAllEmployee(HttpServletRequest request ){
		
		List<Bumen> bumen = new ArrayList<Bumen>();
		bumen = bumenService.selectAllBumen();
		
		request.setAttribute("bumen", bumen);
		
		
		
		return "table";
	}
	@RequestMapping(value="/allBumen1")
	public String getAllEmployee1(HttpServletRequest request ){
		
		List<Bumen> bumen = new ArrayList<Bumen>();
		bumen = bumenService.selectAllBumen();
		
		request.setAttribute("bumen", bumen);
		
		request.setAttribute("msg1", "!!部门号或该部门已存在!!");
		
		return "table";
	}
	
	@RequestMapping(value="/shanchu")
	public String deleteBumen(HttpServletRequest request ){
		String bnum=request.getParameter("bnum");
		System.out.println(bnum);
		Bumen bu=new Bumen();
		
		bu.setBnum(bnum);
		bumenService.deleteBumen(bu);	
		return "redirect:/allBumen";
	}
	
	
	@RequestMapping(value="/tianjia" ,method=RequestMethod.POST)
	public String addBumen(@RequestParam String User0,
			  @RequestParam String User1,@RequestParam String User2,
			  HttpServletRequest request,HttpSession session ){
		List<Bumen> bumen = new ArrayList<Bumen>();
		bumen = bumenService.selectAllBumen();
		if(User0==""||User1=="")
		{
			return "redirect:/allBumen";
		}
		for(Bumen bum:bumen)
		{
			if(User0.equals(bum.getBnum())||User1.equals(bum.getBname()))
			{
				
			  return "redirect:/allBumen1";
			}
		}
		
		Bumen bu=new Bumen();
		
		bu.setBnum(User0);
		bu.setBname(User1);
		bu.setBint(User2);
		bumenService.addBumen(bu);
		
		
		return "redirect:/allBumen";
	}
	
	
	
	@RequestMapping(value="/chazhao")
	public String selectBumen(HttpServletRequest request ){
		String bnum=request.getParameter("hao");
		String bname=request.getParameter("ming");
		
		List<Bumen> bumen = new ArrayList<Bumen>();
		if(!("".equals(bnum))&&!("".equals(bname)))
		{
			bumen=bumenService.selectBumenBytwo(bname,bnum);
			System.out.println(bname);
			
		}//���ա��ſա�����
		else{
		
		if("".equals(bname))
		{//����
		bumen=bumenService.selectBumenBybnum(bnum);
		}
		else
		{	//���ա��ſ�
			bumen=bumenService.selectBumenBybname(bname);
		}
	}
		request.setAttribute("bumen", bumen);
		return "table";
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="/xiugai")
	public String updateBumen(@RequestParam String User0,
			  @RequestParam String User1,@RequestParam String User2,
			  HttpServletRequest request ){
		
		
		Bumen bu=new Bumen();
		
		bu.setBnum(User0);
		bu.setBname(User1);
		bu.setBint(User2);
		bumenService.updateBumen(bu);
		
		
		return "redirect:/allBumen";
	}
}
