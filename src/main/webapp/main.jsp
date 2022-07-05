<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

//외부접속 막기
if(request.getHeader("referer")==null)
	response.sendRedirect("loginForm.jsp");


String id = null;
String name = null;
String email = null;
int level=0;

if(session.getAttribute("id")!=null){
	id=(String)session.getAttribute("id");
	name=(String)session.getAttribute("name");
	email=(String)session.getAttribute("email");
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
<style type="text/css">
h2{padding: 20px;}

  #nav1{text-align:center}
#nav1>ul{display:inline-block}
#nav1>ul li{float:left;padding:0 30px;line-height:80px}
     
*{padding:0;margin:0;
text-align: center;
}
ul,ol{list-style:none}
a{text-decoration:none;color:#fff;font-size:15px}
nav{width:80%;overflow:hidden;height:80px;background-color:#1b2035;margin:50px auto}

#atag{
border-radius: 5px;
text-decoration: none;
color: white;
background-color: black;
}

</style>
</head>
<body>
<h2>ebook shop</h2>
<hr>
<h4><%=name%>로 로그인 하였습니다.</h4>
   <nav id="nav1">
      <ul>
        <li><a href="order.jsp">주문</a></li>
        <li><a href="list.jsp">게시판</a></li>
        <li><a href="info.jsp">마이페이지</a></li>

      </ul>
    </nav>
<a id="atag" href="logout.jsp">로그아웃</a>

</body>
