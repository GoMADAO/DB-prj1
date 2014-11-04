<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Coursework Plan</title>
<link rel="shortcut icon" href="js/pickadate.js-dev/demo/images/favicon.ico">
<link rel="stylesheet" href="js/pickadate.js-dev/demo/styles/css/main.css">
<link rel="stylesheet" href="js/pickadate.js-dev/lib/themes/default.css" id="theme_base">
<link rel="stylesheet" href="js/pickadate.js-dev/lib/themes/default.date.css" id="theme_date">
<link rel="stylesheet" href="js/pickadate.js-dev/lib/themes/default.time.css" id="theme_time">

<script type="text/javascript" src="js/jquery-1.2.6.js"></script>
<script type="text/javascript" src="js/jquery.jslider.js"></script>

<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="http://sandbox.runjs.cn/uploads/rs/6/qfkhlovy/jvslider.1.2.js"></script>
<script type="text/javascript" src="jQuery.setTip.js"></script>  
  
<style>
html, body {
background: #fff;
margin:10px;
}
.demo {
height: 100px;
background: #fc6;
}
</style>


</head>
<body>
<%-- 界面传值！！--%>
<%--<% String cwname = (String)request.getParameter("cwname");%>--%>

<!-- 测试用！！ -->
<%String cwname = "Introduction to Database II"; %>

<h1 style="color:#216fa0">New Coursework Plan</h1>
<p style="color:#216fa0;margin:-45px 0 0 0;">for course: <%=cwname %></p>
<form action="PlanServlet" method="post" name="form1">
<fieldset><div style="width:630px"><input name="stdate" id="stdate" class="fieldset__input js__datepicker" type="text" placeholder="Start Date&hellip;"></div></fieldset>
<fieldset><div style="width:630px"><input name="eddate" id="eddate" class="fieldset__input js__datepicker" type="text" placeholder="End Date&hellip;"></div></fieldset>
		<input type="submit" style="color:gray; margin:10px 10px 10px 0px; font-size: 18px;display:block;margin:-6px 0 0 0">
		<!-- 给servlet传值！！ -->
		<%-- <input name="mweight" id="transW" style="visibility:hidden">
		<input name="descr" id="transD" style="visibility:hidden">
		<input name="cwid" value=<%=cwid %> style="visibility:hidden">
		<input name="planid" value=<%=plid %> style="visibility:hidden">
		<input type="submit" onclick="confirm()" style="color:gray; margin:10px 10px 10px 0px; font-size: 18px;display:block;margin:-6px 0 0 0"> --%>
		
</form>
</body>

<script>
(function($) {  
    $.fn.setTip = function(options) {  
        var defaults = {  
            defaultValue: "",  
            focusColor: "#000000",  
            blurColor: "#ccc",  
            fontSize: "14pt"  
        }  
        var options = $.extend(defaults, options);  
        this.each(function() {  
            var thisSearch = $(this);  
            thisSearch.focus(function() {  
                if (thisSearch.val() == options.defaultValue) {  
                    thisSearch.css("color", options.focusColor);  
                    thisSearch.val("");  
                }  
            }).blur(function() {  
            if ( thisSearch.val() === undefined || thisSearch.val() == '') {  
                    thisSearch.css("color", options.blurColor);  
                    thisSearch.val(options.defaultValue);  
                }  
            }).css({ "color": options.blurColor, "font-size": options.fontSize });  
            if (thisSearch.val() == 'undefined' || thisSearch.val() == "") {  
                thisSearch.val(options.defaultValue);  
            } else if (thisSearch.val() != options.defaultValue) {  
                thisSearch.css("color", options.focusColor);  
            }  
        });  
    };  
})(jQuery);
</script>

    <script>window.jQuery||document.write('<script src="js/pickadate.js-dev/tests/jquery.2.0.0.js"><\/script>')</script>
    <script src="js/pickadate.js-dev/lib/picker.js"></script>
    <script src="js/pickadate.js-dev/lib/picker.date.js"></script>
    <script src="js/pickadate.js-dev/lib/picker.time.js"></script>
    <script src="js/pickadate.js-dev/lib/legacy.js"></script>
    <script src="js/pickadate.js-dev/demo/scripts/demo.js"></script>
    <script src="js/pickadate.js-dev/demo/scripts/rainbow.js"></script>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-36321179-2']);
        _gaq.push(['_trackPageview']);
        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
</body>
</html>