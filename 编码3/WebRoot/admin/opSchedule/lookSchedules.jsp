<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>
<jsp:useBean id="translator" class="myUtils.Translator" scope="page"></jsp:useBean>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>

<html>
<head>
<title>开课信息
</title>
  <%
	String pageId=(String)request.getParameter("id");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
  %>
</head>
<body>
	<%!
	ResultSet rs = null;
	ResultSetMetaData myMeta = null;
	int distance = 10;//每个页面显示的行数
	int count = 0;
	int begin = 1;
	int end = getPageDistance();

	public int getResultRows() {
		int rows = 0;
		if (rs != null) {
			try {
				rs.absolute(-1);
				rows = rs.getRow();
				rs.beforeFirst();
			} catch (SQLException e) {
			}
		}
		return rows; 
	}
	
	public int getCurrentPage() {
		int temp = begin - 1;
		return (temp / getPageDistance()) + 1;
	}
	
	public int getAllPages() {
		int temp = getResultRows() - 1;
		return (temp / getPageDistance()) + 1;
	}
	
	public int getPageDistance() {
		return distance;
	}
	
	public void nextPage() {
		begin += getPageDistance();
		end += getPageDistance();
	}
	
	public String getClnoFromRS(int index) {
		try {
			rs.absolute(index);
			return rs.getString(1);
		} catch (SQLException e) {
		}
		return null;	
	}
	
	public String getWeekdayFromRS(int index) {
		try {
			rs.absolute(index);
			return rs.getString(2);
		} catch (SQLException e) {
		}
		return null;	
	}
	
	public String getPeriodFromRS(int index) {
		try {
			rs.absolute(index);
			return rs.getString(3);
		} catch (SQLException e) {
		}
		return null;	
	}
	%>
	<%
		String txtPath = "admin/source/enTozh.txt";
		translator.LoadVector(application.getRealPath(txtPath));
		String strQuery = "SELECT clno, weekday, period, cname, tname FROM Schedule, Course, Teacher ";
		strQuery += "where Course.cno=Schedule.cno and Teacher.tno=Schedule.tno ";
		String strNum = request.getParameter("lessonNum");
		if (strNum != null && strNum != "") {
		String strSearchType = request.getParameter("searchType");
			if (strSearchType.equals("fuzzy")) {
				strQuery += "and clno like '%"+strNum+"%' ";
			} else {
				strQuery += "and clno='"+strNum+"' ";
			}
		}
		dbCourse.connect("CmisDB");
		rs = dbCourse.queryDB(strQuery);
		myMeta = rs.getMetaData();
		count = myMeta.getColumnCount();
	%>
	<%
	if (pageId != null) {
		int temp = Integer.parseInt(pageId);
		if (temp <= getAllPages()) { 
			begin = 1 + (temp - 1) * getPageDistance();
			end = temp * getPageDistance();
		}
	}
	%>
	<br>
    <table background="images/backImage.jpg" border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="100">
    <tr><td>
	    <center>
	    	<font size=5>教师开课信息</font>
		    <form id="iClassroom" name="classroomForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opSchedule/lookSchedules&id=1">
		    <P>教室编号:<input type="text" name="lessonNum" size=15/>
		    	 匹配:<Select name="searchType">
		   		     	<option value="fuzzy">模糊
		   		     	<option value="exact">精确
		   		     </Select>
		   	<input type="submit" value="查找" name="submit" style="width:80px;height:22px"/>
		    </form>
	    </center>
	</td></tr>
	</table>
	<br>
	<table background="images/backImage.jpg" border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="100%">
	<tr>
	<th>序号</th>
	<%
	for (int i = 1; i <= count; i++)
	{%>
		<th>
		<%=translator.translate(myMeta.getColumnName(i))%>
		</th>
	<%
	}%>
	<th>修改</th>
	<th>删除</th>
	</tr>
	<%
	if (getResultRows() < end )
	{
		end = getResultRows();
	}
	for (int i = begin; i <= end; i++) 
	{
		rs.absolute(i);
	%><tr><th><%=i%></th><%
		for (int j = 1; j <= count; j++)
		{%>
			<th>
			<%=rs.getString(j)%>
			</th>
		<% 
		}%>
		<th>
			<input type="button" value="修改" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opSchedule/alterSchedule&clno=<%=getClnoFromRS(i)%>&w=<%=getWeekdayFromRS(i)%>&p=<%=getPeriodFromRS(i)%>')" style="width:50px;height:18px;background:#8888ff"/>
		</th>
		<th>
			<input type="button" value="删除" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opSchedule/delSchedule&clno=<%=getClnoFromRS(i)%>&w=<%=getWeekdayFromRS(i)%>&p=<%=getPeriodFromRS(i)%>')" style="width:50px;height:18px;background:#ff8888"/>
		</th>
		</tr>
	<%
	}%>
	</table>
	<br>
	<center>
	<table width="700", height="20">
	<tr><td>
	页次:<%=getCurrentPage()%>/<%=getAllPages()%>
	<%
	if (getCurrentPage() > 1) {
	%>
	<a href ="<%=basePath%>admin/index.jsp?mainPage=opSchedule/lookSchedules&id=<%=getCurrentPage() - 1%>">上一页</a>
	<%
	}%>
	<%
	if (getCurrentPage() < getAllPages()) {
	%>
	<a href ="<%=basePath%>admin/index.jsp?mainPage=opSchedule/lookSchedules&id=<%=getCurrentPage() + 1%>">下一页</a>
	<%
	}%>
   	<%
  	dbCourse.disConnect();
  	%>
	</td></tr>
	</table>
	</center>
</body>
</html>