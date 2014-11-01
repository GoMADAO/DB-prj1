<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="cs4111.model.MStone"
    %>
    <jsp:useBean id="courwork" class="cs4111.model.Courwork" scope="request"/>
<jsp:useBean id="plan" class="cs4111.model.Plan" scope="request"/>
<jsp:useBean id="mstonelist" class="cs4111.model.MStoneList" scope="request"/>

<jsp:setProperty name="mstonelist" property="*"/> 
<jsp:setProperty name="plan" property="*"/> 
<jsp:setProperty name="courwork" property="*"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CourseWork Plan</title>
</head>
<body>
<% request.getAttribute("courwork");
	request.getAttribute("plan");
	request.getAttribute("mstonelist");
%>
<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>
<%=courwork.getName() %></div>
<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>
Release Date: <%=courwork.getRelDate() %> &nbsp; Due Date: <%=courwork.getDueDate() %></div>
<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>
Link: <a href=<%=courwork.getLink() %>><%=courwork.getLink() %></a></div>

<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>
Plan</div>
<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>
Start Date: <%=plan.getStdate()%>  &nbsp; End Date: <%=plan.getEddate()%></div>

<% ArrayList<MStone> msl =new ArrayList<MStone>(mstonelist.getMStoneList());
for (int i=0; i<msl.size();i++){
	out.print(msl.get(i).getMstoneid());
	out.print(msl.get(i).getDesc());
}
%>
</body>
</html>