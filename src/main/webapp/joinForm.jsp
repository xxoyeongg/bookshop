<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

fieldset{
  margin: 0 auto;
  position: relative;
  top: 100px;
  width: 300px;
  height: 300px;
}
input{
  width: 100%;
  height: 20px;
}

.btn_join{
  width: 35%;
  height: 30px;
  margin:20px;
  position: relative;
  left: 10px;
}
</style>
</head>
<body>
<form name="joinForm" action="joinProcess.jsp" method="post">


<fieldset>

<h3>회원가입</h3>
<label for="id">아이디</label>
<input type="text" id="id" name="id" placeholder="ID" ><br>

<label for="id">비밀번호</label>
<input type="password" id="pass" name="pass" placeholder="4자리 이상 입력하세요"><br>

<label for="name">이름</label>
<input type="text" id="name" name="name"><br>

<label for="id">이메일</label>
<input type="email" id="email" name="email" ><br>



<input type="reset" value="다시 작성하기 " class="btn_join"><input type="submit" value=" 완료 " class="btn_join">

</fieldset>


</form>
</body>
</html>