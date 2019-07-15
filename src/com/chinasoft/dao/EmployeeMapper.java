package com.chinasoft.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.chinasoft.pojo.Employee;
import com.chinasoft.pojo.User;

public interface EmployeeMapper {

	public List<Employee> selectAllEmployee();
	public void deleteUser(User user);
	public void deleteEmployee(Employee em);
	public void addEmployee(Employee em);
	public void addUser(User user);
	public void updateEmployee(Employee em);
	public List<Employee> selectEmployeeByyno(@Param("yno") String yno);
	public List<Employee> selectEmployeeByyname(@Param("yname") String yname);
	public List<Employee> selectEmployeeBytwo(@Param("yname") String yname, @Param("yno") String yno);
}
