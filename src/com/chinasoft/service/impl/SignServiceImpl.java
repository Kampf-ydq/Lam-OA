package com.chinasoft.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chinasoft.dao.SignMapper;
import com.chinasoft.pojo.Sign;
import com.chinasoft.service.SignService;

/*
 * 签到表Service
 */
@Service
public class SignServiceImpl implements SignService {

	@Resource
	private SignMapper signMapper;
	
	@Override
	public int addSignData(Sign sign) {
		return signMapper.addSignData(sign);
	}

	@Override
	public List<Sign> selectAllSign() {
		List<Sign> list = new ArrayList<Sign>();
		list = signMapper.selectAllSign();
		return list;
	}

	@Override
	public List<Sign> searchEmpByNo(String g_yno) {
		List<Sign> list = new ArrayList<Sign>();
		list = signMapper.searchEmpByNo(g_yno);
		return list;
	}

	@Override
	public void deleteSignById(String g_id) {
		
		signMapper.deleteSignById(g_id);
	}

	@Override
	public int modify(String g_id, String g_date, String g_scode) {
		return signMapper.modify(g_id, g_date, g_scode);
	}

	//根据查询条件，分别统计该条件下的记录条数
	@Override
	public int selectByDate(String g_scode, String g_date) {
		int count = signMapper.selectByStatus(g_scode, g_date);
		return count;
	}

}
