<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 처리 화면</title>
</head>
<body>
<h1>인터넷 프로그래머 서점</h1>
<h2>주문해주셔서 감사합니다.</h2>
<%
String[] ids = request.getParameterValues("id");
if(ids!=null){
%>
<%@page import="java.sql.*" %>
<%
Class.forName("org.mariadb.jdbc.Driver");//org.mariadb.jdbc.Driver com.mysql.jdbc.Driver
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_db","java","java");
Statement stmt = conn.createStatement();

String sqlStr;
int recordUpdate;
ResultSet rest;

%>
<table border="2">

<tr>
 <th>저자</th>
 <th>제목</th>
 <th>가격</th>
 <th>수량</th>
 </tr>
 <%
 for(int i =0; i<ids.length;++i){
	 sqlStr="UPDATE book_table SET qty = qty -1 WHERE id=" +ids[i];
	 recordUpdate=stmt.executeUpdate(sqlStr);
	 sqlStr="SELECT * FROM book_table WHERE id="+ids[i];
	 rest=stmt.executeQuery(sqlStr);
	 while(rest.next()){
		 %>
		 <tr>
		 <td><%=rest.getString("author") %></td>
		 <td><%=rest.getString("title") %></td>
		 <td><%=rest.getInt("price") %></td>
		 <td><%=rest.getInt("qty") %></td>
		 
		 </tr>
		 <%}
	 rest.close();
 }
 stmt.close();
 conn.close();
}
 %>
</table>
<a href="order.jsp">주문화면으로 돌아가기</a>
</body>
</html>