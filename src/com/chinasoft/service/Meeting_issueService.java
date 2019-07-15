package com.chinasoft.service;

import java.util.List;

import com.chinasoft.pojo.Meeting_information;
import com.chinasoft.pojo.Meeting_issue;

public interface Meeting_issueService {

	public List<Meeting_issue> selectAllM_issue();
	public void deleteAllMeeting_issue(Meeting_issue meeting_issue);
	public void addMeeting_issue(Meeting_issue meeting_issue);
	
	  public List<Meeting_issue> selectAllMeeting_name(String meeting_name); 
	  public List<Meeting_issue> selectAllMeeting_place( String meeting_place); 
	  public List<Meeting_issue> selectAlltwo( String meeting_place,String meeting_name);
		
}
