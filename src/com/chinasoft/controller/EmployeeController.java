package com.chinasoft.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinasoft.pojo.Bumen;
import com.chinasoft.pojo.Employee;
import com.chinasoft.pojo.User;
import com.chinasoft.service.EmployeeService;
import com.chinasoft.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/*
 * �û�����Controller
 */
@Controller
public class EmployeeController {

	@Resource
	private EmployeeService employeeService;
	
	@RequestMapping(value="/obatainAllemp")
	public String obatinAllEmployee(HttpServletRequest request){
		
		List<Employee> employees = new ArrayList<Employee>();
		employees = employeeService.selectAllEmployee();
		
		request.setAttribute("employlist", employees);
		
		return "sign_table";
	}
	@RequestMapping(value="/allEmployee")
	public String getAllEmployee(HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer pageNo,
			@RequestParam(required=false) String empNo){
		List<Employee> employee = new ArrayList<Employee>();
		PageHelper.startPage(pageNo, 10);
		
		employee = employeeService.selectAllEmployee();
		PageInfo page = new PageInfo(employee);

		request.setAttribute("employee", employee);
		request.setAttribute("page", page);

		
		return "table1";
	}
	@RequestMapping(value="/allEmployee1")
	public String getAllEmployee1(HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer pageNo,
			@RequestParam(required=false) String empNo){
		List<Employee> employee = new ArrayList<Employee>();
		PageHelper.startPage(pageNo, 10);
		
		employee = employeeService.selectAllEmployee();
		PageInfo page = new PageInfo(employee);

		request.setAttribute("employee", employee);
		request.setAttribute("page", page);
		request.setAttribute("msg1", "!!员工号已存在!!");
		
		return "table1";
	}
	
	@RequestMapping(value="/shanchu1")
	public String deleteEmployee(HttpServletRequest request ){
		String yno=request.getParameter("yno");
		System.out.println(yno);
		
		
		Employee em=new Employee();
		User user=new User();
		em.setYno(yno);
		user.setId(yno);
		
		employeeService.deleteEmployee(em);
		employeeService.deleteUser(user);
		
		return "redirect:/allEmployee";
	}
	
	
	@RequestMapping(value="/tianjia1",method=RequestMethod.POST)
	public String addEmployee(@RequestParam String User0,
			  @RequestParam String User1,@RequestParam String User2,@RequestParam String User3,
			  @RequestParam String User4,@RequestParam String User5,@RequestParam String User6,
			  @RequestParam String User7,@RequestParam String User8,@RequestParam String User9,
			 
			  HttpServletRequest request ){
		
		List<Employee> employee = new ArrayList<Employee>();
		employee =employeeService.selectAllEmployee();
		if(User8==""||User7=="")
		{
			return "redirect:/allEmployee";
		}
		for(Employee em:employee)
		{
			if(User8.equals(em.getYno()))
			{
				
			  return "redirect:/allEmployee1";
			}
		}
		
		
		Employee em=new Employee();
		User user=new User();
		em.setAdress(User0);
		em.setAge(User1);
		em.setEmail(User2);
		em.setPhone(User3);
		em.setPname(User4);
		em.setSalary(User5);
		em.setSex(User6);
		em.setYname(User7);
		em.setYno(User8);
		em.setZname(User9);
		
	user.setId(User8);
	user.setName(User7);
	user.setPwd("000000");
		employeeService.addEmployee(em);
		employeeService.addUser(user);
		
		return "redirect:/allEmployee";
	}
	
	
	
	@RequestMapping(value="/chazhao1")
	public String selectBumen(HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer pageNo,
			@RequestParam(required=false) String empNo){
		List<Employee> employee = new ArrayList<Employee>();
		
		PageHelper.startPage(pageNo, 10);
		
		String yno=request.getParameter("hao");
		String yname=request.getParameter("ming");
		System.out.println(yno);
		System.out.println(yname);
		
		
		
		if(!("".equals(yno))&&!("".equals(yname)))
		{
			
			
			employee=employeeService.selectEmployeeBytwo(yname,yno);
			
		}
	else{//���ա����ա��ſ�
		
		if("".equals(yname)&&!("".equals(yno)))
		{//����
			
			employee=employeeService.selectEmployeeByyno(yno);
			
		}
		
		else//���ա��ſ�
		{
			
				employee=employeeService.selectEmployeeByyname(yname);
				
		}
		
		
	}
		System.out.println(yno);
		System.out.println(yname);
		PageInfo page = new PageInfo(employee);
		request.setAttribute("employee", employee);
		request.setAttribute("page", page);
		return "table1";
	}
	
	
	
	
	@RequestMapping(value="/xiugai1")
	public String updateBumen(@RequestParam String User0,
			  @RequestParam String User1,@RequestParam String User2,@RequestParam String User3,
			  @RequestParam String User4,@RequestParam String User5,@RequestParam String User6,
			  @RequestParam String User7,@RequestParam String User8,@RequestParam String User9,
			  
			  HttpServletRequest request ){
		
		System.out.println("User0" +User0);
		System.out.println("User1" + User1);
		System.out.println("User2" +User2);
		
		Employee em=new Employee();
		
		em.setAdress(User0);
		em.setAge(User1);
		em.setEmail(User2);
		em.setPhone(User3);
		em.setPname(User4);
		em.setSalary(User5);
		em.setSex(User6);
		em.setYname(User7);
		em.setYno(User8);
		em.setZname(User9);
		
		employeeService.updateEmployee(em);
		
		
		return "redirect:/allEmployee";
	}
}
