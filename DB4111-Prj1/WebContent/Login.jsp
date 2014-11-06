<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>  
<style type="text/css">
body {
    background-image:url(pic/bg.jpg);
}
.content {
    width:680px;
    height:320px;    
    margin:50px auto;
}
.form-wrapper {
    margin:32px auto;
    width:264px;
    height:253px;
    position:relative;
    border:1px solid rgb(197,200,204);
    background-color:rgb(248,249,250);
    text-align:center;
    border-radius:5px;
    box-shadow:0 1px 0 rgb(255,255,255), 0 2px 0 rgb(197,200,204), 0 3px 0 rgb(255,255,255), 0 4px 0 rgb(197,200,204);
}
.form-wrapper:before {
    content:"";
    display:block;
    height:37px;
    border-bottom:1px solid rgb(197,200,204);
    border-radius:5px 5px 0 0;
    box-shadow:inset 2px 2px 0 rgb(255,255,255);
}
.form-wrapper .login-form {
    padding-top:40px;
    box-shadow:inset 2px 0 0 rgb(255,255,255);
}
.form-wrapper input[name="username"] {
    height:40px;
    width: 200px;
    margin:0 auto;
    padding-left:15px;
    display:block;
    border:1px solid rgb(197,200,204);
    border-bottom:none;
    border-radius:5px 5px 0 0;
    box-shadow:inset 0 1px 0 rgb(212,214,217);
    background-color:rgb(228,230,233);
}
.form-wrapper input[name="password"] {
    height:40px;
    width: 200px;
    margin:0 auto;
    padding-left:15px;
    display:block;
    border:1px solid rgb(197,200,204);
    border-radius:0 0 5px 5px;
    background-color:rgb(228,230,233);
}
.form-wrapper button[type="submit"] {
    margin-top:25px;
    width:215px;
    height:44px;
    color:#fff;
    font-size:20px;
    border:none;
    border-top:1px solid rgb(190,143,48);
    position:relative;
    /*利用双背景制作垂直渐变色边框*/
    background:-*-linear-gradient(top,rgb(228,182,88),rgb(218,149,78)) 1px 1px no-repeat,
               -*-linear-gradient(top,rgb(190,143,48),rgb(160,106,32)) left top no-repeat;
    background-size:213px 41px,215px 43px;
    border-radius:5px;
    box-shadow:inset 0 1px 0 rgb(242,220,175);
    text-shadow:1px 1px 0 rgb(138,100,50);
    transition:color 300ms linear;
}
.form-wrapper button[type="submit"]:hover {
    color:rgb(195,188,81);
    background:-*-linear-gradient(top,rgb(195,99,81),rgb(196,84,64)) 1px 1px no-repeat,
               -*-linear-gradient(top,rgb(190,143,48),rgb(160,106,32)) left top no-repeat;
}
/*日历链条和环的制作*/
.form-wrapper .linker {
    position:absolute;
    width:240px;
    height:40px;
    top:18px;
    left:10px;
}
/*上环*/
.linker .ring {
    position:relative;
    display:inline-block;
    border:1px solid rgb(163,164,167);
    background-color:rgb(220,222,225);
    height:12px;
    width:12px;
    border-radius: 6px;
    margin-right:33px;
}
.linker .ring:last-child {
    margin-right:0;
}
/*下环*/
.linker .ring:before {
    content:"";
    position:absolute;
    bottom:-25px;
    left:-1px;
    border:1px solid rgb(163,164,167);
    background-color:rgb(220,222,225);
    height:12px;
    width:12px;
    border-radius: 6px;
}
/*中间链条*/
.linker .ring:after{
    content:"";
    position:absolute;
    top:2px;
    left:2px;
    width:6px;
    height:30px;
    border:1px solid rgb(202,202,202);
    background-color:rgb(255,255,255);
    border-radius: 3px;
}
</style>
<!-- <style type="text/css">  
body{  
 color : #000 ;  
 font-size : 12px ;  
  
 margin : 0px auto ;  
 }  
</style> -->
<script type="text/javascript">  
    function check(form){  
        if(document.forms.form1.username.value==""){   
            alert("pls input username");  
            //put focus back  
            document.forms.form1.username.focus(); 
            return false;  
        }  
                if(document.forms.form1.password.value==""){  
            alert("pls input password");  
            document.forms.form1.password.focus();  
            return false;  
        }  
    }  
  
</script>
</head>
<body>
<!-- <form action="LoginServlet" method="post" name="form1">  
      
      
<table border="1" cellspacing="1" cellpadding="1"  bordercolor="silver" align="center">  
   <tr>  
      <td colspan="2" align="center" bgcolor="#e8e8e8">Login</td>  
   </tr>  
   <tr>  
      <td>Username：</td>  
      <td><input type="text" name="username" value="yf2338"/></td>  
   </tr>  
   <tr>  
      <td>Password：</td>  
      <td><input type="password" name="password" value="Columbia"/></td>  
   </tr>  
   <tr>  
      <td><input type="submit" name="submit" onclick="return check(this);"/></td>
   </tr>  
</table>  
</form> -->

<div class="page">
	<header id="header">
		<hgroup class="white blank">
		</hgroup>
	</header>
	<section class="demo">
		<div class="content">
		  <div class="form-wrapper">
		      <div class="linker">
		          <span class="ring"></span>
                  <span class="ring"></span>
                  <span class="ring"></span>
                  <span class="ring"></span>
                  <span class="ring"></span>
		      </div>
              <form class="login-form" action="LoginServlet" method="post" name="form1">
                  <input type="text" name="username" placeholder="username" />
                  <input type="password" name="password" placeholder="password" />
                  <button type="submit">Log in</button>
              </form>
		  </div>
		</div>
	</section>
</div>
<div style="text-align:center;clear:both">


</body>
</html>