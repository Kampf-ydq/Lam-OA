package com.chinasoft.utils;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * 1.��ȡ�����ļ�
 * 2.����
 * 3.�����Ự����
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
	
	//����openSession�ķ���
	public static SqlSession createSqlSession(){
		
		//trueΪ�Զ��ύ����
		return factory.openSession(false);
	}
	
	//�رջỰ
	public static void closeSqlSession(SqlSession session){
		if (session != null) {
			session.close();
		}
	}

}
