<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
<title>删除课程信息
</title>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
    
    String strPage = (String)request.getParameter("page");
    String strClno = (String)request.getParameter("clno");
    String strUno = (String)request.getParameter("u");
    String strDate = (String)request.getParameter("d");
    String strPeriod = (String)request.getParameter("p");
	byte b[] = strPeriod.getBytes("ISO-8859-1");
	strPeriod = new String(b); 
%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<center>
            	<font size=6>删除教室借用信息</font>
            	<table width="230", height="160">
            	<tr><td>
            		<form id="delCourse" name="delCourseForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opBorrow/delBorrowOk&page=<%=strPage%>&clno=<%=strClno%>&u=<%=strUno%>&d=<%=strDate%>&p=<%=strPeriod%>">
           				<P><font size=4><br>
		           	     教室编号&nbsp;&nbsp;:&nbsp;<%=strClno%><br>
		           	     使用人编号:&nbsp;<%=strUno%><br>
		           	         使用日期&nbsp;&nbsp;:&nbsp;<%=strDate%><br>
		           	     节 &nbsp;&nbsp; 次&nbsp;&nbsp;:&nbsp;<%=strPeriod%><br>
		           	     </font><br><br>
			           	 <center>
							<input type="submit" value="确认删除" name="submit" style="width:100px;height:22px"/>
							<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opBorrow/<%=strPage%>')" style="width:100px;height:22px"/>
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