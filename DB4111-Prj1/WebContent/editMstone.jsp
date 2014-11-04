<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Milestone</title>
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
      <script type="text/javascript">  
          $(document).ready(function () {  
              $("#desc").setTip({defaultValue:"Milestone Description"});  
          });  
      </script>
<script>
function confirm(){
	var weight_v = document.getElementById('text').innerHTML;
	document.getElementById('transW').value = weight_v;
	var desc_v = document.getElementById('desc').value;
	document.getElementById('transD').value = desc_v;
	$('form1').submit();
}
</script>  
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

<% String ddl = (String)request.getParameter("mstddl");%>
<% String desc = (String)request.getParameter("mstdesc");%>
<% String wght = (String)request.getParameter("mstwght");%>
<% String idnum = (String)request.getParameter("mstid");%>
<% String plid = (String)request.getParameter("planid");%>
<% String cwid = (String)request.getParameter("cwid");%> 
<%-- <!-- 要传过来的值！！ -->
<%-- <!-- 测试用的！！ -->
<%String ddl ="11-05-2014";%>
<%String desc ="test description"; %>
<%String wght = "30"; %>
<%String idnum = "37"; %>
<%String cwid = "" %>;
<%String plid = "" %>; --%>


<h1 style="color:#216fa0">Milestone <%=idnum %></h1>
<form action="MstoneServlet" method="post" name="form1">
		<div style="width:630px">Deadline: <%=ddl %></div>
		<div style="color:gray">Milestone Weight (0-100%)</div>
		<div id="slider"></div>
		<div id="text" style="margin:0 0 20px 0"><%=wght %>%</div>
		<textarea id="desc" name="descinput" class="fn setTip" style="width:630px; height:200px; display:block;"><%=desc %></textarea>
		<input name="mweight" id="transW" style="visibility:hidden">
		<input name="desc" id="transD" style="visibility:hidden">
		
		 <input name="cwid" value=<%=cwid %> style="visibility:hidden">
		<input name="planid" value=<%=plid %> style="visibility:hidden"> 
		<input name="mstid" value=<%=idnum %> style="visibility:hidden"> 
		<!-- 取消注释！！传值进来！ -->
		<input type="submit" onclick="confirm()" style="color:gray; margin:10px 10px 10px 0px; font-size: 18px;display:block;margin:-6px 0 0 0">
</form>
</body>

<script>
    $(function () {
        var w = 500;
        $('#slider').jvslider({
            vertical: false,
            width: 600,
            barHeight: 30,
            barBorder: 1,
            barBorderColor: '#aaa',
            barRadius: 2,
            barBackground: '#fff',
            handleWidth: 30,
            handleHeight: 30,
            handleBorder: 1,
            handleBorderColor: '#aaa',
            handleRadius: 2,
            handleBackground: '#fff',
            handleDownBackground: '#eee',
            processBackground: '#53a8e3',
            percent: <%=Integer.parseInt(wght)%>,
            slide: function (percent) {
                var np = percent / 100;
                $('#text').html(String(Math.floor(percent))+"%");
            },
            click: function (percent) {
                var np = percent / 100;
                $('#text').html(String(Math.floor(percent))+"%");
            }
        });
        //参数（全部为可选项）说明：
        //vertical: 是否使用纵向滑动条，默认false
        //width: 滑动区域宽度
        //barHeight: 滑动区域高度
        //barBorder: 滑动区域边框宽度
        //barBorderColor: 滑动区域边框颜色
        //barRadius: 滑动区域圆角
        //barBackground: 滑动区域背景
        //handleWidth: 滑块宽度
        //www.HelloCsharp.com
        //handleHeight: 滑块高度
        //handleBorder: 滑块边框宽度
        //handleBorderColor: 滑块边框颜色
        //handleRadius: 滑块圆角
        //handleBackground: 滑块背景
        //handleDownBackground: 滑块点击时北京
        //processBackground: 进度条背景
        //percent: 起始百分比
        //slide: 滑块滑动时调用程序
        //click: 点击滑动区域时调用程序
    });
</script>
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