package com.chinasoft.pojo;

import java.util.Date;

/*
 * 签到表，对应数据库sign表
 */
public class Sign {

	private Integer g_id;
	private String g_yno;
	private String g_yname;
	private String g_pname;
	private String g_zname;
	private String g_date;
	private String g_scode;
	private String g_salary;
	public Integer getG_id() {
		return g_id;
	}
	public void setG_id(Integer g_id) {
		this.g_id = g_id;
	}
	public String getG_yno() {
		return g_yno;
	}
	public void setG_yno(String g_yno) {
		this.g_yno = g_yno;
	}
	public String getG_yname() {
		return g_yname;
	}
	public void setG_yname(String g_yname) {
		this.g_yname = g_yname;
	}
	public String getG_pname() {
		return g_pname;
	}
	public void setG_pname(String g_pname) {
		this.g_pname = g_pname;
	}
	public String getG_zname() {
		return g_zname;
	}
	public void setG_zname(String g_zname) {
		this.g_zname = g_zname;
	}

	
	public String getG_date() {
		return g_date;
	}
	public void setG_date(String g_date) {
		this.g_date = g_date;
	}
	public String getG_scode() {
		return g_scode;
	}
	public void setG_scode(String g_scode) {
		this.g_scode = g_scode;
	}
	public String getG_salary() {
		return g_salary;
	}
	public void setG_salary(String g_salary) {
		this.g_salary = g_salary;
	}
	@Override
	public String toString() {
		return "Sign [g_id=" + g_id + ", g_yno=" + g_yno + ", g_yname=" + g_yname + ", g_pname=" + g_pname
				+ ", g_zname=" + g_zname + ", g_date=" + g_date + ", g_scode=" + g_scode + ", g_salary=" + g_salary
				+ "]";
	}
}
