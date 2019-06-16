<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>
<jsp:useBean id="translator" class="myUtils.Translator" scope="page"></jsp:useBean>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>

<html>
<head>
<title>ѧ����Ϣ
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
	int distance = 10;//ÿ��ҳ����ʾ������
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
	
	public String getSnoFromRS(int index) {
		try {
			rs.absolute(index);
			return rs.getString(1);
		} catch (SQLException e) {
		}
		return null;	
	}
	%>
	<%
		String txtPath = "admin/source/enTozh.txt";
		translator.LoadVector(application.getRealPath(txtPath));
		String str = "SELECT * FROM Student ";
		String strName = request.getParameter("studentName");
		if (strName != null && strName != "") {
			byte b1[] = strName.trim().getBytes("ISO-8859-1");
			strName = new String(b1);
			String strSearchType = request.getParameter("searchType");
			if (strSearchType.equals("fuzzy")) {
				str += "where sname like '%"+strName+"%' ";
			} else {
				str += "where sname='"+strName+"' ";
			}
			String strDeptname = request.getParameter("deptname");
			byte b2[] = strDeptname.getBytes("ISO-8859-1");
			strDeptname = new String(b2);
			if (strDeptname.equals("ȫ��") == false) {
				str += " and deptname='"+strDeptname+"'";
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
	    	<font size=5>ѧ����Ϣ</font>
		    <form id="student" name="studentForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opStudent/lookStudents&id=1">
		    <P>ѧ������:<input type="text" name="studentName" size=15/>
		              ����Ժϵ:<Select name="deptname">
		               	   <option value="ȫ��">ȫ��
			    		   <%
			    		   String strTemp[] = cvariable.getDeptnames();
			    		   int length = strTemp.length;
			    		   for (int i = 0; i < length; i++) {
			    		   %>
			    		   <option value=<%=strTemp[i]%>><%=strTemp[i]%>
			    		   <%
			    		   }%>
		   		       </Select>
		                   ƥ��:<Select name="searchType">
		   		          <option value="fuzzy">ģ��
		   		          <option value="exact">��ȷ
		   		      </Select>
		   	<input type="submit" value="����" name="submit" style="width:80px;height:22px"/>
		    </form>
	    </center>
	</td></tr>
	</table>
	<br>
	<table background="images/backImage.jpg" border="1" style= "border-collapse:collapse" bordercolor=rgb(2, 50, 112) width="700", height="100%">
	<tr>
	<th>���</th>
	<%
	for (int i = 1; i <= count; i++)
	{%>
		<th>
		<%=translator.translate(myMeta.getColumnName(i))%>
		</th>
	<%
	}%>
	<th>�޸�</th>
	<th>ɾ��</th>
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
			<input type="button" value="�޸�" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opStudent/alterStudent&sno=<%=getSnoFromRS(i)%>')" style="width:50px;height:18px;background:#8888ff"/>
		</th>
		<th>
			<input type="button" value="ɾ��" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opStudent/delStudent&sno=<%=getSnoFromRS(i)%>')" style="width:50px;height:18px;background:#ff8888"/>
		</th>
		</tr>
	<%
	}%>
	</table>
	<br>
	<center>
	<table width="700", height="20">
	<tr><td>
	ҳ��:<%=getCurrentPage()%>/<%=getAllPages()%>
	<%
	if (getCurrentPage() > 1) {
	%>
	<a href ="<%=basePath%>admin/index.jsp?mainPage=opStudent/lookStudents&id=<%=getCurrentPage() - 1%>">��һҳ</a>
	<%
	}%>
	<%
	if (getCurrentPage() < getAllPages()) {
	%>
	<a href ="<%=basePath%>admin/index.jsp?mainPage=opStudent/lookStudents&id=<%=getCurrentPage() + 1%>">��һҳ</a>
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