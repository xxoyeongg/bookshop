<%@page import="org.mariadb.jdbc.internal.util.SqlStates"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    
String name=(String)session.getAttribute("name");
int level=(int)session.getAttribute("level");
%>
<%
if(level==1){ %>
	<script>
	alert('level 2이상 부터 가능하세요');
	location.href='main.jsp';
	</script>
<%}%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>인터넷 프로그래머 문고</h1>
 <p><%=name %>님 안녕하세요</p>
 <h3>제목을 입력 하세요</h3>
 <form method="post">
 	책 제목: <input type="text" name="title"> <br>
 	<input type="submit" value="검색">
 </form>
 
 <%//
 String title = request.getParameter("title");
 
 if(title != null){
 %>
 <%
 Class.forName("org.mariadb.jdbc.Driver");//org.mariadb.jdbc.Driver com.mysql.jdbc.Driver
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_db","java","java");
 Statement stmt = conn.createStatement();
 String sqlStr = "SELECT * FROM book_table WHERE title LIKE'%"+title+"%'ORDER BY title ASC";


 ResultSet rs = stmt.executeQuery(sqlStr);
 
 %>
 <hr>
 <form action="order_proc.jsp" method="post">


 <table border="1" cellpadding=5>
 <tr>
 <th>주문</th>
 <th>저자</th>
 <th>제목</th>
 <th>가격</th>
 <th>남아있는 수량</th>
 </tr>
 <%
 while (rs.next()){
	 int id = rs.getInt("id");
 %>
 <tr>
 <td><input type="checkbox" name="id" value="<%=id%>"></td>
 <td><%=rs.getString("author") %></td>
 <td><%=rs.getString("title") %></td>
 <td><%=rs.getInt("price") %></td>
 <td><%=rs.getInt("qty") %></td>
 </tr>
 <%
 } 
 %>
 </table>
 <%if(level !=2 ){%>
 <br> <input type="submit" value="주문"> <input type="reset" value="초기화">
 <%} %>
 </form>
 <a href="<%=request.getRequestURI() %>"> 다시주문하기</a>
 <a id="atag" href="main.jsp">메인페이지</a>
 <%
 
 rs.close();
  stmt.close();
  conn.close();
 }
 %>
</body>
</html>