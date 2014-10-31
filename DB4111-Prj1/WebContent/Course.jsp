<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="cs4111.bean.TAassists"%>
    
<jsp:useBean id="ta" class="cs4111.bean.TAassistsList" scope="request"/> 
<jsp:setProperty name="ta" property="*"/>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Details</title>
</head>
<body>
<%
	request.getAttribute("ta");
	request.getAttribute("crsid");
	
	ArrayList<TAassists> taList = new ArrayList<TAassists>();
    taList = ta.getTAlist();
    request.setAttribute("taList", taList);
	
	int num = taList.size();
	for (int i = 0; i<num; i++){
		System.out.println(taList.get(i).getName());
	}
%>
</body>
</html>