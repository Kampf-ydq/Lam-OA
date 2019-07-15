package com.chinasoft.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chinasoft.dao.PoseMapper;
import com.chinasoft.pojo.Pose;
import com.chinasoft.service.PoseService;

/*
 * 公告管理Service
 */
@Service
public class PoseServiceImpl implements PoseService {

	@Resource
	private PoseMapper poseMapper;
	
	@Override
	public List<Pose> selectAllpose() {
		List<Pose> list = poseMapper.selectAllpose();
		return list;
	}

	@Override
	public int addPose(Pose pose) {
		
		return poseMapper.addPose(pose);
	}

	@Override
	public int deleteByTitle(String t_title) {
		
		return poseMapper.deleteByTitle(t_title);
	}

}
