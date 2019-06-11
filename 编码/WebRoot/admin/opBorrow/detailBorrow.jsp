<%@ page language="java" contentType="text/html; charset=utf-8"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>
<%@ page language="java" import="java.sql.*"%>

<html>
<head>
<title>教室借用详情
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
    
	String strQuery = "select * from Borrow where clno='"+strClno+"' and uno='"+strUno+"' and period='"+strPeriod+"' ";
	strQuery += "and year(usedate)="+year+" and month(usedate)="+month+" and day(usedate)="+day+"";
	dbCourse.connect("CmisDB");
	ResultSet rs = dbCourse.queryDB(strQuery);
	
	String strUsefor = "";
	String strUsestatus = "";
	if (rs.next()) {
		strUsefor = rs.getString(5);
		strUsestatus = rs.getString(6);
	}
%>
</head>
<body>
    <center>
        <table border="0" cellpadding="0" cellspacing="0" width="800" height="410">
        <tr><td align="center">
            <table border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="350">
            <tr><td>
            	<center>
            	<font size=6>教室借用详情</font>
            	<table width="270", height="250">
            	<tr><td>
	            	<font size=4>
	           	     教室编号&nbsp;&nbsp;:&nbsp;<%=strClno%><br>
	           	     使用人编号:&nbsp;<%=strUno%><br>
	           	         使用日期&nbsp;&nbsp;:&nbsp;<%=strDate%><br>
	           	     节 &nbsp;&nbsp; 次&nbsp;&nbsp;:&nbsp;<%=strPeriod%><br>
	           	         是否批准&nbsp;&nbsp;:&nbsp;<%=strUsestatus%><br>
	           	         用 &nbsp;&nbsp; 途&nbsp;&nbsp;:&nbsp;<%=strUsefor%>
	            	</font>
            		<br><br>
            		<center>
				   	<input type="button" value="返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opBorrow/<%=strPage%>')" style="width:125px;height:22px"/>
            		</center>
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