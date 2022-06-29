<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = null;
String name = null;
int level=0;

if(session.getAttribute("id")!=null){
	id=(String)session.getAttribute("id");
	name=(String)session.getAttribute("name");
	level=(Integer)session.getAttribute("level");
	
	System.out.print(id);
}else{
	out.println("<scrpit>");
	out.println("location.href='loginForm.jsp'");
	out.println("</scrpit>");
}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><%=name%>로 로그인 하였습니다.</h3>
<%if(level !=1){%>
	<a href="list.jsp">게시글 보기</a>

<%}else{%>
	<h3><%=name%>님 안녕하세요</h3>
<%} %>

<a href="loginForm.jsp">로그인 페이지로 가기</a>
</body>
