package bookshop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBtest {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public DBtest(String driver,String url, String id,String password) {
		try {
			Class.forName("org.mariadb.jdbc.Driver");//jdbc����̹� ����
			System.out.println("����̹� �ε� ����");
			con=DriverManager.getConnection(url, id, password);
			System.out.println("db���� ����");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if(rs != null)rs.close();
			if(stmt != null)stmt.close();
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
