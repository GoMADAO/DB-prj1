<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" 
    import="cs4111.model.Course" import="cs4111.model.Courwork" %>

<jsp:useBean id="stu" class="cs4111.model.Student" scope="request"/>   
<jsp:useBean id="courselist" class="cs4111.model.CourseList" scope="request"/> 
<jsp:useBean id="currentwork" class="cs4111.model.CourworkList" scope="request"/>'

<jsp:setProperty name="stu" property="*"/> 
<jsp:setProperty name="courselist" property="*"/>
<jsp:setProperty name="currentwork" property="*"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
</head>
<body>
<%   
	request.getAttribute("stu");
	request.getAttribute("courselist");
    String stuname=stu.getStuName();
    request.getAttribute("currentwork");

    ArrayList<Course> cl = new ArrayList<Course>();
    cl = courselist.getClist();
    
    
    ArrayList<Courwork> cwl = new ArrayList<Courwork>();
    cwl = currentwork.getCourworkList();
    request.setAttribute("courselist", courselist);

 %>  
   
 <div style="padding:10px; color:red; font-size:30px; font-family: Courier New">WELCOME, <%=stuname %>!</div>
 <table border="1" cellpadding="10" cellspacing="2">
 <tr style='font-weight:bold' style='font-family: Courier New'>
 <td width="12%" align="center">Course NO.</td>
 <td width="24%" align="center">Course Name</td>
 <td align="center">Course Description</td>
 </tr>
 <%for (int i=0; i<cl.size(); i++){%>
 <tr>
 <td width="12%" align="center"><a href=<%=request.getContextPath() +"/CourseServlet?courseid="+Integer.toString(cl.get(i).getCid())%>><%=Integer.toString(cl.get(i).getCid()) %></a></td>
 <td width="24%" align="center"><%=cl.get(i).getCname() %></td>
 <td><%=cl.get(i).getCdesc() %></td>
 </tr>
 <%} %>
 </table>
 <%//////////// %>
 <div style='padding:10px; font-size:20px; font-family: Courier New'>Current Course Work</div>
  <table border="1" cellpadding="10" cellspacing="2">
 <tr style='font-weight:bold' style='font-family: Courier New'>
 <td width="12%" align="center">Name</td>
 <td width="20%" align="center">Course</td>
 <td width="24%" align="center">Release Date</td>
 <td width="30%" align="center">Due Date</td>
 <td align="center">Link</td>
 </tr>
 <%int cid = 0;
   for (int i=0; i<cwl.size(); i++){%>
 <tr>
 <td width="12%" align="center"><a href = <%=request.getContextPath()
 + "/CourseworkServlet?courseworkid="+ cwl.get(i).getWorkId()%>>
 <%=cwl.get(i).getName() %></a></td>
 <td width="20%" align="center"><%=cwl.get(i).getCoursename()%></td>
 <td width="24%" align="center"><%=cwl.get(i).getRelDate()%></td>
 <td width="30%" align="center"><%=cwl.get(i).getDueDate() %></td>
 <td><a href = <%=cwl.get(i).getLink()%> ><%=cwl.get(i).getLink() %></a></td>
 </tr>
 <%} %>
 </table>
</body>
</html>