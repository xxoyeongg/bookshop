<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 입력 </title>
</head>
<body>
<h3>게시글 입력 화면</h3>
<form action="insert.jsp" method="post">

<table border="2">

<tr>
 <td>제목</td>
 <td><input type="text" name="subjects" size="60"></td>
</tr> 

<tr>
 <td>작성자</td>
 <td><input type="text" name="name" size="60"></td>
</tr> 

<tr>
 <td>내용</td>
 <td><textarea name="memo" rows="5" cols="53"></textarea></td>
</tr> 

<tr></tr>

<tr>
 <td>작성날짜</td>
 <td><input type="text" name="time" size="60"></td>
</tr> 

</table>
<br> <br>
<input type="submit" value="게시글 등록">
<input type="reset" value="다시 쓰기">
</form>
<!--  level 2는 안보이게 -->
<a href="list.jsp">게시글 리스트 보기</a>
</body>
</html>