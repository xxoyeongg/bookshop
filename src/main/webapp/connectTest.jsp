<%@page import="bookshop.DBtest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	String driver=application.getInitParameter("Driver");
	String url=application.getInitParameter("URL");
	String id=application.getInitParameter("ID");
	String password=application.getInitParameter("Pass");
	
	DBtest dbt= new DBtest(driver,url,id,password);
	dbt.close();
%>
</body>
</html>