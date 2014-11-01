<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="cs4111.model.TAassists" 
    import="cs4111.model.ProfTeaches" import="cs4111.model.Chapter"
    import="cs4111.model.Courwork"%>
    
<jsp:useBean id="ta" class="cs4111.model.TAassistsList" scope="request"/> 
<jsp:useBean id="prof" class="cs4111.model.ProfTeachesList" scope="request"/> 
<jsp:useBean id="chap" class="cs4111.model.ChapterList" scope="request"/> 
<jsp:useBean id="courselist" class="cs4111.model.CourseList" scope="request"/> 
<jsp:useBean id="stu" class="cs4111.model.Student" scope="request"/>   
<jsp:useBean id="cw" class="cs4111.model.CourworkList" scope="request"/>   
<jsp:setProperty name="cw" property="*"/>
<jsp:setProperty name="stu" property="*"/> 
<jsp:setProperty name="ta" property="*"/>  
<jsp:setProperty name="prof" property="*"/>
<jsp:setProperty name="chap" property="*"/>    
<jsp:setProperty name="courselist" property="*"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Details</title>
</head>
<body>
<%
	request.getAttribute("ta");
	request.getAttribute("prof");
	request.getAttribute("chap");
	request.getAttribute("cw");
	ArrayList<Courwork> cwList = new ArrayList<Courwork>();
    cwList = cw.getCourworkList();
	ArrayList<TAassists> taList = new ArrayList<TAassists>();
    taList = ta.getTAlist();
    ArrayList<ProfTeaches> profList = new ArrayList<ProfTeaches>();
    profList = prof.getProfList();
    ArrayList<Chapter> chapList = new ArrayList<Chapter>();
    chapList = chap.getChapList();
    request.setAttribute("taList", taList);
    request.setAttribute("profList", profList);
    request.setAttribute("chapList", chapList);
    
%>
<div style='padding: 20px; font-weight:bold; font-size:20px; font-family: Courier New' colspan="2"><%=taList.get(0).getCourseName()%></div>
<table border="1" cellpadding="10" cellspacing="2">
<tr>
<td colspan="4" style='color:red; font-weight:bold'>Teaching Assistants Info</td>
</tr>
<tr style='font-weight:bold'>
<td width ="4%" align="center">TA NO.</td>
<td width ="20%" align="center">Name</td>
<td width ="30%" align="center">Office Hour</td>
<td align="center">Office Location</td>
</tr>
<%
	for (int i = 0; i<taList.size(); i++){
%>
	<tr>
	<td width ="4%" align="center"><%=taList.get(i).getTAid() %></td>
	<td width ="20%" align="center"><%=taList.get(i).getName()%></td>
	<td width = "30%" align = "center"><%=taList.get(i).getOfficeHour()%></td>
	<td align = "center"><%=taList.get(i).getOfficeLoc()%></td>
	</tr>
<%
}
%>
</table>

<table border="1" cellpadding="10" cellspacing="2">
<tr>
<td colspan="5" style='color:red; font-weight:bold'>Professor Info</td>
</tr>
<tr style='font-weight:bold'>
<td width ="4%" align="center">PROF. NO.</td>
<td width ="20%" align="center">Name</td>
<td width = "30%" align ="center">Concentration</td>
<td width ="20%" align="center">Office Hour</td>
<td align="center">Office Location</td>
</tr>
<%
	for (int i = 0; i<profList.size(); i++){
%>
	<tr>
	<td width ="4%" align="center"><%=profList.get(i).getProfID() %></td>
	<td width ="20%" align="center"><%=profList.get(i).getName()%></td>
	<td width = "30%"><%=profList.get(i).getProfConc()%></td>
	<td width = "20%" align = "center"><%=taList.get(i).getOfficeHour()%></td>
	<td align = "center"><%=taList.get(i).getOfficeLoc()%></td>
	</tr>
<%
}
%>
</table>

<table border="1" cellpadding="10" cellspacing="2" width="100%">
<tr>
<td colspan="5" style='color:red; font-weight:bold'>Content Info (Chapters)</td>
</tr>
<%
	for (int i = 0; i<chapList.size(); i++){
%>
	<tr>
	<td><%=chapList.get(i).getTitle() %></td>
	</tr>
<%
}
%>
</table>
<table border="1" cellpadding="10" cellspacing="2">
<tr>
<td colspan="4" style='color:red; font-weight:bold'>Coursework History</td>
</tr>
<tr style='font-weight:bold'>
<td width ="14%" align="center">Coursework</td>
<td width ="20%" align="center">Release Date</td>
<td width = "20%" align ="center">Due date</td>
<td align="center">Link</td>
</tr>
<%
	for (int i = 0; i<profList.size(); i++){
%>
	<tr>
	<td width ="14%" align="center"><%=cwList.get(i).getName() %></td>
	<td width ="20%" align="center"><%=cwList.get(i).getRelDate()%></td>
	<td width = "10%"><%=cwList.get(i).getDueDate()%></td>
	<td align = "center"><a href=<%=cwList.get(i).getLink() %>><%=cwList.get(i).getLink()%></a></td>
	</tr>
<%
}
%>
</table>
</body>
</html>