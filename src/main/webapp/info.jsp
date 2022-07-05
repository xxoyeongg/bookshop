<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import="org.mariadb.jdbc.internal.util.SqlStates"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%

String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
int level=(int)session.getAttribute("level");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

*{
  margin: 0;
}

.container{
  width: 400px; height: 500px;
  border: 1px solid black;
  position: relative;
  left: 400px; top: 50px;
}

#imgbox{
  width: 400px; height: 150px;
  margin: 0 auto;

  background-color: aquamarine;
}


table.type04 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.type04 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}
table.type04 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
}

li{
padding:3px;
margin: 5px;
position: relative;
left: 10px;
}

#atag{
border-radius: 5px;
text-decoration: none;
color: white;
background-color: black;
position: relative;
top: 80px;
 }

  </style>
  
  
<body>
  <div class="container">
<div id="imgbox">

  <img src="" alt="이미지 들어갈곳">
</div>



  <table class="type04">
    <tr>
      <th scope="row">이름</th>
      <td><%=name %></td>
    </tr>
    <tr>
      <th scope="row">이메일</th>
      <td><%=email %></td>
    </tr>
    <tr>
      <th scope="row">level</th>
      <td><%=level %></td>
    </tr>
  </table>
  
<h4>작성 한 글 </h4>
<%
 Class.forName("org.mariadb.jdbc.Driver");//org.mariadb.jdbc.Driver com.mysql.jdbc.Driver
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board","java","java");
 Statement stmt = conn.createStatement();
 String sqlStr = "SELECT * FROM message WHERE name LIKE'%"+name+"%'ORDER BY id ASC";


 ResultSet rs = stmt.executeQuery(sqlStr);
 
 %>

  <%
 while (rs.next()){
	 
	 String username = rs.getString("name");
 %>
 	<li>
 		<a href=list.jsp?name=<%=name %>>
 		 	<%=rs.getString("subjects") %></a>
 	 </li>
 <%
 } 
 %>

<a id="atag" href="main.jsp">메인페이지</a>
<a id="atag" href="logout.jsp">로그아웃</a>
  </div>
  
</body>
</html>