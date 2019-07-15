package com.chinasoft.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chinasoft.dao.EmployeeMapper;
import com.chinasoft.pojo.Employee;
import com.chinasoft.pojo.User;
import com.chinasoft.service.EmployeeService;

/*
 * Ա������Service
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Resource
	private EmployeeMapper employMapper;
	
	
	@Override
	public List<Employee> selectAllEmployee() {
		List<Employee> list = new ArrayList<Employee>();
		
		list = employMapper.selectAllEmployee();
		
		return list;
	}

	@Override
	public void deleteEmployee(Employee em) {
		// TODO Auto-generated method stub
		employMapper.deleteEmployee(em);
	}

	@Override
	public void addEmployee(Employee em) {
		// TODO Auto-generated method stub
		employMapper.addEmployee(em);
	}

	@Override
	public void updateEmployee(Employee em) {
		// TODO Auto-generated method stub
		employMapper.updateEmployee(em);
	}

	@Override
	public List<Employee> selectEmployeeByyno(String yno) {
		// TODO Auto-generated method stub
List<Employee> em = new ArrayList<Employee>();
		
		em =employMapper.selectEmployeeByyno(yno);
		
		return em;
	}

	@Override
	public List<Employee> selectEmployeeByyname(String yname) {
		// TODO Auto-generated method stub
List<Employee> em = new ArrayList<Employee>();
		
		em =employMapper.selectEmployeeByyname(yname);
		
		return em;
	}

	@Override
	public List<Employee> selectEmployeeBytwo(String yname, String yno) {
		// TODO Auto-generated method stub
List<Employee> em = new ArrayList<Employee>();
		
		em =employMapper.selectEmployeeBytwo(yname,yno);
		
		return em;
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		employMapper.addUser(user);
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		employMapper.deleteUser(user);
	}

}
