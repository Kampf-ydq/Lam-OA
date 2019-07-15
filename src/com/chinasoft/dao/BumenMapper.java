package com.chinasoft.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinasoft.pojo.Bumen;


public interface BumenMapper  {
	public List<Bumen> selectAllBumen();
	public void deleteBumen(Bumen bu);
	public void addBumen(Bumen bu);
	public void updateBumen(Bumen bu);
	public List<Bumen> selectBumenBybnum(@Param("bnum") String bnum);
	public List<Bumen> selectBumenBybname(@Param("bname") String bname);
	public List<Bumen> selectBumenBytwo(@Param("bname") String bname, @Param("bnum") String bnum);
	
}
