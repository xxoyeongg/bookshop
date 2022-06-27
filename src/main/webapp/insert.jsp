<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name,email,subjects,memo,time;
name= request.getParameter("name");
email=request.getParameter("email");
time=request.getParameter("time");
subjects=request.getParameter("subjects");
memo=request.getParameter("memo");

ResultSet rs= null;
String sql;
Connection conn=null;
Statement stmt= null;

try{
	  Class.forName("org.mariadb.jdbc.Driver");//org.mariadb.jdbc.Driver com.mysql.jdbc.Driver
	  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board","java","java");
}catch(Exception e){
	  out.println("데이터 베이스 접속에 문제가 있습니다. <hr>");
	  out.println(e.getMessage());
	  e.printStackTrace();
}
stmt=conn.createStatement();

sql="insert into message"+
"(subjects,name,time,memo,email)"+
"values("+"'"+subjects+"','"+name+"','"+time+"','"+memo+"','"+email+"');";
try{
	stmt.executeUpdate(sql);
}catch(Exception e){
	out.println("데이터 베이스 삽입연산에 문제가 있습니다. <hr>");
	  out.println(e.getMessage());
	  e.printStackTrace();
}

%>
<h3>게시글이 등록 되었습니다.</h3>
<a href="list.jsp">게시글 리스트 보기</a>
</body>
</html>