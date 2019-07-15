package com.chinasoft.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chinasoft.dao.Meeting_informationMapper;

import com.chinasoft.pojo.Meeting_information;

import com.chinasoft.service.Meeting_informationService;


/*
 * 会议室管理
 * 
 * */
@Service
public class Meeting_informationServiceImpl implements Meeting_informationService {

	@Resource
	private Meeting_informationMapper m_information;
	 
	//显示
	@Override        
	public List<Meeting_information> selectAllM_information() {
		List<Meeting_information> list1 = new ArrayList<Meeting_information>();
		
		list1 = m_information.selectAllM_information();
		
		return list1;
	}
	
	
	//删除
	@Override
	public void deleteAllMeeting_information(Meeting_information meeting_infors) {
		// TODO Auto-generated method stub
		m_information.deleteAllMeeting_information(meeting_infors);
	}

	@Override
	public void addMeeting_information(Meeting_information meeting_infors) {
		// TODO Auto-generated method stub
		m_information.addMeeting_information(meeting_infors);
	}
	
	@Override
	public void updateMeeting_information(Meeting_information meeting_infors) {
		// TODO Auto-generated method stub
		m_information.updateMeeting_information(meeting_infors);
	
	}
	

	
}
