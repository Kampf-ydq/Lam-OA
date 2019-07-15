package com.chinasoft.dao;

import java.util.List;

import com.chinasoft.pojo.Meeting_information;


public interface Meeting_informationMapper {

	public List<Meeting_information> selectAllM_information();
	public void deleteAllMeeting_information(Meeting_information meeting_infors);
	public void addMeeting_information(Meeting_information meeting_infors);
	public void updateMeeting_information(Meeting_information meeting_infors);
}
