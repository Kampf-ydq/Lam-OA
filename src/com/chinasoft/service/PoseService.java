package com.chinasoft.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinasoft.pojo.Pose;

public interface PoseService {
	
	public List<Pose> selectAllpose(); //��ѯ���Թ�������
	
	public int addPose(Pose pose); //���һ������
	
	public int deleteByTitle(@Param("t_title") String t_title); //ɾ��һ������
}
