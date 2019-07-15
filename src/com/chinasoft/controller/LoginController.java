package com.chinasoft.controller;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chinasoft.pojo.User;
import com.chinasoft.service.UserService;
import com.chinasoft.utils.Contans;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/*
 * �û�����Controller
 */
@Controller
public class LoginController {

	@Resource
	private UserService userService; 
	@RequestMapping(value="/allUser")
	public String getAllUser(HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer pageNo,
			@RequestParam(required=false) String empNo ){
		
		List<User> user = new ArrayList<User>();
		
PageHelper.startPage(pageNo, 10);
		
user = userService.selectAllUser();
		PageInfo page = new PageInfo(user);

		for(User user1:user)
		{
			String a=user1.getPwd();
			user1.setPwd(a.replaceAll(".*","******"));
			
		}
		
		request.setAttribute("user", user);
		request.setAttribute("page", page);
		
		
		return "table2";
	}
	

	@RequestMapping(value="/doLogin.html",method=RequestMethod.POST)
	public String doLogin(@RequestParam String yno,
						  @RequestParam String pwd,HttpServletRequest request,HttpSession session){
		
		
		
		String cap = request.getParameter("cap");
        Integer res = (Integer)request.getSession().getAttribute("res");
        if(yno==""||pwd==""||cap=="")
		{
			return "login";
		}
        
        if((res!=null)&&!(Integer.parseInt(cap) == res)) {
            // 填写正确，注册成功
        	
        	request.setAttribute("message", "验证码输入有误!");
        	return "login";
          

        } else {
        	request.getSession().removeAttribute("res");
        
		
		User user = userService.loginCheck(yno, pwd);
		User user1=userService.selectUserByyno1(yno);
		
		
		if (user != null) {
			session=request.getSession();
			session.setAttribute(Contans.USER_SESSION, user1.getName());
			return "main";
		}else {
			request.setAttribute("msg", "用户名或密码错误");
			return "login";
		}
	}
	}
	
	
	@RequestMapping(value="/main.html")
	public String main(){
		return "main";
	}
	
	//�˳�
	@RequestMapping(value="/logout.html")
	public String logOut(HttpSession session){
		session.removeAttribute(Contans.USER_SESSION);
		return "login";
	}
	@RequestMapping(value="/login.html")
	public String logIN(HttpSession session,HttpServletResponse response,HttpServletRequest request){
		
		return "login";
	}
	
	
	
	@RequestMapping(value="/chazhao2")
	public String selectBumen(HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer pageNo,
			@RequestParam(required=false) String empNo){
		List<User> user = new ArrayList<User>();
		
		PageHelper.startPage(pageNo, 10);
		
		String yno=request.getParameter("hao");
		String yname=request.getParameter("ming");
	
		
		
		if(!("".equals(yno))&&!("".equals(yname)))
		{
			
			
			user=userService.selectUserBytwo(yname,yno);
			
		}
	else{//���ա����ա��ſ�
		
		if("".equals(yname)&&!("".equals(yno)))
		{//����
			
			user=userService.selectUserByyno(yno);
		
		}
		
		else//���ա��ſ�
		{
			
			user=userService.selectUserByyname(yname);
			
		}
		
		
	}
		System.out.println(yno);
		System.out.println(yname);
		PageInfo page = new PageInfo(user);
		for(User user1:user)
		{
			String a=user1.getPwd();
			user1.setPwd(a.replaceAll(".*","******"));
			
		}
		request.setAttribute("user", user);
		request.setAttribute("page", page);
		return "table2";
	}
	@RequestMapping(value="/chongzhi")
	public String updateBumen(@RequestParam String yno,
			  
			  HttpServletRequest request ){
		
		
		
		User user=new User();
		
		user.setId(yno);
		user.setPwd("000000");
		
		userService.updateUser(user);
		
		
		return "redirect:/allUser";
	}

	
	@RequestMapping(value="/shanchu2")
	public String deleteEmployee(HttpServletRequest request ){
		String yno=request.getParameter("yno");
		System.out.println(yno);
		
		
		User user=new User();
		
		user.setId(yno);
		userService.deleteUser(user);
		
		
		return "redirect:/allUser";
	}
}
