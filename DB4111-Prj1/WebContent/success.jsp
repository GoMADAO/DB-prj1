<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="stu" class="cs4111.bean.Stubean" scope="request"/>  
<jsp:setProperty name="stu" property="*"/>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%   
      
	request.getAttribute("stu");
    String stuname=stu.getStuName();
    //session.setAttribute("stu",stu.getName());
    //String sb =(String) session.getAttribute("stu");
    
 %>  
   
 WELCOME, <%=stuname %>!<br>
</body>
</html>