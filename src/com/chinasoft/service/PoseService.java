package com.chinasoft.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinasoft.pojo.Pose;

public interface PoseService {
	
	public List<Pose> selectAllpose(); //查询所以公告数据
	
	public int addPose(Pose pose); //添加一条公告
	
	public int deleteByTitle(@Param("t_title") String t_title); //删除一条公告
}
