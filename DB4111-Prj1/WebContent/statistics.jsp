<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Statistics</title>
<style>
body { margin: 40px auto; width: 500px; }
/* -------------------------------------- */
			ol { counter-reset: li; list-style: none;  *list-style: decimal;
font: 15px 'trebuchet MS', 'lucida sans'; padding: 0; margin-bottom: 4em; text-shadow: 0 1px 0 rgba(255, 255, 255, .5); }
ol ol { margin: 0 0 0 2em; }
/* -------------------------------------- */			
			.rounded-list a { position: relative; display: block; padding: .4em .4em .4em 2em;  *padding: .4em;
margin: .5em 0; background: #ddd; color: #444; text-decoration: none; -moz-border-radius: .3em; -webkit-border-radius: .3em; border-radius: .3em;  -webkit-transition: all .3s ease-out;
 -moz-transition: all .3s ease-out;
 -ms-transition: all .3s ease-out;
 -o-transition: all .3s ease-out;
 transition: all .3s ease-out;
}
.rounded-list a:hover { background: #eee; }
.rounded-list a:hover:before { -moz-transform: rotate(360deg); -webkit-transform: rotate(360deg); -moz-transform: rotate(360deg); -ms-transform: rotate(360deg); -o-transform: rotate(360deg); transform: rotate(360deg); }
.rounded-list a:before { content: counter(li); counter-increment: li; position: absolute; left: -1.3em; top: 50%; margin-top: -1.3em; background: #87ceeb; height: 2em; width: 2em; line-height: 2em; border: .3em solid #fff; text-align: center; font-weight: bold; -moz-border-radius: 2em; -webkit-border-radius: 2em; border-radius: 2em;  -webkit-transition: all .3s ease-out;
 -moz-transition: all .3s ease-out;
 -ms-transition: all .3s ease-out;
 -o-transition: all .3s ease-out;
 transition: all .3s ease-out;
}
/* -------------------------------------- */
			.rectangle-list a { position: relative; display: block; padding: .4em .4em .4em .8em;  *padding: .4em;
margin: .5em 0 .5em 2.5em; background: #ddd; color: #444; text-decoration: none;  -webkit-transition: all .3s ease-out;
 -moz-transition: all .3s ease-out;
 -ms-transition: all .3s ease-out;
 -o-transition: all .3s ease-out;
 transition: all .3s ease-out;
}
.rectangle-list a:hover { background: #eee; }
.rectangle-list a:before { content: counter(li); counter-increment: li; position: absolute; left: -2.5em; top: 50%; margin-top: -1em; background: #fa8072; height: 2em; width: 2em; line-height: 2em; text-align: center; font-weight: bold; }
.rectangle-list a:after { position: absolute; content: ''; border: .5em solid transparent; left: -1em; top: 50%; margin-top: -.5em;  -webkit-transition: all .3s ease-out;
 -moz-transition: all .3s ease-out;
 -ms-transition: all .3s ease-out;
 -o-transition: all .3s ease-out;
 transition: all .3s ease-out;
}
.rectangle-list a:hover:after { left: -.5em; border-left-color: #fa8072; }
/* -------------------------------------- */
			.circle-list li { padding: 2.5em; border-bottom: 1px dashed #ccc; }
.circle-list h2 { position: relative; margin: 0; }
.circle-list p { margin: 0; }
.circle-list h2:before { content: counter(li); counter-increment: li; position: absolute; z-index: -1; left: -1.3em; top: -.8em; background: #f5f5f5; height: 1.5em; width: 1.5em; border: .1em solid rgba(0, 0, 0, .05); text-align: center; font: italic bold 1em/1.5em Georgia, Serif; color: #ccc; -moz-border-radius: 1.5em; -webkit-border-radius: 1.5em; border-radius: 1.5em;  -webkit-transition: all .2s ease-out;
 -moz-transition: all .2s ease-out;
 -ms-transition: all .2s ease-out;
 -o-transition: all .2s ease-out;
 transition: all .2s ease-out;
}
.circle-list li:hover h2:before { background-color: #ffd797; border-color: rgba(0, 0, 0, .08); border-width: .2em; color: #444; -webkit-transform: scale(1.5); -moz-transform: scale(1.5); -ms-transform: scale(1.5); -o-transform: scale(1.5); transform: scale(1.5); }
</style>
</head>
<body>

<%
  String ttime = (String)request.getAttribute("TotalTime");
  String modif = (String)request.getAttribute("Modif");
  String nreg = (String)request.getAttribute("NumofReg");
  String nplan = (String)request.getAttribute("NumofPlan");
  String avgp = (String)request.getAttribute("AvgProg");
 %>
 <ol class="circle-list">
    <li>
    <h1>Statistics</h1>
    </li>
    <li>
    <h2>Time you have paid for this plan: <%=ttime %> Hours</h2>
    </li>
    <li>
    <h2>You have modified this plan for: <%=modif %> times</h2>
    </li>
    <li>
    <h2><%=nreg %> other students also register for this course, in which <%=nplan %> have made plan for this coursework.</h2>
    </li>
    <li>
    <h2>On average, they have finished <%=avgp %>% of the work.</h2>
  	</li>
 </ol>
 
<%--  
 <h1>Statistics</h1>
 <p>Time you have paid for this plan: <%=ttime %></p>
 <p>You have midified this plan for: <%=modif %> times</p>
 <p><%=nreg %> other students also register for this course, in which <%=nplan %> have made plan for this coursework.</p>
 <p>On average, they have finished <%=avgp %>% of the work.</p> --%>

</body>
</html>