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

<script type="text/javascript" src="js/jscharts.js"></script>
<link rel="stylesheet" href="css/darktooltip.css">
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery.darktooltip.js"></script>

<style type="text/css">
.css3-button{
	display:block;
	float:left;
	margin:10px 10px 10px 10px;
	padding:10px 10px;
	width: 80px; /*width is just for demo. Delete width if you want button to expand depending on the length of text inside.*/
	height:13px;
	text-align:center;
	color:#fff;
	font-size:12px;
	text-decoration:none;
	-webkit-border-radius: 4px;    
    		border-radius: 4px;
	border:1px solid #999;
	-webkit-transition: background 100ms ease-in;
		-moz-transition: background 100ms ease-in;
        -ms-transition: background 100ms ease-in;
        -o-transition: background 100ms ease-in;
		transition: background 100ms ease-in;
}
.css3-button_blue-g{
	background: #4ba2c6; /* Old browsers */
	background:  -webkit-radial-gradient(100% 0%, circle contain, rgba(255, 255, 202, 0.3), rgba(255, 255, 255, 0.0) 40%), -webkit-linear-gradient(top,  #4ba2c6 0%,#328cb0 100%);  /*Chrome10+,Safari5.1+ */
	background: radial-gradient(circle at 100% 0%, rgba(255,255,255,.3) 0%,rgba(255,255,255,0) 40%), linear-gradient(to bottom,  #4ba2c6 0%,#328cb0 100%); /* W3C */
	border-color:#4ba2c6;
	-webkit-box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, .5), 0px 0px 2px 3px rgba(147, 147, 147, .25);        
        	box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, .5), 0px 0px 2px 3px rgba(147, 147, 147, .25);
}
</style>

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

<% 
ArrayList<MStone> msl =new ArrayList<MStone>(mstonelist.getMStoneList());
Date date=plan.getStdate();
%>
<%

for (int i=0; i<msl.size();i++){
	out.print("<a href=\"editMstone.jsp?mstid="+msl.get(i).getMstoneid()
			+"&planid="+plan.getPlanid()+"&mstwght="+msl.get(i).getWeight()
			+"&cwid="+cwid+"&mstddl="+msl.get(i).getDeadline()+"&mstdesc="+msl.get(i).getDesc()
			+"\" class=\"css3-button css3-button_blue-g\" id=\"blk"
		+msl.get(i).getMstoneid()+"\" data-tooltip=\"Weight: "
		+msl.get(i).getWeight()+"%\">Milestone"
		+msl.get(i).getMstoneid()+"</a>");
}
%>
<div id = "chartcontainer"></div>
<input type="button" value="New"  onclick="location.href='addMstone.jsp?cwid='+<%=cwid %>+'&planid='+<%=plan.getPlanid() %>">

<%
 try{
   String filename = request.getRealPath("data.json");
 	File fp= new File(filename);
   PrintWriter pw = new PrintWriter(new FileOutputStream(filename),false); 
   String str = "{\"JSChart\" : { \"datasets\" : [ {\"type\" : \"line\",\"data\" : [{\"unit\" : \"0\",\"value\" : \"0\"},";
   int wt = 0;
   for (int i=0; i<msl.size();i++){
	   Date recDate = new Date(msl.get(i).getDeadline().getTime());
	   long delta = (recDate.getTime()-date.getTime())/(24*60*60*1000);
	   /* out.println(delta); */
	   if(i==msl.size()-1){
		   str = str+"{\"unit\" : \""+delta+"\",\"value\" : \""+msl.get(i).getWeight()+"\"}";
	   }
	   else{
	   str = str+"{\"unit\" : \""+delta+"\",\"value\" : \""+msl.get(i).getWeight()+"\"},";
	   }
   } 
   str = str+"] } ] }}";
   pw.println(str);
   pw.close();
   //out.println("已将内容成功写入到文件！");
}catch(IOException e) {
   out.println("IO Error！");
}
%>

<div style='padding:10px; color:black; font-size:15px; font-family: Courier New; font-weight:bold'>Daily Tasks<%=request.getContextPath()%></div>

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

<table border="1" cellpadding="10" cellspacing="2" width = 100%>
<tr>
 <td width="50%">Daily Task: <%=today.getDate()%> </td>
 <td width="50%">Plan for Tomorrow</td>
</tr>
<tr>
<td width="50%">
<form action = "DayTaskServlet" method ="post" name="form1" >
Content<input name="Tcontent" value=<%=today.getContent()%> type="text" style = "display:block">
Spent time<input name="Tspentime" value = <%=today.getSpend()%> type ="text" style = "display:block">
Progress<div><input name="Tweight" value =<%=today.getWeight()%> type="text">%</div>
<%-- Status<input name="Tstatus" value=<%=today.getStatus()%> type="text" style = "display:block"> --%>
Finished
<input type="radio" id="finished" name="status_rad" value="finished" />
Unfinished
<input type="radio" id="unfinished" name="status_rad" value="unfinished"/>

<input name="Tstatus" id="status" type="hidden" value=<%=today.getStatus()%>>
<input name="Tplan" type ="hidden" value=<%=today.getPlanid()%>>
<input name="Ttask" type ="hidden" value=<%=today.getTaskid()%>>
<input name="TCid" type="hidden" value=<%=cwid %>>
<input name="Tcheck" type="hidden" value="today">
<input type="submit" onclick="getstatus()" style="display:block">
</form>
</td>
<td width="50%">
<form action = "DayTaskServlet" method ="post" name="form2">
Content <input  type="text" style = "display:block" value=<%=nextCon %>>
Spent time<input  type="text" style = "display:block" value = <%=nextSep %>>
Progress<div><input  type="text" value =<%=nextWei %>>%</div>
<%-- Status <input  type="text" style = "display:block" value=<%=nextSta%>>  --%>
Finished
<input type="radio" id="finished_next" name="status_rad" value="finished" />
Unfinished
<input type="radio" id="unfinished_next" name="status_rad" value="unfinished"/>

<input name="Tstatus" id="status_next" type="hidden" value=<%=nextSta %>>
<input name="TCid" type="hidden" value=<%=cwid %>>
<input name="Tcheck" type="hidden" value="tomor">
<input name="Tplan" type ="hidden" value=<%=today.getPlanid()%>>
<input name="Ttask" type ="hidden" value=<%=tomor.getTaskid()%>>
<input type="submit" onclick="getstatus_next()" style="display:block">

</form>
</td>
</tr>
</table>
</body>

<script>
$(document).ready( function(){
	if(document.getElementById('status').value=="finished"){
		document.getElementById('finished').checked = "checked";
	}else{
		document.getElementById('unfinished').checked = "checked";
	}
	
	if(document.getElementById('status_next').value=="finished"){
		document.getElementById('finished_next').checked = "checked";
	}else{
		document.getElementById('unfinished_next').checked = "checked";
	}
});
</script>

<script>
function getstatus(){
	if(document.getElementById('finished').checked){
		document.getElementById('status').value = 'finished';
	}else {
		document.getElementById('status').value = 'unfinished';
	}
}
function getstatus_next(){
	if(document.getElementById('finished_next').checked){
		document.getElementById('status_next').value = 'finished_next';
	}else {
		document.getElementById('status_next').value = 'unfinished_next';
	}
}
</script>

<script>
$(document).ready( function(){
	<%
	for (int i=0; i<msl.size();i++){
		out.print("$('#blk"+msl.get(i).getMstoneid()+"').darkTooltip();");
	}
	%> 
	
});
</script>
<script type="text/javascript">
var myChart = new JSChart('chartcontainer', 'line');
myChart.setDataJSON('data.json');
myChart.setSize(1000, 500);
myChart.setAxisNameX('#Days used for each Milestone');
myChart.setAxisNameY(' ');
myChart.setTitle('Milestone Chart');
myChart.setTitleColor('#3474c2');
myChart.setTitleFontSize(20);
myChart.setAxisValuesSuffixY('%');
myChart.draw();
</script>
</html>