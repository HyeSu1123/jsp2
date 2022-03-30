package test.util;

import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.SqlSessionBean;

public class SqlSessionFactoryTest {

	public static void main(String[] args) {
		// 데이터베이스 연결확인
		SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
		
		System.out.println(factory);

	}

}
