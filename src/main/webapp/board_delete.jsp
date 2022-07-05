<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.time.LocalDate"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// list에서 id를 string으로 보내주어서  String으로 보내준다.
String id = request.getParameter("id");

ResultSet rs= null;
String sql;
Connection conn=null;
Statement stmt= null;

try{
	 Class.forName("org.mariadb.jdbc.Driver");//org.mariadb.jdbc.Driver com.mysql.jdbc.Driver
	  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board","java","java");

stmt=conn.createStatement();
sql="DELETE  FROM message where id='"+id+"'";
stmt.executeUpdate(sql);
response.sendRedirect("list.jsp");

}catch(Exception e){
	out.println("데이터 베이스 삽입연산에 문제가 있습니다. <hr>");
	  out.println(e.getMessage());
	  e.printStackTrace();
}

%>
</body>
</html>