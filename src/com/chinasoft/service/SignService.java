package com.chinasoft.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinasoft.pojo.Sign;

public interface SignService {

	public int addSignData(Sign sign); //����ǩ��������
	
	public List<Sign> selectAllSign(); //��ȡǩ�������������
	
	public List<Sign> searchEmpByNo(@Param("g_yno") String g_yno); //����Ա����Ų�ѯ
	
	public void deleteSignById(@Param("g_id") String g_id); //����������¼��idɾ��
	
	public int modify(@Param("g_id") String g_id,@Param("g_date") String g_date,@Param("g_scode") String g_scode); //�޸ļ�¼
	
	public int selectByDate(@Param("g_scode") String g_scode,@Param("g_date") String g_date); //���ݲ�ѯ������ѯ����
}
