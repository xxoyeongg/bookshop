<%@page import="java.sql.*"%>

<%@page import="javax.swing.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//
Connection conn = null;
PreparedStatement pstmt =null;
ResultSet rs = null;

String id = request.getParameter("id"); // 입력 한 값을 가져온다.

String sql = "SELECT * FROM board_user WHERE id=?";



try {//
	//1.데이터 베이스 (mariaDB)드라이버 로드
	Class.forName("org.mariadb.jdbc.Driver");
	//2.드라이버 매니저 연결 + 커넥션 객체 생성 
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board", "java", "java");
	//3.sql실행문을 pstmt변수에 담는다.
	pstmt = conn.prepareStatement(sql);
	//값을 데이터베이스로 보낸다.
	pstmt.setString(1,id);
	//commit
	rs=	pstmt.executeQuery();


	if(rs.next()){
		
		session.setAttribute("id", rs.getString(1));
		session.setAttribute("name", rs.getString(2));
		session.setAttribute("level", rs.getInt(3));
		response.sendRedirect("main.jsp");
			
	}
	response.sendRedirect("loginForm.jsp");


} catch (Exception e) {

	e.printStackTrace();

} finally {
	try {
		rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>
