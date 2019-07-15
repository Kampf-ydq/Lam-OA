package com.chinasoft.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chinasoft.dao.CardMapper;
import com.chinasoft.pojo.Employee;
import com.chinasoft.service.CardService;

/*
 * ÃûÆ¬¼ÐService
 */
@Service
public class CardServiceImpl implements CardService {

	@Resource
	private CardMapper cardMapper;
	
	@Override
	public List<Employee> selectCardInfo() {
		List<Employee> list = new ArrayList<Employee>();
		list = cardMapper.selectCardInfo();
		return list;
	}

}
