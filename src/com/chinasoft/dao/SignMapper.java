package com.chinasoft.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chinasoft.pojo.Sign;
import com.chinasoft.pojo.User;

public interface SignMapper {

	public int addSignData(Sign sign); //保存签到表数据
	
	public List<Sign> selectAllSign(); //获取签到表的所有数据
	
	public List<Sign> searchEmpByNo(@Param("g_yno") String g_yno); //根据员工编号查询
	
	public void deleteSignById(@Param("g_id") String g_id); //根据主键记录项id删除
	
	public int modify(@Param("g_id") String g_id,@Param("g_date") String g_date,@Param("g_scode") String g_scode); //修改记录
	
	public int selectByStatus(@Param("g_scode") String g_scode,@Param("g_date") String g_date); //根据查询条件查询数据
}
