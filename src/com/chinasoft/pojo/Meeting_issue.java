package com.chinasoft.pojo;

public class Meeting_issue {

	
	private String meeting_id;
	private String meeting_name;
	private String meeting_place;
	private String meeting_topic;
	private String start_time;
	private String end_time;
	
	public String getMeeting_name() {
		return meeting_name;
	}
	public void setMeeting_name(String meeting_name) {
		this.meeting_name = meeting_name;
	}
	public String getMeeting_id() {
		return meeting_id;
	}
	public void setMeeting_id(String meeting_id) {
		this.meeting_id = meeting_id;
	}

	public String getMeeting_place() {
		return meeting_place;
	}
	public void setMeeting_place(String meeting_place) {
		this.meeting_place = meeting_place;
	}
	public String getMeeting_topic() {
		return meeting_topic;
	}
	public void setMeeting_topic(String meeting_topic) {
		this.meeting_topic = meeting_topic;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
}
