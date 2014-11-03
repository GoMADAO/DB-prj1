<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="cs4111.model.MStone" 
    import="cs4111.model.Courwork"
%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.io.*"%>
    <jsp:useBean id="courwork" class="cs4111.model.Courwork" scope="request"/>
<jsp:useBean id="plan" class="cs4111.model.Plan" scope="request"/>
<jsp:useBean id="mstonelist" class="cs4111.model.MStoneList" scope="request"/>
<jsp:useBean id="today" class="cs4111.model.DayTask" scope="request"/>
<jsp:useBean id="tomor" class="cs4111.model.DayTask" scope="request"/>

<jsp:setProperty name="tomor" property="*"/> 
<jsp:setProperty name="today" property="*"/> 
<jsp:setProperty name="mstonelist" property="*"/> 
<jsp:setProperty name="plan" property="*"/> 
<jsp:setProperty name="courwork" property="*"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CourseWork Plan</title>
<!-- xcharts -->
<!-- <script type="text/javascript" src="js/d3.js"></script>
<script type="text/javascript" src="js/xcharts.js"></script>
<link rel="stylesheet" href="css/xcharts.css"> -->

<!-- jscharts -->
<script type="text/javascript" src="js/jscharts.js"></script>


</head>
<body>
<% request.getAttribute("courwork");
	request.getAttribute("plan");
	request.getAttribute("mstonelist");
	request.getAttribute("today");
	request.getAttribute("tomor");
	String cwid = (String)request.getAttribute("cwid");
%>
<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>
<%=courwork.getCoursename() %></div>
<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>
<%=courwork.getName() %></div>
<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>
Release Date: <%=courwork.getRelDate() %> &nbsp; Due Date: <%=courwork.getDueDate() %></div>
<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>
Link: <a href=<%=courwork.getLink() %>><%=courwork.getLink() %></a></div>

<div style='padding:10px; color:black; font-size:15px; font-family: Courier New; font-weight:bold'>
Plan</div>
<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>
Start Date: <%=plan.getStdate()%>  &nbsp; End Date: <%=plan.getEddate()%></div>


<div style='padding:10px; color:black; font-size:15px; font-family: Courier New; font-weight:bold'>
Milestone</div>

<!-- xcharts -->
<!-- <figure style="width: 800px; height: 300px;" id="myChart"></figure> -->

<div id = "chartcontainer"></div>

<% ArrayList<MStone> msl =new ArrayList<MStone>(mstonelist.getMStoneList());
 for (int i=0; i<msl.size();i++){
	out.println(msl.get(i).getMstoneid()+"</br>");
	out.println(msl.get(i).getDesc()+"</br>");
} 
%>
<%
 try{
   String filename = request.getRealPath("data.json");
   File fp=new File(filename);
   PrintWriter pw = new PrintWriter(new FileOutputStream(filename),false); 
   String str = "{\"JSChart\" : { \"datasets\" : [ {\"type\" : \"line\",\"data\" : [";
   int wt = 0;
   for (int i=0; i<msl.size();i++){
	   if(i==msl.size()-1){
		   str = str+"{\"unit\" : \""+msl.get(i).getMstoneid()+"\",\"value\" : \""+msl.get(i).getWeight()+"\"}";
	   }
	   else{
	   str = str+"{\"unit\" : \""+msl.get(i).getMstoneid()+"\",\"value\" : \""+msl.get(i).getWeight()+"\"},";
	   }
   } 
   str = str+"] } ] }}";
    /* String str="{\"JSChart\" : { \"datasets\" : [ {\"type\" : \"line\",\"data\" : [ {\"unit\" : \"10\",\"value\" : \"20\"},{\"unit\" : \"20\",\"value\" : \"30\"},{\"unit\" : \"40\",\"value\" : \"10\"} ] } ] }}"; */ 
//out.println(str);
   pw.println(str);//写内容
   pw.close();
   //out.println("已将内容成功写入到文件！");
}catch(IOException e) {
   out.println("文件读取错误！");
}
%>
<input type="button" value="New"  onclick="location.href='addMstone.jsp?cwid='+<%=cwid %>+'&planid='+<%=plan.getPlanid() %>">

<br>
<div style='padding:10px; color:black; font-size:15px; font-family: Courier New'>Daily Tasks<%=request.getContextPath()%></div>

<%
String nextCon;
String nextDat;
String nextSep;
String nextWei;
String nextSta;
if(tomor.isEmpty()){
	nextCon ="";
	nextDat ="";
	nextSep = "";
	nextWei = "";
	nextSta = "";
}else{
	nextCon = tomor.getContent();
	nextDat = tomor.getDate().toString();
	nextSep = tomor.getSpend().toString();
	nextWei = tomor.getWeight().toString();
	nextSta = tomor.getStatus().toString();
}
		
	%>
<%-- <table width="100%">
 <tr>
 <td colspan="2"  width ="50%">Daily Task: <%=today.getDate()%> </td>
 <td colspan = "2">Plan for Tomorrow</td>
 </tr> --%>

<table>
<tr>
<td rowspan="5" >
<form action = "DayTaskServlet" method ="post" name="form1">
<input name="Tcontent" value=<%=today.getContent()%> type="text" style = "display:block">
<input name="Tspentime" value = <%=today.getSpend()%> type ="text" style = "display:block">
<input name="Tweight" value =<%=today.getWeight()%> type="text" style = "display:block">
<input name="Tstatus" value=<%=today.getStatus()%> type="text" style = "display:block">
<input name="Tplan" type ="hidden" value=<%=today.getPlanid()%>>
<input name="Ttask" type ="hidden" value=<%=today.getTaskid()%>>
<input name="TCid" type="hidden" value=<%=cwid %>>
<input type="submit">
</form>
</td>
<td>
<tr><td >Content</td></tr>
<tr><td >Spent time</td></tr>
<tr><td >Progress</td></tr>
<tr><td >Status</td></tr>
</td>
</tr>
</table>

<table>
<tr>
<td rowspan="5" >
<form action = "CourseworkServlet" method ="post" name="form2">
<input  type="text" style = "display:block" value=<%=nextCon %> />
<input  type="text" style = "display:block" value = <%=nextSep %> />
<input  type="text" style = "display:block" value =<%=nextWei %> />
<input  type="text" style = "display:block" value=<%=nextSta%> />
</form>
</td>
<td>
<tr><td >Content</td></tr>
<tr><td >Spent time</td></tr>
<tr><td >Progress</td></tr>
<tr><td >Status</td></tr>
</td>
</tr>
</table>


 <%-- <tr>
 <td width="10%">Content</td><td width="40%"><input value=<%=today.getContent()%> type="text"></td>
 <td width="10%">Content</td><td><%=nextCon %></td>
 </tr>
 <tr>
 <td width="10%">Spent time</td><td width="40%"><input value = <%=today.getSpend()%> type ="text"></td>
 <td width="10%">Spent time</td><td><%=nextSep %></td>
 </tr>      
 <tr>       
 <td width="10%">Progress</td><td width="40%"><input value =<%=today.getWeight()%> type="text"></td>
 <td width="10%">Progress</td><td><%=nextWei %></td>
 </tr>      
 <tr>       
 <td width="10%">Status</td><td width="40%"><input value=<%=today.getStatus()%> type="text"></td>
 <td width="10%">Status</td><td><%=nextSta%></td>
 </tr>
 </table> --%>

</body>

<script type="text/javascript">
var myChart = new JSChart('chartcontainer', 'line');
myChart.setDataJSON('data.json');
myChart.draw();
</script>
<!-- xcharts -->
<!-- <script>
(function () {
	var data = {
			  "xScale": "ordinal",
			  "yScale": "linear",
			  "type": "line",
			  "main": [
			    {
			      "className": ".pizza",
			      "data": [
			        {
			          "x": "Milestone-1",
			          "y": 1
			        } ,
			        {
			          "x": "Milestone-2",
			          "y": 6
			        },
			        {
			          "x": "Milestone-3",
			          "y": 13
			        },
			        {
			          "x": "Milestone-4",
			          "y": -3
			        },
			        {
			          "x": "Milestone-5",
			          "y": -4
			        },
			        {
			          "x": "Milestone-6",
			          "y": 9
			        },
			        {
			          "x": "Milestone-7",
			          "y": 6
			        } 
			      ]
			    }
			  ]
			};
			var myChart = new xChart('line', data, '#myChart');
  
}());
</script> -->
</html>