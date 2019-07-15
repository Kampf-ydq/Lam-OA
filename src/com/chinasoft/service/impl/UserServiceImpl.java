package com.chinasoft.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chinasoft.dao.UserMapper;
import com.chinasoft.pojo.User;
import com.chinasoft.service.UserService;

/*
 * �û���¼Service
 */
@Service
public class UserServiceImpl implements UserService {

	
	
	@Resource
	private UserMapper userMapper;
	
	@Override
	public User loginCheck(String yno, String pwd) {
		User user = null;
		boolean a=false;
		user = userMapper.selectLoginUser(yno);
		if(user!=null)
		{
		 a=user.getPwd().equals(pwd);
		}
		List<User> user1=userMapper.selectAllUser();
		for(User user2:user1)
		{
			if(user2.getId().equals(yno)&&a)
			{
				user = userMapper.selectLoginUser(yno);
				return user;
				
				
			}
			else
			{
				user = null;
			}
		}
		
		
		return user;
	}

	

	@Override
	public List<User> selectAllUser() {
		// TODO Auto-generated method stub
         List<User> user = new ArrayList<User>();
		
          user = userMapper.selectAllUser();
		
		return user;
	}



	@Override
	public List<User> selectUserByyno(String yno) {
		// TODO Auto-generated method stub
List<User> user = new ArrayList<User>();
		
user =userMapper.selectUserByyno(yno);
		
		return user;
	}



	@Override
	public List<User> selectUserByyname(String yname) {
		// TODO Auto-generated method stub
		List<User> user = new ArrayList<User>();
		
		user =userMapper.selectUserByyname(yname);
				
				return user;
	}



	@Override
	public List<User> selectUserBytwo(String yname, String yno) {
		// TODO Auto-generated method stub
List<User> user = new ArrayList<User>();
		
		user =userMapper.selectUserBytwo(yname,yno);
				
				return user;
	}



	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		userMapper.deleteUser(user);
	}



	@Override
	public User selectUserByyno1(String yno) {
		// TODO Auto-generated method stub
		User user = new User();
		
		user =userMapper.selectUserByyno1(yno);
				
				return user;
	}



	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userMapper.updateUser(user);
	}
}
