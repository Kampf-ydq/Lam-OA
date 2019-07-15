package com.chinasoft.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinasoft.pojo.Employee;
import com.chinasoft.pojo.User;

public interface UserMapper {

	//ͨ��name��pwd��¼
	public User selectLoginUser(@Param("yno") String yno);
	public void deleteUser(User user);
	public List<User> selectAllUser();
	public List<User> selectUserByyno(@Param("yno") String yno);
	public User selectUserByyno1(@Param("yno") String yno);
	public List<User> selectUserByyname(@Param("yname") String yname);
	public List<User> selectUserBytwo(@Param("yname") String yname, @Param("yno") String yno);
	public void updateUser(User user);
}
