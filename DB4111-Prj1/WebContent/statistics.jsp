<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Statistics</title>
</head>
<body>

<%
  String ttime = (String)request.getAttribute("TotalTime");
  String modif = (String)request.getAttribute("Modif");
  String nreg = (String)request.getAttribute("NumofReg");
  String nplan = (String)request.getAttribute("NumofPlan");
  String avgp = (String)request.getAttribute("AvgProg");
 %>
 <h1>Statistics</h1>
 <p>Time you have paid for this plan: <%=ttime %></p>
 <p>You have midified this plan for: <%=modif %> times</p>
 <p><%=nreg %> other students also register for this course, in which <%=nplan %> have made plan for this coursework.</p>
 <p>On average, they have finished <%=avgp %>% of the work.</p>

</body>
</html>