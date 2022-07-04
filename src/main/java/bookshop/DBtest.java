package bookshop;

import java.sql.Connection;

public class DBtest {
	public Connection con;
	
	public DBtest(String driver,String url, String id,String password) {
		try {
			Class.forName(driver);//jdbc드라이버 실행
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
