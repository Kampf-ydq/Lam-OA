package com.chinasoft.service;


import java.util.List;

import com.chinasoft.pojo.User;

public interface UserService {

	public User loginCheck(String yno,String pwd);
	public void deleteUser(User user);
	public List<User> selectAllUser();
	public List<User> selectUserByyno( String yno);
	public User selectUserByyno1( String yno);
	public List<User> selectUserByyname( String yname);
	public List<User> selectUserBytwo( String yname,  String yno);
	public void updateUser(User user);
}
