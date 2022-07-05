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
<style type="text/css">
*{margin: 30px auto;
text-align: center;}

a{text-decoration:none; font-size:15px}
table{
width:80%; height:80px;
overflow:hidden;margin:50px auto
}
table>td{
display:inline-block
float:left;
padding:0 30px;
line-height:80px
;}
th{
color:#fff;font-size:15px;
background-color:#1b2035;

}

</style>
</head>
<body>
 <h3>게시글 리스트</h3>
 <table>
 <tr>
  <th>번호</th>
  <th>제목</th>
  <th>작성자</th>
  <th>날짜</th>
  <th>이메일</th>
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
		<td><a href="board_delete.jsp?id=<%=id%>">삭제</a></td>
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
 <a id="atag" href="logout.jsp">로그아웃</a>
 
 <%
 if(stmt != null)
	 stmt.close();
 if(conn != null)
   	 conn.close();
 %>
</body>
</html>