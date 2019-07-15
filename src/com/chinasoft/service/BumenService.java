package com.chinasoft.service;

import java.util.List;

import com.chinasoft.pojo.Bumen;

public interface BumenService {
	public List<Bumen> selectAllBumen();
	public void deleteBumen(Bumen bu);
	public void addBumen(Bumen bu);
	public void updateBumen(Bumen bu);
	public List<Bumen> selectBumenBybname(String bname);
	public List<Bumen> selectBumenBybnum( String bnum);
	public List<Bumen> selectBumenBytwo( String bname,String bnum);
}
