package com.chinasoft.utils;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * 1.读取配置文件
 * 2.加载
 * 3.创建会话工厂
 */
public class MybatisUtil {
	
	private static SqlSessionFactory factory;
	
	static{
		InputStream is;
		try {
			is = Resources.getResourceAsStream("mybatis-config.xml");
			factory = new SqlSessionFactoryBuilder().build(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//创建openSession的方法
	public static SqlSession createSqlSession(){
		
		//true为自动提交事务
		return factory.openSession(false);
	}
	
	//关闭会话
	public static void closeSqlSession(SqlSession session){
		if (session != null) {
			session.close();
		}
	}

}
