<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="cs4111.model.MStone" import="cs4111.model.Courwork"
%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page import="java.io.*"%>
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
<input type="button" value="New"  onclick="location.href='addMstone.jsp?cwid='+<%=cwid %>+'&planid='+<%=plan.getPlanid() %>">

<div id = "chartcontainer"></div>

<%-- <% ArrayList<MStone> msl =new ArrayList<MStone>(mstonelist.getMStoneList());
 for (int i=0; i<msl.size();i++){
	out.println(msl.get(i).getMstoneid()+"</br>");
	out.println(msl.get(i).getDesc()+"</br>");
} 
%> --%>

<% 
ArrayList<MStone> msl =new ArrayList<MStone>(mstonelist.getMStoneList());
Date date=plan.getStdate();
%>
<%
for (int i=0; i<msl.size();i++){
	out.print("<a href=\"#\" class=\"css3-button css3-button_blue-g\" id=\"blk"+msl.get(i).getMstoneid()+"\" data-tooltip=\"Weight: "+msl.get(i).getWeight()+"%\">Milestone"+msl.get(i).getMstoneid()+"</a>");
}
%>
<!-- <a href="#" class="css3-button css3-button_blue-g" id="example" data-tooltip="Weight: 20%">Milestone 1</a>
<a href="#" class="css3-button css3-button_blue-g" id="example1" data-tooltip="Weight: 30%">Milestone 1</a> -->
<%
 try{
   String filename = request.getRealPath("data.json");
   File fp=new File(filename);
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
    /* String str="{\"JSChart\" : { \"datasets\" : [ {\"type\" : \"line\",\"data\" : [ {\"unit\" : \"10\",\"value\" : \"20\"},{\"unit\" : \"20\",\"value\" : \"30\"},{\"unit\" : \"40\",\"value\" : \"10\"} ] } ] }}"; */ 
	//out.println(str);
   pw.println(str);
   pw.close();
   //out.println("已将内容成功写入到文件！");
}catch(IOException e) {
   out.println("IO Error！");
}
%>

</body>
<%-- <script>
function mstblock(){
<% for (int i=0; i<msl.size();i++){
String astr = "<a href=\"#\" class=\"css3-button css3-button_blue-g\" id=\"blk"+msl.get(i).getMstoneid()+"\" data-tooltip=\"Weight: "+msl.get(i).getWeight()+"%\">Milestone"+msl.get(i).getMstoneid()+"</a>";
%>
document.getElementById("mstblk").innerHTML(<%=astr%>);
<%}%>
}
</script> --%>
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
myChart.setSize(600, 400);
myChart.setAxisNameX('#Days used for each Milestone');
myChart.setAxisNameY(' ');
myChart.setTitle('Milestone Chart');
myChart.setTitleColor('#3474c2');
myChart.setTitleFontSize(20);
myChart.setAxisValuesSuffixY('%');
myChart.draw();
</script>
</html>