package com.chinasoft.service;

import java.util.List;



import com.chinasoft.pojo.Employee;
import com.chinasoft.pojo.User;

public interface EmployeeService {
	
	public List<Employee> selectAllEmployee();
	public void deleteEmployee(Employee em);
	public void deleteUser(User user);
	public void addUser(User user);
	public void addEmployee(Employee em);
	public void updateEmployee(Employee em);
	public List<Employee> selectEmployeeByyno( String yno);
	public List<Employee> selectEmployeeByyname( String yname);
	public List<Employee> selectEmployeeBytwo( String yname,  String yno);
}
