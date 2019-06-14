<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>
<jsp:useBean id="translator" class="myUtils.Translator" scope="page"></jsp:useBean>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>

<html>
<head>
<title>取消批准教室借用信息
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
	
	public String getUnoFromRS(int index) {
		try {
			rs.absolute(index);
			return rs.getString(2);
		} catch (SQLException e) {
		}
		return null;
	}
	
	public String getDateFromRS(int index) {
		try {
			rs.absolute(index);
			return rs.getString(3).substring(0, 10);
		} catch (SQLException e) {
		}
		return null;
	}
	
	public String getPeriodFromRS(int index) {
		try {
			rs.absolute(index);
			return rs.getString(4);
		} catch (SQLException e) {
		}
		return null;
	}
	%>
	<%
		String txtPath = "admin/source/enTozh.txt";
		translator.LoadVector(application.getRealPath(txtPath));
		String str = "SELECT clno, uno, usedate, period FROM Borrow ";
		str += "where datediff(d, usedate, getdate()) <= 0 ";
		str += "and usestatus='T' ";
		String strName = request.getParameter("classroomNum");
		if (strName != null && strName != "") {
			byte b1[] = strName.trim().getBytes("ISO-8859-1");
			strName = new String(b1);
			String strSearchType = request.getParameter("searchType");
			if (strSearchType.equals("fuzzy")) {
				str += "and clno like '%"+strName+"%' ";
			} else {
				str += "and clno='"+strName+"' ";
			}
		}
		dbCourse.connect("CmisDB");
		rs = dbCourse.queryDB(str);
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
	    	<font size=5>取消批准教室借用信息</font>
		    <form id="sCourse" name="sCourse" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opBorrow/disApprovalBorrows&id=1">
		    <P>教室编号:<input type="text" name="classroomNum" size=15/>
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
	<th>详情</th>
	<th>取消批准</th>
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
		for (int j = 1; j <= count; j++){ 
			if (myMeta.getColumnName(j).equals("usedate")) {
		%>
				<th>
				<%=rs.getString(j).substring(0, 10)%>
				</th>
			<% 
			} else if (myMeta.getColumnName(j).equals("usefor") && rs.getString(j).length() > 3){%>
				<th>
				<%=rs.getString(j).substring(0, 3)+"..."%>
				</th>
			<% 
			} else {%>
				<th>
				<%=rs.getString(j)%>
				</th>
		<%  }
		}%>
		<th>
			<input type="button" value="详情" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opBorrow/detailBorrow&page=disApprovalBorrows&clno=<%=getClnoFromRS(i)%>&u=<%=getUnoFromRS(i)%>&d=<%=getDateFromRS(i)%>&p=<%=getPeriodFromRS(i)%>')" style="width:50px;height:18px;background:#8888ff"/>
		</th>
		<th>
			<input type="button" value="取消批准" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opBorrow/disApprovalOk&clno=<%=getClnoFromRS(i)%>&u=<%=getUnoFromRS(i)%>&d=<%=getDateFromRS(i)%>&p=<%=getPeriodFromRS(i)%>')" style="width:70px;height:18px;background:#8888ff"/>
		</th>
		<th>
			<input type="button" value="删除" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opBorrow/delBorrow&page=disApprovalBorrows&clno=<%=getClnoFromRS(i)%>&u=<%=getUnoFromRS(i)%>&d=<%=getDateFromRS(i)%>&p=<%=getPeriodFromRS(i)%>')" style="width:50px;height:18px;background:#ff8888"/>
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
	<a href ="<%=basePath%>admin/index.jsp?mainPage=opBorrow/disApprovalBorrows&id=<%=getCurrentPage() - 1%>">上一页</a>
	<%
	}%>
	<%
	if (getCurrentPage() < getAllPages()) {
	%>
	<a href ="<%=basePath%>admin/index.jsp?mainPage=opBorrow/disApprovalBorrows&id=<%=getCurrentPage() + 1%>">下一页</a>
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