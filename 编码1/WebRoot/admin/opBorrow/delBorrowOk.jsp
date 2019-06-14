<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>

<html>
<head>
<title>删除教室借用信息
</title>
<%!
	boolean isDelOk = false;
%>
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
	
	int year = 0;
	int month = 0;
	int day = 0;
	
	if (strDate != null && strDate.length() == 10) {
		year = Integer.parseInt(strDate.substring(0, 4));
		month = Integer.parseInt(strDate.substring(5, 7));
		day = Integer.parseInt(strDate.substring(8, 10));
	}
    
	String strDel = "delete from Borrow where clno='"+strClno+"' and uno='"+strUno+"' and period='"+strPeriod+"' ";
	strDel += "and year(usedate)="+year+" and month(usedate)="+month+" and day(usedate)="+day+"";
	dbCourse.connect("CmisDB");
	isDelOk = dbCourse.updateDB(strDel);
    dbCourse.disConnect();
%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<% if (isDelOk) {
            	%>
            	<center>
            	<font size=6>删除教室借用成功!</font>
            	<table width="270", height="250">
            	<tr><td><P>		
            		<font size=4>
	           	     教室编号&nbsp;&nbsp;:&nbsp;<%=strClno%><br>
	           	     使用人编号:&nbsp;<%=strUno%><br>
	           	         使用日期&nbsp;&nbsp;:&nbsp;<%=strDate%><br>
	           	     节 &nbsp;&nbsp; 次&nbsp;&nbsp;:&nbsp;<%=strPeriod%><br>
	           	     已经成功删除!
	           	     </font>
            		<br><br>
            		<center>
				   	<input type="button" value="返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opBorrow/<%=strPage%>')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	} else {
            	%>
            	<center>
            	<font size=6>删除教室借用信息失败!</font>
            	<table width="270", height="200">
            	<tr><td>
          			<center>
          			<font size=4>
            		原因:未知名错误!
            		</font>
          			<br><br><br>
				   	<input type="button" value="返回后台首页" onclick="window.location.href('<%=basePath%>admin/index.jsp')" style="width:125px;height:22px"/>
				   	</center>
            	</td></tr>
            	</table>
            	</center>
            	<% 
            	}%>
            </td></tr>
            </table>
        </td></tr>
        </table>
    </center>
</body>
</html>