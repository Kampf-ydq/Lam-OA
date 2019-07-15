package com.chinasoft.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinasoft.pojo.Pose;

public interface PoseMapper {

	public List<Pose> selectAllpose(); //查詢所有公告數據
	
	public int addPose(Pose pose); //添加一条公告
	
	public int deleteByTitle(@Param("t_title") String t_title); //删除一条公告
}
