package com.chinasoft.dao;

import java.util.List;

import com.chinasoft.pojo.Meeting_information;
import com.chinasoft.pojo.Meeting_issue;
import org.apache.ibatis.annotations.Param;

public interface Meeting_issueMapper {

	public List<Meeting_issue> selectAllM_issue();

	public void deleteAllMeeting_issue(Meeting_issue meeting_issue);
	public void addMeeting_issue(Meeting_issue meeting_issue);
	
    public List<Meeting_issue>  selectAllMeeting_name(@Param("meeting_name")  String meeting_name);
	  public List<Meeting_issue> selectAllMeeting_place(@Param("meeting_place") String meeting_place);
	  public List<Meeting_issue> selectAlltwo(@Param("meeting_place") String meeting_place, @Param("meeting_name") String meeting_name);
	  
}
