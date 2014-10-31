<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>  
<style type="text/css">  
body{  
 color : #000 ;  
 font-size : 12px ;  
  
 margin : 0px auto ;  
 }  
</style>
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
<form action="LoginServlet" method="post" name="form1">  
      
      
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
  
</form>
</body>
</html>