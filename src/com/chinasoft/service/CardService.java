package com.chinasoft.service;

import java.util.List;

import com.chinasoft.pojo.Employee;

public interface CardService {

	public List<Employee> selectCardInfo(); //员工表employee、名片表card联查
}
