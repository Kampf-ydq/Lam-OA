package com.chinasoft.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinasoft.pojo.Pose;

public interface PoseMapper {

	public List<Pose> selectAllpose(); //��ԃ���й��攵��
	
	public int addPose(Pose pose); //���һ������
	
	public int deleteByTitle(@Param("t_title") String t_title); //ɾ��һ������
}
