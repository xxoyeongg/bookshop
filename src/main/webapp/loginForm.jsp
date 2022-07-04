<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
fieldset{
  margin: 0 auto;
  position: relative;
  top: 100px;
  width: 300px;
  height: 300px;
}
#login_box{

  width: 230px;
  height: 200px;
  margin: 0 auto;
  /* line-height: 2.0; */
}
input{
  width: 100%;
  height: 50px;
}
.btn_login{
  width: 100%;
  height: 30px;
}


</style>
<head>
<meta charset="UTF-8">
<title>ebookshop</title>
</head>
<body>
  <form name="loginform" action="loginProcess.jsp" method="post">

 
    <fieldset>
      <legend >LOGIN</legend>
      <br><br><br>
            <div id="login_box">
              <input type="text" id="id" name="id" placeholder="ID" >
              <input type="password" id="pass" name="pass" placeholder="PASSWORD">
       <br><br>
          <button type="submit" class="btn_login"  >로그인</button> <br>
            계정이 없으신가요?--><a href="joinForm.jsp">회원가입</a>
            </div>

      
    </fieldset>

</form>
</body>
</html>