package com.chinasoft.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinasoft.pojo.Meeting_information;

import com.chinasoft.service.Meeting_informationService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

 
/*
 * 会议室管理
 * 
 * */

@Controller
public class Meeting_informationController {

	@Resource
	private Meeting_informationService meeting_informationService;
	
	@RequestMapping(value="/meeting")
	public String getAllMeeting_information(HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer pageNo,
			@RequestParam(required=false) String empNo){
		
		List<Meeting_information> meeting_infors = new ArrayList<Meeting_information>();
		
		PageHelper.startPage(pageNo, 5);  //设置分页每页数目
		
		meeting_infors = meeting_informationService.selectAllM_information();
		
		for(Meeting_information emp : meeting_infors)
		{
			System.out.println(emp.getMeeting_name());
		}
		PageInfo page = new PageInfo(meeting_infors);
		request.setAttribute("infors", meeting_infors);
		request.setAttribute("page", page);
		return " meet_table2";
	}
	
	
	@RequestMapping(value="/delete1")
	public String deleteAllMeeting_information(HttpServletRequest request ){
		String infors=request.getParameter("infors");
		System.out.println(infors);
		Meeting_information meeting_infors=new Meeting_information();
		meeting_infors.setMeeting_id(infors);
		meeting_informationService.deleteAllMeeting_information(meeting_infors);	
		return "redirect:/meeting";	
	
	}
	
	
	@RequestMapping(value="/add")
	public String addMeeting_information(@RequestParam String a,
			  @RequestParam String b,@RequestParam String c,@RequestParam int d,
			  HttpServletRequest request ){
		
		System.out.println("a" +a);
		System.out.println("b" + b);
		System.out.println("c" +c);
		System.out.println("d" +d);
	Meeting_information meeting_infors=new Meeting_information();
		
	meeting_infors.setMeeting_id(a);
	meeting_infors.setMeeting_name(b);
	meeting_infors.setMeeting_place(c);
	meeting_infors.setPerson_nums(d);
	meeting_informationService.addMeeting_information(meeting_infors);
	return "redirect:/meeting";
	}
	
	@RequestMapping(value="/update")
	public String updateBumen(@RequestParam String a,
			  @RequestParam String b,@RequestParam String c,@RequestParam int d,
			  HttpServletRequest request ){
		
		System.out.println("a" +a);
		System.out.println("b" + b);
		System.out.println("c" +c);
		System.out.println("d" +d);		
		Meeting_information meeting_infors=new Meeting_information();
		
		meeting_infors.setMeeting_id(a);
		meeting_infors.setMeeting_name(b);
		meeting_infors.setMeeting_place(c);
		meeting_infors.setPerson_nums(d);
		
		meeting_informationService.updateMeeting_information(meeting_infors);
		return "redirect:/meeting";
		
	
	
	}
	
	
}
