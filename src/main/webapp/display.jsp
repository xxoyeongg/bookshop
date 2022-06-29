<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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

String subjects="",memo="",name="",time="",email="";
int id =Integer.parseInt(request.getParameter("id"));

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
String sql = "SELECT * FROM message WHERE id =" + id;
ResultSet rs=stmt.executeQuery(sql);

while(rs.next()){
	subjects=rs.getString("subjects");
	memo=rs.getString("memo");
	name=rs.getString("name");
	time=rs.getString("time");
	email=rs.getString("email");
}
%>
<table border="2">

<tr>
 <td>제목</td>
 <td><%=subjects %></td>
</tr> 

<tr>
 <td>작성자</td>
 <td><%=name %></td>
</tr> 

<tr>
 <td>내용</td>
 <td><%=memo %></td>
</tr> 

<tr></tr>

<tr>
 <td>작성날짜</td>
 <td><%=time %></td>
</tr> 

<tr>
 <td>이메일</td>
 <td><%=email %></td>
</tr> 

</table>
<br> <br>
<a href="list.jsp">게시글 리스트 보기</a>
</body>
</html>