<%@page import="java.lang.reflect.Executable"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
    <%
    //
    request.setCharacterEncoding("UTF-8");
    String id =request.getParameter("id");
    String name=request.getParameter("name");
    int level=1;
   
    String driver = "org.mariadb.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/board";
    
    Class.forName(driver);
    Connection conn =  DriverManager.getConnection(url,"java","java");      
    Statement stmt = conn.createStatement();   
    
    String insertsql = "INSERT INTO board_user(id,name,level) VALUES('"+id+"','"+name+"','"+level+"')";
    String sql = "SELECT * From board_user";   
    stmt.executeQuery(insertsql);
    ResultSet rs = stmt.executeQuery(sql);      
    conn.close();  
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>location.href="loginForm.jsp";</script>
</body>
</html>