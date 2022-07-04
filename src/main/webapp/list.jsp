<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    
String Username=(String)session.getAttribute("name"); //로그인한 아이디
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
<title>게시판</title>
</head>
<body>
 <h3>게시글 리스트</h3>
 <table border="2">
 <tr>
  <td>번호</td>
  <td>제목</td>
  <td>작성자</td>
  <td>날짜</td>
  <td>이메일</td>
  </tr>
  
  <%
  //
  Connection conn =null;
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
  String sql = "SELECT * FROM message ORDER BY id ASC";
  ResultSet rs=stmt.executeQuery(sql);
 
  
  if(rs != null){
	  while(rs.next()){
		  int id = Integer.parseInt(rs.getString("id"));
			level=(Integer)session.getAttribute("level");
			
		  
 %>
 <tr>
 	<td><%=id %></td>
 	<td>
 		<a href=display.jsp?id=<%=id %>>
 		 	<%=rs.getString("subjects") %></a> </td>
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getString("time") %></td>
     <td><%=rs.getString("email") %></td>
      <%if(Username.equals(rs.getString("name"))){%>
		<td><button>삭제</button></td>
	<%}%>
    </tr>
    <% 
 	
	  }
  }
  %>
  
 </table>
 <!-- 레벨이 2가 아니면 -->
 <%if(level !=2){%>
	 <a href="write.jsp">게시글 쓰기</a>

<%}%>




 <a href="main.jsp">메인으로 가기</a>
 
 <%
 if(stmt != null)
	 stmt.close();
 if(conn != null)
   	 conn.close();
 %>
</body>
</html>