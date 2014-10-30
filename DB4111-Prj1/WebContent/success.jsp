<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<jsp:useBean id="stu" class="cs4111.bean.Student" scope="request"/>  
<jsp:useBean id="course" class="cs4111.bean.Course" scope="request"/> 
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
	request.getAttribute("course");
    String stuname=stu.getStuName();
    ArrayList<Integer> stucourse = new ArrayList<Integer>(course.getID());
    ArrayList<String> stucoursename = new ArrayList<String>(course.getName());
    ArrayList<String> stucoursedesc = new ArrayList<String>(course.getDesc());
    int num = stucourse.size();
 %>  
   
 WELCOME, <%=stuname %>!<br>
 <table>
 <%for (int i=0; i<num; i++){%>
 <tr>
 <td><%=Integer.toString(stucourse.get(i)) %></td><td><%=stucoursename.get(i) %></td><td><%=stucoursedesc.get(i) %></td>
 </tr>
 <%} %>

 </table>
</body>
</html>