package com.chinasoft.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chinasoft.dao.BumenMapper;
import com.chinasoft.pojo.Bumen;
import com.chinasoft.service.BumenService;
@Service
public class BumenServiceImpl implements BumenService {
	@Resource
	private BumenMapper bumenMapper;
	
	@Override
	public List<Bumen> selectAllBumen() {
		List<Bumen> bumen = new ArrayList<Bumen>();
		
		bumen = bumenMapper.selectAllBumen();
		
		return bumen;
	}

	@Override
	public void deleteBumen(Bumen bu) {
		// TODO Auto-generated method stub
		bumenMapper.deleteBumen(bu);
	}

	@Override
	public void addBumen(Bumen bu) {
		// TODO Auto-generated method stub
		bumenMapper.addBumen(bu);
	}

	@Override
	public List<Bumen> selectBumenBybname(String bname) {
		// TODO Auto-generated method stub
List<Bumen> bumen = new ArrayList<Bumen>();
		
		bumen = bumenMapper.selectBumenBybname(bname);
		
		return bumen;
	}

	@Override
	public List<Bumen> selectBumenBybnum(String bnum) {
		// TODO Auto-generated method stub
List<Bumen> bumen = new ArrayList<Bumen>();
		
		bumen = bumenMapper.selectBumenBybnum(bnum);
		
		return bumen;
	}

	@Override
	public void updateBumen(Bumen bu) {
		// TODO Auto-generated method stub
		bumenMapper.updateBumen(bu);
	}

	@Override
	public List<Bumen> selectBumenBytwo(String bname, String bnum) {
		// TODO Auto-generated method stub
		List<Bumen> bumen = new ArrayList<Bumen>();
              bumen = bumenMapper.selectBumenBytwo(bname,bnum);
		
		return bumen;
		
	}
	
}
