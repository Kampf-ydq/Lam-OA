package com.chinasoft.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinasoft.pojo.Meeting_information;
import com.chinasoft.pojo.Meeting_issue;
import com.chinasoft.service.Meeting_issueService;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/*
 * 会议发布管理
 * 
 * */

@Controller
public class Meeting_issueController {

	@Resource
	private Meeting_issueService meeting_issueService;
	
	@RequestMapping(value="/issue")
	public String getAllEmployee(HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer pageNo,
			@RequestParam(required=false) String empNo){
		
		List<Meeting_issue> issue = new ArrayList<Meeting_issue>();
		PageHelper.startPage(pageNo, 5);  //设置分页每页数目
		
		issue = meeting_issueService.selectAllM_issue();
		
		for(Meeting_issue emp : issue)
		{
			System.out.println(emp.getMeeting_name());
		}
		
		PageInfo page = new PageInfo(issue);
		request.setAttribute("page", page);
		
		return "meet_table";
	}

	@RequestMapping(value="/delete")
	public String deleteMeeting_issue(HttpServletRequest request ){
		String issue=request.getParameter("issue");
		System.out.println(issue);
		Meeting_issue meeting_issue=new Meeting_issue();	
		meeting_issue.setMeeting_id(issue);
		meeting_issueService.deleteAllMeeting_issue(meeting_issue);	
		return "redirect:/issue";	
	
	}
	
	@RequestMapping(value="/add1")
	public String addMeeting_issue(@RequestParam String a,
			  @RequestParam String b,@RequestParam String c,@RequestParam String d,
			  @RequestParam String f,@RequestParam String g,
			  HttpServletRequest request ){
		
	    System.out.println("a" +a);
		System.out.println("b" + b);
		System.out.println("c" +c);
		System.out.println("d" +d);
		System.out.println("f" + f);
		System.out.println("g" +g);
		
	if(a == null || b == null || c == null ||d == null ||f == null ||g == null){
		return "redirect:/issue";
	}
		
	Meeting_issue meeting_issue=new Meeting_issue();
		
	meeting_issue.setMeeting_id(a);
	meeting_issue.setMeeting_name(b);
	meeting_issue.setMeeting_place(c);
	meeting_issue.setMeeting_topic(d);
	meeting_issue.setStart_time(f);
	meeting_issue.setEnd_time(g);
	meeting_issueService.addMeeting_issue(meeting_issue);
	return "redirect:/issue";
	}
	
	
	
	@RequestMapping(value="/search")
	public String selectMeeting_issue(HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer pageNo,
			@RequestParam(required=false) String empNo ){
		List<Meeting_issue> issue = new ArrayList<Meeting_issue>();
		PageHelper.startPage(pageNo, 5);
		String meeting_name=request.getParameter("hao");
		String meeting_place=request.getParameter("ming");
		System.out.println(meeting_name);
		System.out.println(meeting_place);
		
		if("".equals(meeting_name))
		{

			issue=meeting_issueService.selectAllMeeting_place(meeting_place);
		
		}
		else
		{
			
			issue=meeting_issueService.selectAllMeeting_name(meeting_name);
		}
		System.out.println(meeting_name);
		request.setAttribute("issue", issue);
		PageInfo page = new PageInfo(issue);
	
		request.setAttribute("page", page);
		return "meet_table";
	}
	
	
	
	
	
	
}
