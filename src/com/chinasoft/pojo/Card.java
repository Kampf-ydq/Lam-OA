package com.chinasoft.pojo;

public class Card {

	private String c_id;
	private String c_intro;
	private String c_degree;
	private String c_star;
	private String c_picture;
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_intro() {
		return c_intro;
	}
	public void setC_intro(String c_intro) {
		this.c_intro = c_intro;
	}
	public String getC_degree() {
		return c_degree;
	}
	public void setC_degree(String c_degree) {
		this.c_degree = c_degree;
	}
	public String getC_star() {
		return c_star;
	}
	public void setC_star(String c_star) {
		this.c_star = c_star;
	}
	
	public String getC_picture() {
		return c_picture;
	}
	public void setC_picture(String c_picture) {
		this.c_picture = c_picture;
	}
	@Override
	public String toString() {
		return "Card [c_id=" + c_id + ", c_intro=" + c_intro + ", c_degree=" + c_degree + ", c_star=" + c_star
				+ ", c_picture=" + c_picture + "]";
	}
	
}
