package test.util;

import java.sql.Connection;

public class ConnectionTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn = OracleConnectUtil.connect();
		System.out.println(conn);
		OracleConnectUtil.close(conn);
	}

}
