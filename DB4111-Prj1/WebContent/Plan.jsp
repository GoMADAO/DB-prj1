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