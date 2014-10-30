<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<jsp:useBean id="stu" class="cs4111.bean.Student" scope="request"/>  
<jsp:useBean id="course" class="cs4111.bean.Course" scope="request"/> 
<jsp:setProperty name="stu" property="*"/>  
<jsp:setProperty name="course" property="*"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
</head>
<body>
<%   
      
	request.getAttribute("stu");
	request.getAttribute("course");
    String stuname=stu.getStuName();
    ArrayList<Integer> stucourse = new ArrayList<Integer>(course.getID());
    ArrayList<String> stucoursename = new ArrayList<String>(course.getName());
    ArrayList<String> stucoursedesc = new ArrayList<String>(course.getDesc());
    
    request.setAttribute("course",course);
    
    int num = stucourse.size();
 %>  
   
 <div style='padding:10px; color:red; font-size:30px; font-family: Courier New'>WELCOME, <%=stuname %>!</div>
 <table border="1" cellpadding="10" cellspacing="2">
 <tr style='font-weight:bold' style='font-family: Courier New'>
 <td width="12%" align="center">Course NO.</td>
 <td width="24%" align="center">Course Name</td>
 <td align="center">Course Description</td>
 </tr>
 <%for (int i=0; i<num; i++){%>
 <tr>
 <td width="12%" align="center"><a href=<%=request.getContextPath() +"/CourseServlet?courseid="+Integer.toString(stucourse.get(i))%>><%=Integer.toString(stucourse.get(i)) %></a></td>
 <td width="24%" align="center"><%=stucoursename.get(i) %></td>
 <td><%=stucoursedesc.get(i) %></td>
 </tr>
 <%} %>

 </table>
</body>
</html>