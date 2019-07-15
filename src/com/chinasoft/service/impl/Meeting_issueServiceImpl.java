package com.chinasoft.service.impl;

import java.util.List;
import java.util.ArrayList;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chinasoft.dao.Meeting_issueMapper;
import com.chinasoft.pojo.Meeting_information;
import com.chinasoft.pojo.Meeting_issue;
import com.chinasoft.service.Meeting_issueService;

/*
 * 会议发布管理
 * 
 * */
@Service
public class Meeting_issueServiceImpl implements Meeting_issueService {

	@Resource
	private Meeting_issueMapper m_issue;

	@Override
	public List<Meeting_issue> selectAllM_issue() {
		List<Meeting_issue> issue = new ArrayList<Meeting_issue>();

		issue = m_issue.selectAllM_issue();

		return issue;
	}

	@Override
	public void deleteAllMeeting_issue(Meeting_issue meeting_issue) {
		// TODO Auto-generated method stub
		m_issue.deleteAllMeeting_issue(meeting_issue);
	}


	  @Override 
	  public List<Meeting_issue> selectAllMeeting_name(String meeting_name) { 
		  // TODO Auto-generated method stub 
		  List<Meeting_issue> meeting_issue = new ArrayList<Meeting_issue>();
		  meeting_issue= m_issue.selectAllMeeting_name(meeting_name);
	     return meeting_issue;
	 }
	 
	  @Override
	  public List<Meeting_issue> selectAllMeeting_place(String meeting_place) { 
		  // TODO Auto-generated method stub
		  List<Meeting_issue> meeting_issue = new ArrayList<Meeting_issue>();

		  meeting_issue = m_issue.selectAllMeeting_place(meeting_place);

          return meeting_issue;
           }


	  @Override
		public void addMeeting_issue(Meeting_issue meeting_issue) {
			// TODO Auto-generated method stub
		 m_issue.addMeeting_issue(meeting_issue);
		}
	  
		 @Override 
		 public List<Meeting_issue> selectAlltwo(String meeting_place,String meeting_name) { 
			 // TODO Auto-generated method stub
					 List <Meeting_issue> meeting_issue = new ArrayList<Meeting_issue>();
					 meeting_issue =m_issue.selectAlltwo(meeting_place,meeting_name);
				
			 return meeting_issue;

				  }
	  

	

	

}