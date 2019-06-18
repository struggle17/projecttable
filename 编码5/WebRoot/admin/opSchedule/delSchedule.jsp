<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
<title>删除开课信息
</title>
  <%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
    
	String strClno = (String)request.getParameter("clno");
	String strWeekday = (String)request.getParameter("w");
	byte b1[] = strWeekday.getBytes("ISO-8859-1");
	strWeekday = new String(b1);
	String strPeriod = (String)request.getParameter("p");
	byte b2[] = strPeriod.getBytes("ISO-8859-1");
	strPeriod = new String(b2);
  %>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<center>
            	<font size=6>删除开课信息</font>
            	<table width="300", height="160">
            	<tr><td>
            		<form id="delSchedule" name="delScheduleForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opSchedule/delScheduleOk&clno=<%=strClno%>&w=<%=strWeekday%>&p=<%=strPeriod%>">
            			<center>
            				<font size=4>教室编号:<%=strClno%>&nbsp;&nbsp;<br>
	           	    		    		 星 &nbsp;&nbsp; 期:<%=strWeekday%><br>
	           	     		               节 &nbsp;&nbsp; 次:<%=strPeriod%><br><br>
	            			</font>
							<input type="submit" value="确认删除" name="submit" style="width:100px;height:22px"/>
							<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opSchedule/lookSchedules')" style="width:100px;height:22px"/>
						</center>
            		</form>
            	</td></tr>
            	</table>
            	</center>
            </td></tr>
            </table>
        </td></tr>
        </table>
    </center>
</body>
</html>