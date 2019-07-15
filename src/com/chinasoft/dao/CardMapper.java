package com.chinasoft.dao;

import java.util.List;

import com.chinasoft.pojo.Employee;

public interface CardMapper {

	public List<Employee> selectCardInfo(); //员工表employee、名片表card联查
}
