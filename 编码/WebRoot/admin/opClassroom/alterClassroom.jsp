<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="cvariable" class="myUtils.ComVariable" scope="page"></jsp:useBean>
<jsp:useBean id="dbCourse" class="opDB.ConnectDB" scope="page"></jsp:useBean>

<html>
<head>
<title>修改课程
</title>
	<script>
	function checkFrom(form) 
	{
		var strNum = form.holdNum.value;
		var length = strNum.length;
		if(length == 0)
		{
			alert("容纳人数不能为空!");
			form.holdNum.focus();
			return false;
		} else {
			for (var i = 0; i < length; i++) {
				if (strNum.charAt(i) < '0' || strNum.charAt(i) > '9') {
					alert("容纳人数不合法\n必须为30~300的整数");
					form.holdNum.focus();
					return false;
				}
			}
			if (strNum > 300 || strNum < 30) {
				alert("容纳人数不合法\n必须为30~300的整数");
				form.holdNum.focus();
				return false;
			}
		}
		return true;
	}
	</script>
  <%
	String strClno=(String)request.getParameter("clno");
	String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
    
    String strQuery = "SELECT * FROM Classroom ";
    strQuery += "where clno='"+strClno+"'";
    dbCourse.connect("CmisDB");
    ResultSet rs = dbCourse.queryDB(strQuery);
    
    String strDeviceType = "";
    int iHoldNum = 1;
    
    if (rs.next()) {
    	strDeviceType = rs.getString(2);
    	iHoldNum = rs.getInt(3);
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
            	<font size=6>修改教室信息</font>
            	<table width="220", height="160">
            	<tr><td>
            		<form id="alterClassroom" name="alterClassroomForm" method="post" action="<%=basePath%>admin/index.jsp?mainPage=opClassroom/alterClassroomOk">
            			<P> 教室编号:<input type="text" value="<%=strClno%>" name="ClassroomNum" readOnly="true" size=17/>
            			<br>容纳人数:<input type="text" name="holdNum" value="<%=iHoldNum%>" size=17/><br>
						     设&nbsp;&nbsp;&nbsp;&nbsp;备:<Select name="deviceType" style="width:131px">
											    		   <%
											    		   String strTemp[] = cvariable.getDevices();
											    		   int length = strTemp.length;
											    		   for (int i = 0; i < length; i++) {
											    		       if (strDeviceType.equals(strTemp[i])) { %>
											    		           <option value=<%=strTemp[i]%> selected><%=strTemp[i]%>
											    		       <% 
											    		       } else {
											    		       %>
											    		       	   <option value=<%=strTemp[i]%>><%=strTemp[i]%>
											    		   	   <%}
											    		   }%>
												   		</Select>
						</P>
						<center>
						   	<input type="submit" value="保存" name="submit" style="width:100px;height:22px"/>
						   	<input type="button" value="取消并返回" onclick="window.location.href('<%=basePath%>admin/index.jsp?mainPage=opClassroom/lookClassrooms')" style="width:100px;height:22px"/>
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